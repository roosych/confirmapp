import 'package:flutter/material.dart';
import 'package:test_app/routes/routes.dart';
import 'package:test_app/screens/dashboard_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Future.delayed(const Duration(seconds: 0));

  runApp(const MyApp());
  // whenever your initialization is completed, remove the splash screen:
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerColor: Colors.transparent,
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
      routes: routes,
    );
  }
}
