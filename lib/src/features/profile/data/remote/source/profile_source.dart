import 'package:dio/dio.dart';

abstract class ProfileSource {
  Future<Response?> getUser(String userId);

  Future<Response?> changePassword(String oldPass, String newPass);

  //
  Future<Response?> updateProfile(int id, FormData user);

  Future<Response?> deleteUser(String userId);
}
