import 'package:flutter/material.dart';

class TTabBarTheme {
  TTabBarTheme._();
  static TabBarThemeData lightTextTheme = TabBarThemeData(
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  );
  static TabBarThemeData darkTextTheme = TabBarThemeData(
    overlayColor: WidgetStateProperty.all(Colors.transparent),
  );
}
