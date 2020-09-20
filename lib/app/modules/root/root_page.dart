import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:getXAuth/app/modules/authentication/login/login_page.dart';
import 'package:getXAuth/app/modules/home/home_page.dart';
import 'package:getXAuth/app/modules/onboarding/onboarding_page.dart';
import 'package:getXAuth/app/modules/root/root_controller.dart';
import 'package:getXAuth/app/routes/app_pages.dart';

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