import 'package:get/get.dart';
import 'package:getXAuth/app/modules/authentication/login/login_controller.dart';

class LoginBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<LoginController>(() => LoginController());
  }
}