// sho_qdata_bloc.dart
import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:wifi_iot/wifi_iot.dart';

import 'connectivity_check.dart';


part 'sho_qdata_event.dart';
part 'sho_qdata_state.dart';
part 'sho_qdata_bloc.freezed.dart';

enum _Conn { idle, connecting, connected }

@injectable
class ShoQdataBloc extends Bloc<ShoQdataEvent, ShoQdataState> {
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  StreamSubscription<ReachResult>? _reachSub;

  final Map<String, dynamic> _analysisAccum = {};
  final StringBuffer _partialBuffer = StringBuffer();

  // Connection control
  _Conn _conn = _Conn.idle;
  bool _disconnected = false;
  String? _lastError;
  Completer<void>? _connectedCompleter;
  final List<String> _outbox = [];

  ShoQdataBloc() : super(const ShoQdataState.initial()) {
    on<Connect>(_onConnect);
    on<SendData>(_onSendData);

    on<_WsFrame>(_onWsFrame);
    on<_WsClosed>(_onWsClosed);
    on<_WsError>(_onWsError);
    on<ClearData>((_, emit) async {
      emit(const ShoQdataState.success({})); // 👈 empty map

      await WiFiForIoTPlugin.forceWifiUsage(true);

      _analysisAccum.clear();
      _partialBuffer.clear();
      _disconnected = false;
      _lastError = null;
      print("🧹 Cleared accumulated data");
      emit(const ShoQdataState.initial());
    });

    _startReachabilityWatch();
  }

  void _startReachabilityWatch() {
    _reachSub?.cancel();
    _reachSub = Reachability.statusStream().listen((res) {
      if (res.status == ReachStatus.server_up && _conn != _Conn.connected) {
        add(const Connect());
      }
    });
  }


  void _emitAccumulated(Emitter<ShoQdataState> emit) {
    if (!emit.isDone) {
      emit(ShoQdataState.success(Map.of(_analysisAccum)));
    }
  }

  Future<void> _onConnect(Connect event, Emitter<ShoQdataState> emit) async {

    print("➡️ _onConnect called");
    if (_conn == _Conn.connecting) {
      print("⏳ Already connecting; skipping");
      return;
    }

    _conn = _Conn.connecting;
    _connectedCompleter = Completer<void>();

    // Ensure routing is WAN (unpin from RTSP AP)
    final routed = await Reachability.ensureInternetRoute();
    if (!routed) {
      print("❌ No validated Internet route");
      _conn = _Conn.idle;
      if (!emit.isDone) emit(const ShoQdataState.error("No internet connection."));
      add(_WsError("No internet"));
      _connectedCompleter?.completeError(StateError("no-internet"));
      return;
    }

    // Split check
    final rr = await Reachability.check();
    switch (rr.status) {
      case ReachStatus.offline:
      case ReachStatus.captive:
        print("❌ No internet (status: ${rr.status})");
        _conn = _Conn.idle;
        if (!emit.isDone) emit(const ShoQdataState.error("No internet connection."));
        add(_WsError("No internet"));
        _connectedCompleter?.completeError(StateError("no-internet"));
        return;
      case ReachStatus.online_no_server:
        print("❌ Server unreachable");
        _conn = _Conn.idle;
        if (!emit.isDone) emit(const ShoQdataState.error("Server unreachable on port 8070."));
        add(_WsError("Server unreachable"));
        _connectedCompleter?.completeError(StateError("server-unreachable"));
        return;
      case ReachStatus.server_up:
        break;
    }

    // Clean previous session
    await _subscription?.cancel();
    await _channel?.sink.close();
    _analysisAccum.clear();
    _partialBuffer.clear();
    _disconnected = false;
    _lastError = null;

    try {
      final uri = Uri.parse('ws://93.127.217.36:8070/ws/analyze');
      print("🌐 Connecting to $uri");
      _channel = WebSocketChannel.connect(uri);

      // Attach listener BEFORE marking connected
      _subscription = _channel!.stream.listen(
            (message) {
          if (message is String) {
            print("📥 Received frame: ${message.length > 300 ? message.substring(0, 300) + '…' : message}");
            add(ShoQdataEvent.wsFrame(message));
          }
        },
        onError: (error) {
          print("🛑 WS stream error: $error");
          add(ShoQdataEvent.wsError(error.toString()));
        },
        onDone: () {
          print("🔒 WS stream done");
          add(const ShoQdataEvent.wsClosed());
        },
        cancelOnError: true,
      );

      _conn = _Conn.connected;
      emit(const ShoQdataState.connected());
      print("✅ WebSocket connected");

      // Signal readiness to awaiters and flush outbox
      _connectedCompleter?.complete();
      await _flushOutbox();

    } catch (e) {
      print("❗ Connection failed: $e");
      _conn = _Conn.idle;
      _connectedCompleter?.completeError(e);
      if (!emit.isDone) emit(ShoQdataState.error("Connection failed: $e"));
      _disconnected = true;
    }
  }

  Future<void> _flushOutbox() async {
    if (_channel == null) return;
    while (_outbox.isNotEmpty && _conn == _Conn.connected && !_disconnected) {
      final payload = _outbox.removeAt(0);
      try {
        print("📤 Flushing queued ${payload.length} bytes");
        _channel!.sink.add(payload);
      } catch (e) {
        print("🛑 Flush failed: $e");
        // Put it back at the front and break; we'll try after reconnect
        _outbox.insert(0, payload);
        break;
      }
    }
  }

  Future<void> _onSendData(SendData event, Emitter<ShoQdataState> emit) async {
    print("➡️ _onSendData called");
    final jsonData = json.encode(event.sessionData);

    // If not connected, queue and trigger connect
    if (_conn != _Conn.connected || _channel == null || _disconnected) {
      print("📥 Queueing ${jsonData.length} bytes (conn=$_conn, disconnected=$_disconnected)");
      _outbox.add(jsonData);

      if (_conn == _Conn.idle) {
        add(const Connect());
      }

      // Optionally wait briefly for connection to establish, then try to flush
      try {
        await _connectedCompleter?.future.timeout(const Duration(seconds: 5));
        await _flushOutbox();
      } catch (_) {
        // Still not connected; keep queued. Show current UI state.
      }

      _emitAccumulated(emit);
      return;
    }

    // Connected: send immediately
    _emitAccumulated(emit);
    print("📤 Sending ${jsonData.length} bytes");
    try {
      _channel!.sink.add(jsonData);
    } catch (e) {
      print("🛑 Send failed: $e");
      if (!emit.isDone) emit(ShoQdataState.error("Send failed: $e"));
      // Keep it for retry on next connect
      _outbox.insert(0, jsonData);
      _conn = _Conn.idle;
      add(const Connect());
    }
  }

  Future<void> _onWsFrame(_WsFrame event, Emitter<ShoQdataState> emit) async {
    final trimmed = event.data.trim();
    if (trimmed == "[DONE]") {
      print("🏁 DONE received");
      _emitAccumulated(emit);
      return;
    }

    try {
      final decoded = json.decode(trimmed);
      _partialBuffer.clear();

      if (decoded is Map<String, dynamic>) {
        _analysisAccum.addAll(decoded);
        _emitAccumulated(emit);
        return;
      }
      if (decoded is List) {
        _analysisAccum["items"] = decoded;
        _emitAccumulated(emit);
        return;
      }

      if (!emit.isDone) emit(ShoQdataState.success(decoded));
    } on FormatException {
      _partialBuffer.write(trimmed);
      final buffered = _partialBuffer.toString();
      try {
        final decoded = json.decode(buffered);
        _partialBuffer.clear();

        if (decoded is Map<String, dynamic>) {
          _analysisAccum.addAll(decoded);
          _emitAccumulated(emit);
        } else if (decoded is List) {
          _analysisAccum["items"] = decoded;
          _emitAccumulated(emit);
        } else {
          if (!emit.isDone) emit(ShoQdataState.success(decoded));
        }
      } on FormatException {
        print("⏳ buffering partial JSON (${buffered.length} bytes)");
      }
    }
  }

  void _onWsClosed(_WsClosed event, Emitter<ShoQdataState> emit) {
    _disconnected = true;
    _conn = _Conn.idle;
    print("🔚 WebSocket closed (preserving data)");
    if (!emit.isDone) emit(ShoQdataState.success(Map.of(_analysisAccum)));
  }

  void _onWsError(_WsError e, Emitter<ShoQdataState> emit) {
    _disconnected = true;
    _conn = _Conn.idle;
    _lastError = e.error;
    print("⚠️ WebSocket error (preserving data): ${e.error}");
    if (!emit.isDone) emit(ShoQdataState.success(Map.of(_analysisAccum)));
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await _channel?.sink.close();
    await _reachSub?.cancel();
    return super.close();
  }
}
