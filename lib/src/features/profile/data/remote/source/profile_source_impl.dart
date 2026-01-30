import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../service/profile_service.dart';
import 'profile_source.dart';

@Injectable(as: ProfileSource)
class ProfileSourceImpl implements ProfileSource {
  final ProfileService _profileService = ProfileService();

  @override
  Future<Response?> getUser(String userId) {
    return _profileService.getUser(userId);
  }

  @override
  Future<Response?> changePassword(String oldPass, String newPass) async {
    return await _profileService.changePassword(oldPass, newPass);
  }

  @override
  Future<Response?> updateProfile(int id, FormData user) {
    return _profileService.updateProfile(id, user);
  }

  @override
  Future<Response?> deleteUser(String userId) async {
    print('🟠 [ProfileSource] deleteUser() called with userId: $userId');
    print('🟠 [ProfileSource] Calling profile service');
    final response = await _profileService.deleteUser(userId);
    print('🟠 [ProfileSource] Service returned - Status: ${response?.statusCode}, Data: ${response?.data}');
    return response;
  }
}
