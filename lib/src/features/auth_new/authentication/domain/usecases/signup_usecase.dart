// import 'package:dartz/dartz.dart';
//
// import '../../../../../core/services/error/failures.dart';
// import '../../../../../core/services/usecases/usecase.dart';
// import '../../data/models/auth_models.dart';
// import '../entities/user.dart';
// import '../repositories/auth_repository.dart';
//
//
// class SignupUseCase implements UseCase<User, SignupParams> {
//   final AuthRepository repository;
//
//   SignupUseCase(this.repository);
//
//   @override
//   Future<Either<Failure, User>> call(SignupParams params) async {
//     return await repository.signup(
//       params.username,
//       params.email,
//       params.password,
//       params.location,
//     );
//   }
// }
//
// class SignupParams {
//   final String username;
//   final String email;
//   final String password;
//   final String? location;
//
//   SignupParams({
//     required this.username,
//     required this.email,
//     required this.password,
//     this.location,
//   });
// }
