import 'package:get/get.dart';
import 'package:getXAuth/app/data/interfaces/local/onboarding_interface.dart';
import 'package:getXAuth/app/routes/app_pages.dart';

enum OnboardingStatus { unknown, ongoing, done }

class OnboardingController extends GetxController {
  final OnboardingInterface _onboardingInterface = Get.find();
  final onboardingStatus = OnboardingStatus.unknown.obs;

  @override
  void onInit() {
    init();
    ever(onboardingStatus, (a) {
      print("On boarding status changed: $a");
    });
    super.onInit();
  }

  void goToLoginPage() {
    setOnboardingStatus(OnboardingStatus.done);
    Get.offAllNamed(AppRoutes.LOGIN);
  }

  void init() async {
    String _status = await _onboardingInterface.getStatus();
    setOnboardingStatus(parseStatus(_status));
  }

  OnboardingStatus parseStatus(String status) {
    switch (status) {
      case "done":
        return OnboardingStatus.done;
        break;
      case "ongoing":
        return OnboardingStatus.ongoing;
        break;
      default:
        return OnboardingStatus.unknown;
    }
  }

  void setOnboardingStatus(OnboardingStatus status) {
    String newStatus;
    switch (status) {
      case OnboardingStatus.unknown:
        newStatus = "unknown";
        break;
      case OnboardingStatus.done:
        newStatus = "done";
        break;
      case OnboardingStatus.ongoing:
        newStatus = "ongoing";
        break;
      default:
    }
    _onboardingInterface.setStatus(newStatus);
    onboardingStatus(status);
  }

  void removeOnBoardingStatus() {
    setOnboardingStatus(OnboardingStatus.unknown);
  }
}
