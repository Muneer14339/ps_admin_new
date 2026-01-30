// lib/user_dashboard/domain/usecases/add_firearm_usecase.dart
import 'package:dartz/dartz.dart';


import '../../../../core/services/error/failures.dart';
import '../../../../core/services/usecases/usecase.dart';
import '../repositories/armory_repository.dart';

class DeleteFirearmUseCase implements UseCase<void, DeleteFirearmParams> {
  final ArmoryRepository repository;

  DeleteFirearmUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteFirearmParams params) async {
    return await repository.deleteFirearm(params.userId, params.firearm.id!);
  }
}