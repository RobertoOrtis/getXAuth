import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getXAuth/app/data/providers/local/authentication.dart';
import 'package:getXAuth/app/data/providers/remote/authentication_client.dart';
import 'package:getXAuth/app/data/repositories/authentication/authentication_repository.dart';
import 'package:getXAuth/app/modules/onboarding/onboarding_controller.dart';
import 'package:getXAuth/app/routes/app_pages.dart';

class DependencyInjection /* extends Bindings */ {
  // @override
  static Future<String> getInitialRoute() async {
    print("Injecting dependencies");
    Get.lazyPut(() => LocalAuthentication());
    Get.lazyPut(() => FlutterSecureStorage());
    String routeName;
    await Get.putAsync<RootController>(() async {
      final authController = RootController();
      routeName = await RootController().initialRoute;
      return authController;
    });
    return routeName;
  }

  static void init() {
    // Providers
    Get.lazyPut(() => AuthenticationApiClient(), fenix: true);

    // Repositories
    Get.lazyPut(() => AuthenticationRepository(), fenix: true);

    // Controllers
    Get.lazyPut(() => OnboardingController(), fenix: true);
  }
}
