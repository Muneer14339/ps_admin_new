import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/model/drills_entity.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/domain/usecase/drill_usecase.dart';
part 'drills_state.dart';

@injectable
class DrillsCubit extends Cubit<DrillsState> {
  DrillsCubit(this._drillUsecase) : super(DrillsInitial());

  final DrillUsecase _drillUsecase;

  void getUserDrills() async {
    final result = await _drillUsecase
        .getDrillsForUser(locator<LocalStorageService>().userIdString);

    emit(DrillsLoading());
    Future.delayed(const Duration(milliseconds: 200), () {
      result.fold((l) {
        List<DrillsModel> listDrills = [];
        listDrills =
            List<DrillsModel>.from(l.map((x) => DrillsModel.fromJson(x)));
        emit(DrillsLoaded(listDrills));
      }, (r) => emit(DrillsError('error')));
    });
  }
}
