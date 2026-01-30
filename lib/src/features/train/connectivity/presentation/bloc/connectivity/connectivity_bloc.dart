import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityChangedEvent>((event, emit) {
      emit(ConnectivityStateChanged(
          isWifi: event.isWifi, isBluetooth: event.isBluetooth));
      print(event.isBluetooth);
      print(event.isWifi);
    });
    on<ScannedEvent>((event, emit) {
      print('scanned event called');
      emit(ScannedState(isScanned: event.isScanned));
    });
  }
}
