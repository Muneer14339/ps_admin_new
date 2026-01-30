import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/services/error/failures.dart';
import '../../../../../core/services/session_sync_service.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/auth_usecase.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;
  final SessionSyncService _sessionSyncService;

  AuthBloc(this._authUseCase, this._sessionSyncService) : super(const AuthState.initial()) {
    on<AuthEventLogin>(_onLogin);
    on<AuthEventSignup>(_onSignup);
    on<AuthEventGoogleSignIn>(_onGoogleSignIn);
    on<AuthEventVerifyEmail>(_onVerifyEmail);
    on<AuthEventResendOtp>(_onResendOtp);
    on<AuthEventSendPasswordReset>(_onSendPasswordReset);
    on<AuthEventVerifyResetToken>(_onVerifyResetToken);
    on<AuthEventResetPassword>(_onResetPassword);
    on<AuthEventLogout>(_onLogout);
    on<AuthEventCheckLoginStatus>(_onCheckLoginStatus);
  }

  Future<void> _onLogin(
    AuthEventLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading(LoadingType.login));

    final result = await _authUseCase.login(
      email: event.email,
      password: event.password,
    );

    print("🔍 LOGIN RESULT - Processing fold...");
    result.fold(
      (failure) {
        print("❌ LOGIN FOLD - Emitting error state: ${_mapFailureToMessage(failure)}");
        emit(AuthState.error(
          _mapFailureToMessage(failure),
          isNetworkError: _isNetworkError(failure),
        ));
      },
      (user) {
        print("✅ LOGIN FOLD - Emitting authenticated state");
        emit(AuthState.authenticated(user));

        // Trigger session sync after successful login (with internet check)
        _sessionSyncService.syncSessionsToRemote(user.uid);
      },
    );
    print("🏁 LOGIN - Fold completed");
  }

  Future<void> _onSignup(
    AuthEventSignup event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading(LoadingType.signup));

    final result = await _authUseCase.signup(
      username: event.username,
      email: event.email,
      password: event.password,
      location: event.location,
    );

    result.fold(
      (failure) => emit(AuthState.error(
        _mapFailureToMessage(failure),
        isNetworkError: _isNetworkError(failure),
      )),
      (user) => emit(AuthState.signupSuccess(user)),
    );
  }

  Future<void> _onGoogleSignIn(
    AuthEventGoogleSignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading(LoadingType.googleSignIn));

    final result = await _authUseCase.googleSignIn();

    result.fold(
      (failure) => emit(AuthState.error(
        _mapFailureToMessage(failure),
        isNetworkError: _isNetworkError(failure),
      )),
      (user) => emit(AuthState.authenticated(user)),
    );
  }

  Future<void> _onVerifyEmail(
    AuthEventVerifyEmail event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading(LoadingType.verifyEmail));

    final result = await _authUseCase.verifyEmail(token: event.token);

    result.fold(
      (failure) => emit(AuthState.error(
        _mapFailureToMessage(failure),
        isNetworkError: _isNetworkError(failure),
      )),
      (message) => emit(AuthState.emailVerified(message)),
    );
  }

  Future<void> _onResendOtp(
    AuthEventResendOtp event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading(LoadingType.resendOtp));

    final result = await _authUseCase.resendOtp(email: event.email);

    result.fold(
      (failure) => emit(AuthState.error(
        _mapFailureToMessage(failure),
        isNetworkError: _isNetworkError(failure),
      )),
      (message) => emit(AuthState.otpResent(message)),
    );
  }

  Future<void> _onSendPasswordReset(
    AuthEventSendPasswordReset event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading(LoadingType.sendPasswordReset));

    final result = await _authUseCase.sendPasswordReset(email: event.email);

    result.fold(
      (failure) => emit(AuthState.error(
        _mapFailureToMessage(failure),
        isNetworkError: _isNetworkError(failure),
      )),
      (message) => emit(AuthState.passwordResetSent(message)),
    );
  }

  Future<void> _onVerifyResetToken(
    AuthEventVerifyResetToken event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading(LoadingType.verifyResetToken));

    final result = await _authUseCase.verifyResetToken(token: event.token);

    result.fold(
      (failure) => emit(AuthState.error(
        _mapFailureToMessage(failure),
        isNetworkError: _isNetworkError(failure),
      )),
      (message) => emit(AuthState.resetTokenVerified(message)),
    );
  }

  Future<void> _onResetPassword(
    AuthEventResetPassword event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading(LoadingType.resetPassword));

    final result = await _authUseCase.resetPassword(
      email: event.email,
      newPassword: event.newPassword,
      passwordConfirmation: event.passwordConfirmation,
    );

    result.fold(
      (failure) => emit(AuthState.error(
        _mapFailureToMessage(failure),
        isNetworkError: _isNetworkError(failure),
      )),
      (message) => emit(AuthState.passwordReset(message)),
    );
  }

  Future<void> _onLogout(
    AuthEventLogout event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading(LoadingType.logout));

    final result = await _authUseCase.logout();

    result.fold(
      (failure) => emit(AuthState.error(
        _mapFailureToMessage(failure),
        isNetworkError: _isNetworkError(failure),
      )),
      (_) => emit(const AuthState.unauthenticated()),
    );
  }

  Future<void> _onCheckLoginStatus(
    AuthEventCheckLoginStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading(LoadingType.checkStatus));

    final result = await _authUseCase.getCurrentUser();

    result.fold(
      (failure) => emit(const AuthState.unauthenticated()),
      (user) {
        if (user != null) {
          emit(AuthState.authenticated(user));
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is NetworkFailure) {
      return 'No internet connection. Please check your network and try again.';
    } else if (failure is ServerFailure) {
      return 'Server error. Please try again later.';
    } else if (failure is AuthFailure) {
      return failure.message;
    } else if (failure is ValidationFailure) {
      return failure.message;
    } else if (failure is FileFailure) {
      return failure.message;
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }

  bool _isNetworkError(Failure failure) {
    return failure is NetworkFailure;
  }
}
