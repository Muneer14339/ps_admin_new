part of 'connectivity_bloc.dart';

@immutable
sealed class ConnectivityEvent {}

class ConnectivityChangedEvent extends ConnectivityEvent {
  final bool isWifi;
  final bool isBluetooth;

  ConnectivityChangedEvent({required this.isWifi, required this.isBluetooth});
}

class ScannedEvent extends ConnectivityEvent {
  final bool isScanned;

  ScannedEvent({required this.isScanned});
}
