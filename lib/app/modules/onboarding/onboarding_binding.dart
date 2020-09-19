import 'package:get/get.dart';
import 'package:getXAuth/app/modules/onboarding/onboarding_controller.dart';

class OnboardingBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}