import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getXAuth/app/utils/constants.dart';

class OnboardingProvider {
  static const ONBOARDING_STATUS = Constants.ONBOARDING_STATUS;
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  get status => this._getStatus();

  void setStatus(status) {
    _storage.write(key: ONBOARDING_STATUS, value: status);
  }

  Future<String> _getStatus() async {
    return await _storage.read(key: ONBOARDING_STATUS);
  }
}
