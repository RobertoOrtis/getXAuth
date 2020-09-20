import 'package:get/get.dart';
import 'package:getXAuth/app/modules/authentication/authentication_controller.dart';

class LoginController extends GetxController {
  final AuthenticationController _authenticationRepository =
      Get.find<AuthenticationController>();
  void signin() {
    _authenticationRepository.setAuthenticationStatus(AuthenticationStatus.authenticated);
    // Get.offAllNamed(AppRoutes.HOME);
  }
}
