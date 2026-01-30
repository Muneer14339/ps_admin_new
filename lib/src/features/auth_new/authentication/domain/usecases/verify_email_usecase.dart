import 'package:dartz/dartz.dart';

import '../../../../../core/services/error/failures.dart';
import '../../../../../core/services/usecases/usecase.dart';
import '../../data/models/auth_models.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';


class VerifyEmailUseCase {
  final AuthRepository repository;

  VerifyEmailUseCase(this.repository);

  Future<Either<Failure, void>> call(String token) async {
    return await repository.verifyEmail(token);
  }
}
