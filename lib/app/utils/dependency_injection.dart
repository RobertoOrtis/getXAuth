import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getXAuth/app/data/interfaces/local/local_authentication_interface.dart';
import 'package:getXAuth/app/data/interfaces/local/onboarding_interface.dart';
import 'package:getXAuth/app/data/providers/local/authentication_provider.dart';
import 'package:getXAuth/app/data/providers/local/onboarding_provider.dart';
import 'package:getXAuth/app/data/providers/remote/authentication_client.dart';
import 'package:getXAuth/app/data/repositories/local/authentication_repository.dart';
import 'package:getXAuth/app/data/repositories/local/onboarding_repository.dart';
import 'package:getXAuth/app/modules/authentication/authentication_controller.dart';
import 'package:getXAuth/app/modules/onboarding/onboarding_controller.dart';
import 'package:getXAuth/app/modules/root/root_controller.dart';

class DependencyInjection {
  // @override
  static Future<String> getInitialRoute() async {
    print("Injecting dependencies");
    Get.lazyPut<LocalAuthenticationInterface>(() => LocalAuthenticationRepository(
      authenticationProvider: LocalAuthenticationProvider()
    ));
    Get.lazyPut<OnboardingInterface>(() => OnboardingRepository(
      onboardingProvider: OnboardingProvider()
    ));
    Get.lazyPut(() => FlutterSecureStorage());
    Get.lazyPut(() => OnboardingController());
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
    Get.lazyPut(() => AuthenticationController(), fenix: true);
  }
}
