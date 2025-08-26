import 'package:flutter/material.dart';
import 'package:flutter_provider/src/constants/app_router_name.dart';
import 'package:flutter_provider/src/screens/home_screen/home_screen.dart';
import 'package:flutter_provider/src/screens/login_screen/login_screen.dart';
import 'package:flutter_provider/src/screens/splash_screen/splash_screen.dart';

class Routes {
  Routes._();

  static final dynamic routes = <String, WidgetBuilder>{
    splash_screen: (BuildContext context) => SplashScreen(),
    home_screen: (BuildContext context) => HomeScreen(),
    login_screen: (BuildContext context) => LoginScreen(),
  };
}
