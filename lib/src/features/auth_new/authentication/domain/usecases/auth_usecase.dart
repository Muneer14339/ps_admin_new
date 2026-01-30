import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/services/error/failures.dart';
import '../../data/models/auth_models.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

/// Unified use case for all authentication operations
/// This consolidates all auth-related operations into a single use case
@injectable
class AuthUseCase {
  final AuthRepository _repository;

  AuthUseCase(this._repository);

  // Login operations
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    return await _repository.login(email, password);
  }

  // Signup operations
  Future<Either<Failure, User>> signup({
    required String username,
    required String email,
    required String password,
    String? location,
  }) async {
    return await _repository.signup(username, email, password, location);
  }

  // Google Sign-in
  Future<Either<Failure, User>> googleSignIn() async {
    return await _repository.signInWithGoogle();
  }

  // Email verification
  Future<Either<Failure, String>> verifyEmail({
    required String token,
  }) async {
    final result = await _repository.verifyEmail(token);
    return result.fold(
      (failure) => Left(failure),
      (_) => const Right('Email verified successfully'),
    );
  }

  // Resend OTP
  Future<Either<Failure, String>> resendOtp({
    required String email,
  }) async {
    final result = await _repository.resendOtp(email);
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.message),
    );
  }

  // Password reset - send email
  Future<Either<Failure, String>> sendPasswordReset({
    required String email,
  }) async {
    final result = await _repository.sendPasswordResetEmail(email);
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.message),
    );
  }

  // Verify reset token
  Future<Either<Failure, String>> verifyResetToken({
    required String token,
  }) async {
    final result = await _repository.verifyResetToken(token);
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.message),
    );
  }

  // Reset password
  Future<Either<Failure, String>> resetPassword({
    required String email,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    final request = ResetPasswordRequest(
      email: email,
      newPassword: newPassword,
    );

    final result = await _repository.resetPassword(request);
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.message),
    );
  }

  // Logout
  Future<Either<Failure, void>> logout() async {
    return await _repository.logout();
  }

  // Get current user
  Future<Either<Failure, User?>> getCurrentUser() async {
    return await _repository.getCurrentUser();
  }
}
