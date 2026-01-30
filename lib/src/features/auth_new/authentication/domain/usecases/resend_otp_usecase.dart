import 'package:dartz/dartz.dart';

import '../../../../../core/services/error/failures.dart';
import '../../../../../core/services/usecases/usecase.dart';
import '../../data/models/auth_models.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class ResendOtpUseCase {
  final AuthRepository repository;

  ResendOtpUseCase(this.repository);

  Future<Either<AuthFailure, ResendOtpResponse>> call(String email) async {
    return await repository.resendOtp(email);
  }
}
