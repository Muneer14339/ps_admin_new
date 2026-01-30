
import 'dart:async';
import 'dart:typed_data';


class StreamManager {
  static final StreamManager _instance = StreamManager._internal();
  StreamController<Uint8List>? _streamController;
  StreamController<int> _getRingsController = StreamController<int>.broadcast();
  StreamController<int> _getSpeedController = StreamController<int>.broadcast();

  factory StreamManager() {
    return _instance;
  }

  Stream<Uint8List> get stream {
    ensureStreamController();
    return _streamController!.stream;
  }
  Stream<int> get ringsStream => _getRingsController.stream;
  Stream<int> get speedStream => _getSpeedController.stream;

  void addData(Uint8List frameBytes) {
    try {
      ensureStreamController();
      if (!_streamController!.isClosed) {
        _streamController!.add(frameBytes);
      }
    } catch (e) {
      print('Error in StreamManager while adding frame data: $e');
    }
  }

  void addRingsData(int rings) {
    try {
      if (!_getRingsController.isClosed) {
        _getRingsController.add(rings);
      }
    } catch (e) {
      print('Error in StreamManager while adding frame data: $e');
    }
  }
  void addSpeedData(int speed) {
    try {
      if (!_getSpeedController.isClosed) {
        _getSpeedController.add(speed);
      }
    } catch (e) {
      print('Error in StreamManager while adding frame data: $e');
    }
  }

  void dispose() {
    if (_streamController != null && !_streamController!.isClosed) {
      _streamController!.close();
      _getRingsController.close();
      _getSpeedController.close();
      _streamController = null;
    }
  }

  void reset() {
    dispose();
    ensureStreamController();
  }

  void ensureStreamController() {
    if (_streamController == null || _streamController!.isClosed) {
      _streamController = StreamController<Uint8List>.broadcast();
    }
  }

  void ensureRingsController() {
    if ( _getRingsController.isClosed) {
      _getRingsController = StreamController<int>.broadcast();
    }
  }

  StreamManager._internal();
}
