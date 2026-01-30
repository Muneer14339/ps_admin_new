// import 'package:bloc/bloc.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../../../auth_new/authentication/domain/entities/user.dart';
// import '../../../domain/usecase/profile_usecase.dart';
//
// part 'profile_remote_event.dart';
// part 'profile_remote_state.dart';
//
// @injectable
// class ProfileRemoteBloc extends Bloc<ProfileRemoteEvent, ProfileRemoteState> {
//   final ProfileUsecase usecase;
//   ProfileRemoteBloc(this.usecase) : super(ProfileRemoteInitial()) {
//     on<ProfileRemoteEvent>((event, emit) {});
//
//     //---------------------------------------- changePass
//
//     on<ChangePassEvent>(
//         (event, emit) => changePass(emit, event.oldPass, event.newPass));
//     //
//     on<UserProfileRemoteEvent>((event, emit) => getUser(emit, event.userId));
//     //
//     on<UpdateProfileRemoteEvent>(
//         (event, emit) => updateProfile(emit, event.user));
//     //
//   }
//
//   Future<void> changePass(
//       Emitter<ProfileRemoteState> emit, String oldPass, newPass) async {
//     emit(ChangePassLoading());
//     await usecase.changePassword(oldPass, newPass).then((v) {
//       v.fold(
//         (l) => emit(ChangePassSuccess(l)),
//         (r) => emit(ChangePassError(r)),
//       );
//     });
//   }
//
//   //
//
//   Future<void> getUser(Emitter<ProfileRemoteState> emit, String userId) async {
//     emit(ProfileLoading());
//     await usecase.getUser(userId).then((v) {
//       v.fold(
//         (l) => emit(ProfileSuccess(l)),
//         (r) => emit(ProfileError(r)),
//       );
//     });
//   }
//
//   //
//
//   Future<void> updateProfile(
//       Emitter<ProfileRemoteState> emit, User user) async {
//     emit(UpdateProfileLoading());
//     // await usecase.updateProfile(user).then((v) {
//     //   v.fold(
//     //     (l) => emit(UpdateProfileSuccess(l)),
//     //     (r) => emit(UpdateProfileError(r)),
//     //   );
//     // });
//   }
// }
