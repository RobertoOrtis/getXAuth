import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getXAuth/app/data/models/credentials.dart';
import 'package:getXAuth/app/data/providers/local/authentication.dart';
import 'package:getXAuth/app/data/repositories/authentication/authentication_repository.dart';
import 'package:getXAuth/app/modules/authentication/login/login.dart';
import 'package:getXAuth/app/modules/home/home.dart';
import 'package:getXAuth/app/modules/onboarding/onboarding.dart';
part './app_routes.dart';

class AppPages {
  List<GetPage> getPages(String routeName) {
    return [
      GetPage(
          name: AppRoutes.ROOT,
          binding: RootBinding(),
          page: () => Root(routeName: routeName)),
      GetPage(
          name: AppRoutes.ONBOARDING,
          page: () => OnboardingPage(),
          binding: OnboardingBinding()),
      GetPage(
          name: AppRoutes.LOGIN,
          page: () => LoginPage(),
          binding: LoginBinding()),
      GetPage(
          name: AppRoutes.HOME, page: () => HomePage(), binding: HomeBinding()),
    ];
  }
}

class RootController extends GetxController {
  LocalAuthentication _localAuth = Get.find<LocalAuthentication>();

  AuthenticationStatus _authenticationStatus;
  get initialRoute => this.getInitialRoute();
  get authenticationStatus => this._authenticationStatus;

  void setAuthenticationStatus(AuthenticationStatus status) {
    _authenticationStatus = status;
  }

  Future<String> getInitialRoute() async {
    Credentials session = await _localAuth.session;
    OnboardingStatus onBoardingDone = await _localAuth.onboardingStatus;

    if (onBoardingDone == OnboardingStatus.uknown && session == null) {
      return AppRoutes.ONBOARDING;
    } else if (session != null) {
      return AppRoutes.HOME;
    }
    return AppRoutes.LOGIN;
  }
}

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
  }
}

class Root extends StatelessWidget {
  const Root({Key key, @required String routeName})
      : _routeName = routeName,
        super(key: key);
  final String _routeName;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(builder: (_) {
      switch (_routeName) {
        case AppRoutes.HOME:
          return HomePage();
        case AppRoutes.LOGIN:
          return LoginPage();
        default:
          return OnboardingPage();
      }
    });
  }
}
