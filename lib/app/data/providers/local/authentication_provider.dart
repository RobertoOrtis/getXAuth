import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getXAuth/app/data/models/credentials.dart';
import 'package:getXAuth/app/utils/constants.dart';

class LocalAuthenticationProvider {
  static const SET_SESSION_KEY = Constants.SESSION_KEY;
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  get session => this._getSession();

  Future<void> setSession(Credentials credentials) async {
    await _storage.write(
        key: SET_SESSION_KEY, value: jsonEncode(credentials.toJson()));
  }

  Future<Credentials> _getSession() async {
    final String data = await _storage.read(key: SET_SESSION_KEY);

    if (data != null) {
      final Credentials credentials = Credentials.fromJson(jsonDecode(data));

      print("Crendentials: ${credentials.credentials}");
      return credentials;
    }
    return null;
  }

  void clearSession() {
    _storage.delete(key: SET_SESSION_KEY);
  }
}
