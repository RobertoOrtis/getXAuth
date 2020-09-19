import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getXAuth/app/routes/app_pages.dart';
import 'package:getXAuth/app/utils/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String _routeName = await DependencyInjection.getInitialRoute();
  DependencyInjection.init();

  runApp(App(
    routeName: _routeName,
  ));
}

class App extends StatelessWidget {
  App({@required String routeName})
      : assert(routeName != null),
        _routeName = routeName;
  final String _routeName;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Authentication Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: _routeName,
      // theme: appThemeData,
      // defaultTransition: Transition.fade,
      getPages: AppPages().getPages(_routeName),
    );
  }
}
