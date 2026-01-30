part of 'connectivity_bloc.dart';

@immutable
sealed class ConnectivityState {}

final class ConnectivityInitial extends ConnectivityState {}

final class ConnectivityStateChanged extends ConnectivityState {
  final bool isWifi;
  final bool isBluetooth;

  ConnectivityStateChanged({required this.isWifi, required this.isBluetooth});
}

final class ScannedState extends ConnectivityState {
  final bool isScanned;

  ScannedState({required this.isScanned});
}
