import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/utils/router.gr.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: Routes.splashView,
      onGenerateRoute: Router().onGenerateRoute,
    );

    // return PlatformApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Auth App',
    //   color: Colors.blue,
    // );
  }
}
