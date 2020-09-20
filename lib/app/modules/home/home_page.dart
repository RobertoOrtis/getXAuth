import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:getXAuth/app/modules/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Stack(children: [
          Scaffold(
            body: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Home Page"),
                    FlatButton(
                        onPressed: () => _.signOut(), child: Text("Sign out")),
                    FlatButton(
                        onPressed: () => _.removeOnBoardingStatus(),
                        child: Text("Unset On Boarding Done"))
                  ],
                ),
              ),
            ),
          ),
        ]);
      },
    );
  }
}
