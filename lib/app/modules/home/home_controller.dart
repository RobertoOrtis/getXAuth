import 'package:get/get.dart';
import 'package:getXAuth/app/data/repositories/authentication/authentication_repository.dart';
import 'package:getXAuth/app/modules/onboarding/onboarding_controller.dart';
import 'package:getXAuth/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final AuthenticationRepository _authenticationRepository =
      Get.find<AuthenticationRepository>();
  final OnboardingController _onboardingController =
      Get.find<OnboardingController>();
  @override
  void onInit() {
    // print(_authRepository.authenticationStatus);
    // _authenticationRepository.verifyUserCredentials();
    // print("${_authRepository.authenticationStatus}");
    super.onInit();
  }

  void signOut() {
    _authenticationRepository
        .setAuthenticationStatus(AuthenticationStatus.unauthenticated);
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  void removeOnBoardingStatus() {
    _onboardingController.removeOnBoardingStatus();
  }
}
