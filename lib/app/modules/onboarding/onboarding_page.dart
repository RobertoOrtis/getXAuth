import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getXAuth/app/modules/onboarding/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("On boarding"),
                  FlatButton(
                    onPressed: () => _.goToLoginPage(),
                    child: Text("Go to login")
                  )
                ],
              ),
            )
          ),
        );
      },
    );
  }
}
