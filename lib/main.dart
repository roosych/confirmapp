import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/routes/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:test_app/ui/screens/auth_screen.dart';

// ignore: depend_on_referenced_packages
import 'package:logging/logging.dart';

import 'data/models/env_config.dart';
import 'main_config.dart';
import 'di.dart';
import 'logging.dart';
import 'ui/theme/app_theme.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();
  late EnvConfig envConfig;
  try {
    envConfig = await rootBundle.loadStructuredData(
      'asset/env.secret',
          (values) async {
        return EnvConfig.fromJson(jsonDecode(values));
      },
    );
    if (kDebugMode) {
      print('Config file: $envConfig');
    }
  } catch (e) {
    return;
  }
  if (MainConfig.env == 'dev') {
    configureDependencies(config: envConfig.dev);
    setupLogger(level: Level.ALL);
  } else {
    configureDependencies(config: envConfig.prod, env: Environment.prod);
    setupLogger();
  }
  //await Future.delayed(const Duration(seconds: 0));

  runApp(const Localisation(locale: MainConfig.localeRu));
  // whenever your initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();
}

class Localisation extends StatelessWidget {
  final Locale? locale;
  const Localisation({Key? key, this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: 'asset/translations',
      supportedLocales: const [MainConfig.localeRu, MainConfig.localeAz],
      fallbackLocale: locale ?? MainConfig.localeRu,
      startLocale: locale ?? MainConfig.localeRu,
      useFallbackTranslations: true,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.themeData,
      home: const AuthScreen(),
      routes: routes,
    );
  }
}
