import 'package:get/get.dart';
import 'package:getXAuth/app/modules/authentication/authentication_controller.dart';
import 'package:getXAuth/app/modules/onboarding/onboarding_controller.dart';

class HomeController extends GetxController {
  final AuthenticationController _authenticationController =
      Get.find<AuthenticationController>();

  // this._authenticationRepository.authenticationStatus;
  @override
  void onInit() {
    // print(_authRepository.authenticationStatus);
    // _authenticationRepository.verifyUserCredentials();
    // print("${_authRepository.authenticationStatus}");
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void signOut() {
    _authenticationController
        .setAuthenticationStatus(AuthenticationStatus.unauthenticated);
  }

  void removeOnBoardingStatus() {
    Get.find<OnboardingController>().removeOnBoardingStatus();
  }
}
