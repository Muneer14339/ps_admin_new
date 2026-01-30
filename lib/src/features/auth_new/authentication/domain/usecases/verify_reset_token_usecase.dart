import 'package:dartz/dartz.dart';

import '../../../../../core/services/error/failures.dart';
import '../../../../../core/services/usecases/usecase.dart';
import '../../data/models/auth_models.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';


class VerifyResetTokenUseCase {
  final AuthRepository repository;

  VerifyResetTokenUseCase(this.repository);

  Future<Either<Failure, VerifyResetTokenResponse>> call(String token) async {
    return await repository.verifyResetToken(token);
  }
}
