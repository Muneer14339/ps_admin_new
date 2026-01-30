import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/features/profile/domain/repository/profile_repo.dart';

import '../../../auth_new/authentication/domain/entities/user.dart';

@injectable
class ProfileUsecase {
  ProfileUsecase(this._profileRepository);
  final ProfileRepository _profileRepository;

  Future<Either<Map<String, dynamic>, String>> changePassword(
      String oldPass, String newPass) async {
    return await _profileRepository.changePassword(oldPass, newPass);
  }

  //

  Future<Either<User, String>> getUser(String userId) async {
    return await _profileRepository.getUser(userId);
  }

  //

  Future<Either<Map<String, dynamic>, String>> deleteUser() async {
    // Get userId from local storage
    final localStorage = locator<LocalStorageService>();
    final userId = localStorage.userId;

    print('🔵 [ProfileUsecase] deleteUser() called');
    print('🔵 [ProfileUsecase] Retrieved userId from localStorage: $userId');

    if (userId == null || userId.isEmpty) {
      print('🔴 [ProfileUsecase] ERROR: userId is null or empty');
      return right('User ID not found');
    }

    print('🔵 [ProfileUsecase] Forwarding to repository with userId: $userId');
    final result = await _profileRepository.deleteUser(userId);
    result.fold(
      (success) => print('🟢 [ProfileUsecase] Repository returned SUCCESS: $success'),
      (error) => print('🔴 [ProfileUsecase] Repository returned ERROR: $error'),
    );
    return result;
  }

  // Future<Either<User, String>> updateProfile(User user) async {
  //   return await _profileRepository.updateProfile(user);
  // }
}
