part of 'session_bloc.dart';

sealed class SessionEvent {}

class ResetSession extends SessionEvent {
  ResetSession();
}

class ShootEvent extends SessionEvent {
  final SessionModel sessionModel;

  ShootEvent({required this.sessionModel});
}

class CountDownEvent extends SessionEvent {
  final SessionModel sessionModel;

  CountDownEvent({required this.sessionModel});
}
