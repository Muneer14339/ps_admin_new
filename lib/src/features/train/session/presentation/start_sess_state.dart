import 'package:equatable/equatable.dart';

class StartSessState extends Equatable {
  final String username;
  final bool isLoggedIn;
  final int age;
  final bool isCalibrated;
  final bool isStarted;
  final bool isToggled;

  const StartSessState(
      {required this.username,
      required this.isLoggedIn,
      required this.age,
      required this.isCalibrated,
      required this.isToggled,
      required this.isStarted});

  StartSessState copyWith(
      {String? username,
      bool? isLoggedIn,
      int? age,
      bool? isCalibrated,
      bool? isStarted,
      bool? isToggled}) {
    return StartSessState(
        username: username ?? this.username,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        age: age ?? this.age,
        isCalibrated: isCalibrated ?? this.isCalibrated,
        isToggled: isToggled ?? this.isToggled,
        isStarted: isStarted ?? this.isStarted);
  }

  @override
  List<Object> get props =>
      [username, isLoggedIn, age, isCalibrated, isStarted, isToggled];
}
