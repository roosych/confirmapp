import 'package:flutter/material.dart';

const metakRed = Color(0xffed1c24);
const metakSemiRed = Color(0xffff6a5b);
const metakGreen = Color(0xFF7BC043);
const metakGrey = Colors.grey;
final br8 = BorderRadius.circular(8);

class AppTheme {
  static final themeData = ThemeData(
    dividerColor: Colors.transparent,
    fontFamily: 'Montserrat',
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: Colors.transparent,
    ),
    useMaterial3: true,
  );
}