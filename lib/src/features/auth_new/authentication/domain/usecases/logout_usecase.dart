import 'package:dartz/dartz.dart';

import '../../../../../core/services/error/failures.dart';
import '../../../../../core/services/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<AuthFailure, void>> call(NoParams params) async {
    return await repository.logout();
  }
}
