import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';

import '../../../features/auth_new/authentication/data/models/auth_models.dart';
import '../../utils/app_keys.dart';

@singleton
class LocalStorageService {
  final AppKeys appKeys;

  LocalStorageService(this.appKeys);

  AuthResponse? get userModel {
    final userJson = prefs?.getString(appKeys.keyUserObject);
    if (userJson == null || userJson.isEmpty) {
      return null;
    }
    try {
      final Map<String, dynamic> userMap = jsonDecode(userJson);
      return AuthResponse.fromJson(userMap);
    } catch (e) {
      return null;
    }
  }


  void saveTokens(AuthResponse authResponse)  {
    // Save the token
    prefs?.setString(appKeys.tokenKey, authResponse.token);

    // Save the user ID for quick access
    prefs?.setString('user_id', authResponse.userId);

    // Save the full user response as JSON for easy access
    prefs?.setString(appKeys.keyUserObject, jsonEncode(authResponse.toJson()));
  }

  String? getAccessToken() {
    return prefs?.getString(appKeys.tokenKey);
  }

  AuthResponse? getAuthResponse()  {
    final userJson = prefs?.getString(appKeys.keyUserObject);

    if (userJson != null) {
      try {
        final Map<String, dynamic> userMap = jsonDecode(userJson);
        return AuthResponse.fromJson(userMap);
      } catch (e) {
        // Handle JSON parsing error
        return null;
      }
    }
    return null;
  }

   bool hasValidToken()  {
    final token =  getAccessToken();
    return token != null && token.isNotEmpty;
  }

   void clearTokens()  {
     prefs?.remove(appKeys.tokenKey);
     prefs?.remove(appKeys.keyUserObject);
     prefs?.remove('user_id');
  }

   bool hasTokens()  {
    final token =  getAccessToken();
    return token != null && token.isNotEmpty;
  }

  String? get getUserLoginToken {
    return userModel?.token;
  }

  String? get userId {
    // Try to get from direct storage first (faster)
    final directUserId = prefs?.getString('user_id');
    if (directUserId != null && directUserId.isNotEmpty) {
      print("USER_ID:-$directUserId");
      return directUserId;
    }
    // Fallback to parsing from full user object
    return userModel?.userId;
  }

  String get userIdString {
    return userId ?? '';
  }

  void saveUserData(Object obj) {
    prefs?.setString(appKeys.keyUserObject, jsonEncode(obj));
  }

  //---------------------- Session
  int? get getSessionId {
    return prefs?.getInt(appKeys.keySessionId);
  }

  void saveSessionId(int id) {
    prefs?.setInt(appKeys.keySessionId, id);
  }

  String? get getFavNetworkSsid {
    return prefs?.getString(appKeys.favNetworkSsid)==''?null:prefs?.getString(appKeys.favNetworkSsid);
  }
  String? get getFavNetworkPass {
    return prefs?.getString(appKeys.favNetworkPass)==''?null:prefs?.getString(appKeys.favNetworkPass);
  }

  String? get getFavoriteBLEName {
    return prefs?.getString(appKeys.addFavoriteBLEName)==''?null:prefs?.getString(appKeys.addFavoriteBLEName);
  }
  String? get getFavoriteBLEId {
    return prefs?.getString(appKeys.addFavoriteBLEId)==''?null:prefs?.getString(appKeys.addFavoriteBLEId);
  }

  void saveBle(String addFavoriteBLEId  , String addFavoriteBLEName) {
    prefs?.setString(appKeys.addFavoriteBLEId, addFavoriteBLEId);
    prefs?.setString(appKeys.addFavoriteBLEName, addFavoriteBLEName);
  }
  void saveNetwork(String favNetworkPass  , String favNetworkSsid) {
    prefs?.setString(appKeys.favNetworkSsid, favNetworkSsid);
    prefs?.setString(appKeys.favNetworkPass, favNetworkPass);
  }

  bool get getSessionAlert1Visiblity {
    return prefs?.getBool(appKeys.keySessionAlert1Visiblity) ?? true;
  }

  void saveSessionAlert1Visiblity(bool id) {
    prefs?.setBool(appKeys.keySessionAlert1Visiblity, id);
  }

  //

  bool get getSessionAlert2Visiblity {
    return prefs?.getBool(appKeys.keySessionAlert2Visiblity) ?? true;
  }

  void saveSessionAlert2Visiblity(bool id) {
    prefs?.setBool(appKeys.keySessionAlert2Visiblity, id);
  }
  //----------------------

  void clearUserData() {
    prefs?.clear();
  }
}
