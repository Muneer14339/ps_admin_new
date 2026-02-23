import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/features/auth_new/authentication/domain/entities/user.dart';
import '../../../../../core/services/error/failures.dart';
import '../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../core/services/locator/locator.dart';
import '../../../../../core/services/token_manager.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/auth_models.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AuthFailure, User>> verifyEmail(String token) async {
    try {
      VerifyEmailResponse res = await remoteDataSource.verifyEmail(token);
      print('-----------==== ${res.userType}');
      print('-----------==== ${res.isApprovedByAdmin}');
      if (res.userType == 'coach') {
        return Left(
          AuthFailure('Users registered as coach cann\'t access this app'),
        );
      } else {
        // Save tokens and user data
        locator<LocalStorageService>().saveTokens(
          AuthResponse(
            bio: '',
            certificationType: [],
            certificationUploaded: false,
            experience: 0,
            isApprovedByAdmin: res.isApprovedByAdmin,
            isVerifiedByCoach: false,
            lastName: res.lastName,
            redirectUrl: '',
            token: res.token,
            userId: res.userId,
            email: res.email,
            firstName: res.firstName,
            country: '',
            userType: res.userType,
            specialization: '',
            specialties: [],
            username: '',
            contactNumber: '',
            trainingPhilosophy: '',
            website: '',
          ),
        );

        // Update datasource with token
        remoteDataSource.updateAuthToken(res.token);

        // Map AuthResponse to User entity
        final user = User(
          uid: res.userId,
          email: res.email,
          firstName: res.firstName,
          location: '',
          role: 0, // Default role - adjust as needed
          createdAt: DateTime.now(),
          registeredFrom: 'pa_app',
          currentlyLogin: 'pa_app',
        );

        return Right(user);
      }
    } on Exception catch (e) {
      // Extract message from Exception
      final message = e.toString().replaceFirst('Exception: ', '');
      return Left(AuthFailure(message));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<AuthFailure, VerifyResetTokenResponse>> verifyResetToken(
    String token,
  )
  async {
    try {
      final response = await remoteDataSource.verifyResetToken(token);
      print('-----------==== ${response.email}');
      print('-----------==== $response');
      return Right(response);
    } on Exception catch (e) {
      // Extract message from Exception
      final message = e.toString().replaceFirst('Exception: ', '');
      return Left(AuthFailure(message));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<AuthFailure, ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async
  {
    try {
      final response = await remoteDataSource.resetPassword(request);
      return Right(response);
    } on Exception catch (e) {
      // Extract message from Exception
      final message = e.toString().replaceFirst('Exception: ', '');
      return Left(AuthFailure(message));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<AuthFailure, User>> login(String email, String password) async {
    try {
      final authResponse = await remoteDataSource.login(email, password);
      print('-----------==== ${authResponse.userType}');
      print('-----------==== ${authResponse.isApprovedByAdmin}');
      if (authResponse.userType == 'coach') {
        return Left(
          AuthFailure('Users registered as coach cannot access this app'),
        );
      } else {
        // Save tokens and user data
         locator<LocalStorageService>().saveTokens(authResponse);

        // Update datasource with token
        remoteDataSource.updateAuthToken(authResponse.token);

        // Map AuthResponse to User entity
        final user = User(
          uid: authResponse.userId,
          email: authResponse.email,
          firstName: authResponse.firstName,
          location: authResponse.country,
          role: 0, // Default role - adjust as needed
          createdAt: DateTime.now(),
          registeredFrom: 'PA',
          currentlyLogin: 'PA',
        );

        return Right(user);
      }
    } on Exception catch (e) {
      // Extract message from Exception
      final message = e.toString().replaceFirst('Exception: ', '');
      return Left(AuthFailure(message));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<AuthFailure, User>> signup(
      String firstName,
      String lastName,
      String email,
      String password,
      String? location,
      ) async {
    try {
      final signupResponse = await remoteDataSource.signup(firstName, lastName, email, password, location);
      final user = User(
        uid: signupResponse.userId,
        email: signupResponse.email,
        firstName: firstName,
        location: location,
        createdAt: DateTime.now(),
        registeredFrom: 'pa_app',
        currentlyLogin: 'pa_app',
      );
      return Right(user);
    } on Exception catch (e) {
      return Left(AuthFailure(e.toString().replaceFirst('Exception: ', '')));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<AuthFailure, User>> signInWithGoogle() async {
    try {
      final authResponse = await remoteDataSource.signInWithGoogle();

      // Save tokens and user data
       locator<LocalStorageService>().saveTokens(authResponse);

      // Update datasource with token
      remoteDataSource.updateAuthToken(authResponse.token);

      // Map AuthResponse to User entity
      final user = User(
        uid: authResponse.userId,
        email: authResponse.email,
        firstName: authResponse.firstName,
        location: authResponse.country,
        role: 0, // Default role - adjust as needed
        createdAt: DateTime.now(),
        registeredFrom: 'pa_app',
        currentlyLogin: 'pa_app',
      );

      return Right(user);
    } on Exception catch (e) {
      // Extract message from Exception
      final message = e.toString().replaceFirst('Exception: ', '');
      return Left(AuthFailure(message));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<AuthFailure, void>> logout() async {
    try {
      await remoteDataSource.logout();

      // Clear tokens
       locator<LocalStorageService>().clearTokens();

      // Clear datasource token
      remoteDataSource.updateAuthToken(null);

      return const Right(null);
    } on Exception catch (e) {
      // Extract message from Exception
      final message = e.toString().replaceFirst('Exception: ', '');
      return Left(AuthFailure(message));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<AuthFailure, User?>> getCurrentUser() async {
    try {
      final hasToken =  locator<LocalStorageService>().hasValidToken();
      if (!hasToken) {
        return const Right(null);
      }

      // Get stored auth response
      final authResponse =  locator<LocalStorageService>().getAuthResponse();

      if (authResponse == null) {
        return const Right(null);
      }

      // Map AuthResponse to User entity
      final user = User(
        uid: authResponse.userId,
        email: authResponse.email,
        firstName: authResponse.firstName,
        location: authResponse.country,
        role: 0, // Default role - adjust as needed
        createdAt: DateTime.now(),
        registeredFrom: 'pa_app',
        currentlyLogin: 'pa_app',
      );

      return Right(user);
    } on Exception catch (e) {
      // Extract message from Exception
      final message = e.toString().replaceFirst('Exception: ', '');
      return Left(AuthFailure(message));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<AuthFailure, ForgotPasswordResponse>> sendPasswordResetEmail(
    String email,
  ) async {
    try {
      final response = await remoteDataSource.sendPasswordResetEmail(email);
      return Right(response);
    } on Exception catch (e) {
      // Extract message from Exception
      final message = e.toString().replaceFirst('Exception: ', '');
      return Left(AuthFailure(message));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<AuthFailure, ResendOtpResponse>> resendOtp(String email) async {
    try {
      final response = await remoteDataSource.resendOtp(email);
      return Right(response);
    } on Exception catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');
      return Left(AuthFailure(message));
    } catch (e) {
      return Left(AuthFailure('An unexpected error occurred'));
    }
  }
}
