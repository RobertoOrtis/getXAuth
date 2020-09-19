import 'package:get/get.dart';
import 'package:getXAuth/app/data/repositories/authentication/authentication_repository.dart';
import 'package:getXAuth/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _authenticationRepository =
      Get.find<AuthenticationRepository>();
  void signin() {
    _authenticationRepository.setAuthenticationStatus(AuthenticationStatus.authenticated);
    Get.offAllNamed(AppRoutes.HOME);
  }
}
