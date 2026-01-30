// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pa_sreens/src/features/train/session/presentation/start_sess_state.dart';
//
// class MyCubit extends Cubit<StartSessState> {
//   MyCubit()
//       : super(const StartSessState(
//             username: '',
//             isLoggedIn: false,
//             age: 0,
//             isCalibrated: false,
//             isStarted: false,
//             isToggled: false));
//
//   void calibrationChanged(bool isCalibrated) {
//     emit(state.copyWith(isCalibrated: isCalibrated));
//   }
//
//   void isStarted(bool isStarted) {
//     emit(state.copyWith(isStarted: isStarted));
//   }
//
//   void isToggled(bool isToggled) {
//     emit(state.copyWith());
//   }
//
//   void updateUsername(String newUsername) {
//     emit(state.copyWith(username: newUsername));
//   }
//
//   void updateLoginStatus(bool isLoggedIn) {
//     emit(state.copyWith(isLoggedIn: isLoggedIn));
//   }
//
//   void updateAge(int age) {
//     emit(state.copyWith(age: age));
//   }
// }
