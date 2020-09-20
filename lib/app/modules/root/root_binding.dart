import 'package:get/get.dart';
import 'package:getXAuth/app/modules/root/root_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
  }
}