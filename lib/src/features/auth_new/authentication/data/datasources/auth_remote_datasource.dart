import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/helper/dio_client.dart';
import '../../../../../core/helper/exceptions.dart';
import '../../../../../core/services/network_service/endpoints.dart';
import '../models/auth_models.dart';

abstract class AuthRemoteDataSource {
  Future<SignupResponse> signup(String firstName, String lastName, String email, String password, String? location);
  Future<VerifyEmailResponse> verifyEmail(String token);
  Future<VerifyResetTokenResponse> verifyResetToken(String token);
  Future<AuthResponse> login(String email, String password);
  Future<AuthResponse> signInWithGoogle();
  Future<void> logout();
  Future<UserModel?> getCurrentUser();
  Future<ForgotPasswordResponse> sendPasswordResetEmail(String email);
  Future<ResendOtpResponse> resendOtp(String email);
  Future<ResetPasswordResponse> resetPassword(ResetPasswordRequest request);
  void updateAuthToken(String? token);
}

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSourceImpl(this._dioClient);

  Future<SignupResponse> signup(String firstName, String lastName, String email, String password, String? location) async {
    try {
      final request = SignupRequest.fromEmail(
        email: email,
        password: password,
        hasDefaultCoach: true,
        firstName: firstName,
        lastName: lastName,
      );

      print(request.toJson());
      final response = await _dioClient.post(
        ApiEndpoints.signup,
        data: request.toJson(),
        queryParameters: {'source': 'app'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Signup==1: ");
        return SignupResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ServerException('Signup failed', statusCode: response.statusCode);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<VerifyEmailResponse> verifyEmail(String token) async {
    try {
      final request = VerifyEmailRequest(token: token);

      final response = await _dioClient.post(
        ApiEndpoints.verifyEmail,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return VerifyEmailResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw ServerException(
          'Email verification failed',
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<VerifyResetTokenResponse> verifyResetToken(String token) async {
    try {
      final request = VerifyResetTokenRequest(token: token);

      final response = await _dioClient.post(
        ApiEndpoints.verifyResetToken,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return VerifyResetTokenResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw ServerException(
          'Failed to verify reset token',
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<AuthResponse> login(String email, String password) async {
    try {
      final request = LoginRequest(email: email, password: password);

      final response = await _dioClient.post(
        ApiEndpoints.login,
        data: request.toJson(),
        queryParameters: {'source': 'app'},
      );

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ServerException('Login failed', statusCode: response.statusCode);
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<AuthResponse> signInWithGoogle() async {
    try {
      // This will need to be implemented with Google Sign-In integration
      // For now, we'll throw an exception until we have the Google token
      throw const AuthenticationException(
        'Google Sign-In not yet implemented with custom backend',
      );
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      final response = await SharedPreferences.getInstance();
      await response.clear();

      // No need to check status code as clear() doesn't return one
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.userProfile);

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data as Map<String, dynamic>);
      } else if (response.statusCode == 401) {
        // User not authenticated
        return null;
      } else {
        throw ServerException(
          'Failed to get user profile',
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<ForgotPasswordResponse> sendPasswordResetEmail(String email) async {
    try {
      final request = ForgotPasswordRequest(email: email);

      final response = await _dioClient.post(
        ApiEndpoints.forgotPassword,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return ForgotPasswordResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw ServerException(
          'Failed to send password reset email',
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<ResendOtpResponse> resendOtp(String email) async {
    try {
      final request = ResendOtpRequest(email: email);

      final response = await _dioClient.post(
        ApiEndpoints.resendToken,
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ResendOtpResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw ServerException(
          'Failed to resend verification code',
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  // Additional methods for token management
  Future<RefreshTokenResponse> refreshToken(String refreshToken) async {
    try {
      final request = RefreshTokenRequest(refreshToken: refreshToken);

      final response = await _dioClient.post(
        ApiEndpoints.refreshToken,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return RefreshTokenResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw ServerException(
          'Token refresh failed',
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.resetPassword,
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return ResetPasswordResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
      } else {
        throw ServerException(
          'Failed to reset password',
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  Future<UserModel> updateUserProfile(Map<String, dynamic> userData) async {
    try {
      final response = await _dioClient.put(
        ApiEndpoints.updateProfile,
        data: userData,
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data as Map<String, dynamic>);
      } else {
        throw ServerException(
          'Failed to update user profile',
          statusCode: response.statusCode,
        );
      }
    } on ApiException {
      rethrow;
    } catch (e) {
      throw UnknownException(e.toString());
    }
  }

  // Update the authorization token in the Dio client
  @override
  void updateAuthToken(String? token) {
    _dioClient.updateAuthToken(token);
  }
}
