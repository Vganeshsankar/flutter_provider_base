import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_provider/src/constants/app_router_name.dart';
import 'package:flutter_provider/src/providers/theme_provider/theme_provider.dart';
import 'package:flutter_provider/src/utils/storage_hepler/storage_helper.dart';
import 'package:flutter_provider/theme/app_theme.dart';
import 'routes.dart';

import 'package:provider/provider.dart';
import './providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const flavor = String.fromEnvironment('FLAVOR');
  String envFile;
  AppEnv appEnv;
  switch (flavor) {
    case 'dev':
      envFile = '.env.dev';
      appEnv = AppEnv.dev;
      break;
    case 'stage':
      envFile = '.env.stage';
      appEnv = AppEnv.live;
      break;
    default:
      envFile = '.env.dev';
      appEnv = AppEnv.dev;
      break;
  }
  await StorageHelper.init(appEnv);
  await dotenv.load(fileName: envFile);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvide, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            themeMode: themeProvide.themeMode,
            darkTheme: AppTheme.darkTheme,
            initialRoute: splash_screen,
            routes: Routes.routes,
          );
        },
      ),
    );
  }
}
