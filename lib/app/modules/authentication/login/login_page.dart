import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getXAuth/app/modules/authentication/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          body: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login Page"),
                  FlatButton(
                    onPressed: () => _.signin(),
                    child: Text("Sign in"),
                  )
              ],)
            ),
          ),
        );
      },
    );
  }
}
