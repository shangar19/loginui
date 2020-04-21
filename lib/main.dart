import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginui/pages/login_page.dart';
import 'package:loginui/pages/sign_up_page.dart';
import 'package:loginui/pages/welcome_page.dart';
import 'package:loginui/services/nav_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      title: 'Login',
      navigatorKey: NavigationService.instance.navKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff2f30e8),
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: "welcome",
      routes: {
        "Login": (BuildContext context) => LoginPage(),
        "Register" : (BuildContext context) => SignUpPage(),
        "welcome" : (BuildContext context) => WelcomePage()
      },
    );
  }
}

