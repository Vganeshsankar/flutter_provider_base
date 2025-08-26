import 'package:flutter/material.dart';

import '../../constants/app_router_name.dart';

class SplashProvider with ChangeNotifier {
  void moveToHomeScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, login_screen);
    });
  }
}
