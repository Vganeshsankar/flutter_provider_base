import 'package:flutter_provider/src/providers/home_screen_provider/home_screen_provider.dart';
import 'package:flutter_provider/src/providers/login_provider/login_provider.dart';
import 'package:flutter_provider/src/providers/splash_provider/splash_provider.dart';
import 'package:flutter_provider/src/providers/theme_provider/theme_provider.dart';
import 'package:provider/provider.dart';

class Providers {
  Providers._();

  static final providers = [
    ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
    ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
    ChangeNotifierProvider<HomeScreenProvider>(
      create: (_) => HomeScreenProvider(),
    ),
    ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
  ].toList();

}
