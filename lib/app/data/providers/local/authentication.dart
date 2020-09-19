import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getXAuth/app/data/models/credentials.dart';
import 'package:getXAuth/app/modules/onboarding/onboarding_controller.dart';
import 'package:getXAuth/app/utils/constants.dart';

class LocalAuthentication {
  static const SET_SESSION_KEY = Constants.SESSION_KEY;
  static const ONBOARDING_STATUS = Constants.ONBOARDING_STATUS;
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  // set session(Credentials credentials) => this.setSession(credentials);
  get session => this._getSession();
  get onboardingStatus => this._getOnboardingStatus();
  Future<void> setSession(Credentials credentials) async {
    await _storage.write(
        key: SET_SESSION_KEY,
        value: jsonEncode(credentials.toJson()));
    setOnboardingStatus(OnboardingStatus.done);
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

  void setOnboardingStatus(OnboardingStatus status) {
    String newStatus;
    switch (status) {
      case OnboardingStatus.uknown:
        _storage.delete(key: ONBOARDING_STATUS);
        break;
      case OnboardingStatus.done:
        newStatus = "done";
        break;
      case OnboardingStatus.ongoing:
        newStatus = "ongoing";
        break;
      default:
    }
    _storage.write(key: ONBOARDING_STATUS, value: newStatus);
  }

  Future<OnboardingStatus> _getOnboardingStatus() async {
    final String _status = await _storage.read(key: ONBOARDING_STATUS);
    if (_status == "done") {
      return OnboardingStatus.done;
    } else if (_status == "ongoing") {
      return OnboardingStatus.ongoing;
    }
    return OnboardingStatus.uknown;
  }
}
