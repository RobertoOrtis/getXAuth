import 'package:get/get.dart';
import 'package:getXAuth/app/data/providers/local/authentication.dart';
import 'package:getXAuth/app/routes/app_pages.dart';

enum OnboardingStatus { uknown, ongoing, done }

class OnboardingController extends GetxController {
  final LocalAuthentication _localAuthentication =
      Get.find<LocalAuthentication>();
  void goToLogin() {
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  void removeOnBoardingStatus() {
    _localAuthentication.setOnboardingStatus(OnboardingStatus.uknown);
  }
}
