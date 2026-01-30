import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/services/network_service/dio_service.dart';
import '../../../../../core/services/network_service/endpoints.dart';

@injectable
class ProfileService {
  final dioService = DioService();

  Future<Response?> getUser(String userId) async {
    Response? response =
        await dioService.dioGet(fullUrl: '$getUserUrl$userId/', useToken: true);
    return response;
  }

  Future<Response?> changePassword(String oldPass, String newPass) async {
    Response? response = await dioService.dioPost(
        fullUrl: '$getUserUrl$changePassEndpoint',
        useToken: true,
        obj: {'old_password': oldPass, 'new_password': newPass},
        post: true);
    return response;
  }

  //
  Future<Response?> updateProfile(int id, FormData user) async {
    Response? response = await dioService.dioPost(
        fullUrl: '$updateUserUrl$id/', useToken: true, obj: user, post: false);
    return response;
  }

  Future<Response?> deleteUser(String userId) async {
    final endpoint = ApiEndpoints.getEndpoint(ApiEndpoints.deleteUser);
    print('🟣 [ProfileService] deleteUser() called');
    print('🟣 [ProfileService] Endpoint: $endpoint');
    print('🟣 [ProfileService] UserId: $userId');
    print('🟣 [ProfileService] Calling dioService.dioDelete() with token and user_id in body');

    Response? response = await dioService.dioDelete(
        fullUrl: endpoint,
        useToken: true,
        obj: {'user_id': userId});

    print('🟣 [ProfileService] dioDelete returned - Status: ${response?.statusCode}, Data: ${response?.data}');
    return response;
  }
}
