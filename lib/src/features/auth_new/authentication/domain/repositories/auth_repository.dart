import 'package:dartz/dartz.dart';
import '../../../../../core/services/error/failures.dart';
import '../../data/models/auth_models.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, User>> login(String email, String password);
  Future<Either<AuthFailure, User>> signup(
      String firstName,
      String lastName,
      String email,
      String password,
      String? location,
      );
  Future<Either<AuthFailure, User>> verifyEmail(String token);
  Future<Either<AuthFailure, VerifyResetTokenResponse>> verifyResetToken(
    String token,
  );
  Future<Either<AuthFailure, ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  );
  Future<Either<AuthFailure, User>> signInWithGoogle();
  Future<Either<AuthFailure, void>> logout();
  Future<Either<AuthFailure, User?>> getCurrentUser();
  Future<Either<AuthFailure, ForgotPasswordResponse>> sendPasswordResetEmail(
    String email,
  );
  Future<Either<AuthFailure, ResendOtpResponse>> resendOtp(String email);
}
