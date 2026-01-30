import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/model/drills_entity.dart';

part 'drill_event.dart';
part 'drill_state.dart';

class DrillBloc extends Bloc<DrillEvent, DrillState> {
  DrillBloc() : super(DrillInitial()) {
    on<DrillEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<DrillsLoadEvent>((event, emit) {
      emit(DrillLoadState(listDrills: event.listDrills));
    });

    on<DrillsDeleteEvent>((event, emit) {
      emit(DrillDeleteState(listDrills: event.listDrills));
    });
  }
}
