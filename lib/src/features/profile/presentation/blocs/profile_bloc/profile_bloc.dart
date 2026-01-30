import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pa_sreens/src/features/profile/domain/usecase/profile_usecase.dart';
part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecase usecase;
  bool _isCancelled = false;

  ProfileBloc(this.usecase) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});

    //----------------------------------------

    on<ProfilePictureChangeEvent>((event, emit) {
      emit(ProfilePictureChangeState(imageFile: event.imageFile));
    });

    //----------------------------------------

    on<DropDownChangedEventGen>((event, emit) {
      emit(DropdownChangedStateGen(
          id: event.id, selectedVal: event.selectedVal));
    });

    //----------------------------------------

    on<ExpansionChangeEvent>((event, emit) {
      emit(ExpansionChangeState(isExpanded: event.isExpanded));
    });

    //----------------------------------------

    on<RegionChangeEvent>((event, emit) {
      emit(RegionChangeState(regoin: event.region));
    });

    //----------------------------------------

    on<DateFormatChangeEvent>((event, emit) {
      emit(DateFormatChangeState(date: event.dateFormat));
    });

    //----------------------------------------

    on<TimeFormatChangeEvent>((event, emit) {
      emit(TimeFormatChangeState(time: event.time));
    });

    //

    //----------------------------------------

    on<DistanceChangeEvent>((event, emit) {
      emit(DistanceChangeState(distance: event.distance));
    });

    //----------------------------------------

    on<SwitchChangedEventGen>((event, emit) {
      emit(SwitchChangedStateGen(id: event.id, selectedVal: event.selectedVal));
    });

    //----------------------------------------

    on<BackupFrequencyChangeEvent>((event, emit) {
      emit(BackupFrequencyChangeState(frequency: event.freqyency));
    });

    //----------------------------------------

    on<IsBackUpLoadingEvent>((event, emit) async {
      emit(IsBackupLoadingState(
          isBackupLoading: event.isBackUpLoading, isCancelled: false));
      _isCancelled = false;
      await Future.delayed(const Duration(seconds: 5));

      if (!_isCancelled) {
        emit(RestoreBackUpState(isRestored: false, isRestoring: false));
      }
    });
    //----------------------------------------

    on<CancelBackUpLoadingEvent>((event, emit) {
      _isCancelled = true;
      if (state is IsBackupLoadingState) {
        emit(IsBackupLoadingState(isBackupLoading: false, isCancelled: true));
      }
    });
    //----------------------------------------

    on<RestoreBackupEvent>((event, emit) async {
      emit(RestoreBackUpState(
          isRestored: event.isRestored, isRestoring: event.isRestoring));
      if ((state as RestoreBackUpState).isRestoring) {
        await Future.delayed(const Duration(seconds: 5));
        emit(RestoreBackUpState(isRestored: true, isRestoring: false));
      }
    });
    //----------------------------------------

    on<DeleteUserEvent>((event, emit) async {
      print('🔴 [ProfileBloc] DeleteUserEvent received - Starting delete user process');
      emit(DeleteUserLoading());
      print('🔴 [ProfileBloc] DeleteUserLoading emitted');

      print('🔴 [ProfileBloc] Calling usecase.deleteUser()');
      final result = await usecase.deleteUser();

      result.fold(
        (response) {
          print('🟢 [ProfileBloc] Delete user SUCCESS - Response: $response');
          emit(DeleteUserSuccess(response));
          print('🟢 [ProfileBloc] DeleteUserSuccess emitted');
        },
        (error) {
          print('🔴 [ProfileBloc] Delete user ERROR - Error: $error');
          emit(DeleteUserError(error));
          print('🔴 [ProfileBloc] DeleteUserError emitted');
        },
      );
    });
    //----------------------------------------

//---------------------------------------- changePass

    //on<ChangePassEvent>((event, emit) => changePass(emit, event.oldPass, event.newPass));

    //on<UserProfileEvent>((event, emit) => getUser(emit, event.userId));

    //on<UpdateProfileEvent>((event, emit) => updateProfile(emit, event.user));
  }
  /*
  Future<void> changePass(
      Emitter<ProfileState> emit, String oldPass, newPass) async {
    emit(ChangePassLoading());
    await usecase.changePassword(oldPass, newPass).then((v) {
      v.fold(
        (l) => emit(ChangePassSuccess(l)),
        (r) => emit(ChangePassError(r)),
      );
    });
  }

  //

  Future<void> getUser(Emitter<ProfileState> emit, String userId) async {
    emit(ProfileLoading());
    await usecase.getUser(userId).then((v) {
      v.fold(
        (l) => emit(ProfileSuccess(l)),
        (r) => emit(ProfileError(r)),
      );
    });
  }

  //

  Future<void> updateProfile(Emitter<ProfileState> emit, User user) async {
    emit(UpdateProfileLoading());
    await usecase.updateProfile(user).then((v) {
      v.fold(
        (l) => emit(UpdateProfileSuccess(l)),
        (r) => emit(UpdateProfileError(r)),
      );
    });
  }

  */
}
