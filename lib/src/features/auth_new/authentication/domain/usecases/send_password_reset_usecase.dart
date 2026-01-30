import 'package:dartz/dartz.dart';

import '../../../../../core/services/error/failures.dart';
import '../../../../../core/services/usecases/usecase.dart';
import '../../data/models/auth_models.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';


class SendPasswordResetUseCase implements UseCase<void, String> {
  final AuthRepository repository;

  SendPasswordResetUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String email) async {
    return await repository.sendPasswordResetEmail(email);
  }
}
