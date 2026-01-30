//------------------------------------------  KEYS

import 'package:injectable/injectable.dart';

@singleton
class AppKeys {
  String keyThememode = 'THEME_MODE';
  String keyUserObject = 'USER_OBJECT';
    String tokenKey = 'auth_token_key';
  // Session
  String keySessionId = 'SESSION_ID';
  String keySessionAlert1Visiblity = 'SESSION_ALERT_1ST';
  String keySessionAlert2Visiblity = 'SESSION_ALERT_2ST';
  String favNetworkSsid = 'favNetworkSsid';
  String favNetworkPass = 'favNetworkPass';

  String addFavoriteBLEId = 'addFavoriteBLEId';
  String addFavoriteBLEName = 'addFavoriteBLEName';
}
