import 'package:dartz/dartz.dart';

import '../../../auth_new/authentication/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<Either<Map<String, dynamic>, String>> changePassword(
      String oldPass, String newPass);

  Future<Either<User, String>> getUser(String userId);

  Future<Either<Map<String, dynamic>, String>> deleteUser(String userId);

  //

  // Future<Either<User, String>> updateProfile(User user);
}
