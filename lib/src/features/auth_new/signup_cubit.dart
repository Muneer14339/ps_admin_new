import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit {
  SignupCubit(super.initialState);

  void togglePasswordVisibility() {
    emit(state.copyWith(
      obscurePassword: !state.obscurePassword,
    ));
  }

  // void updateLocation(String location) {
  //   emit(state.copyWith(location: location));
  // }

  void toggleAgreeToRecieve() {
    emit(state.copyWith(agreeToRecieve: !state.agreeToRecieve));
  }

  void toggleAgreeToTerms() {
    emit(state.copyWith(agreeToTerms: !state.agreeToTerms));
  }
}

class TimerCubit extends Cubit<int> {
  Timer? _timer;

  TimerCubit() : super(59) {
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        emit(state - 1);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

class NewPasswordCubit extends Cubit<bool> {
  NewPasswordCubit()
      : super(
          true,
        );
  void togglePasswordVisibility() {
    emit(!state);
  }
}
