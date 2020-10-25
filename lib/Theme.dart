import 'package:flutter/material.dart';

class Colors {
  Colors._();
  static const Color darkGrey = Color(0xFF212121);
  static const Color lightGrey = Color(0xFF616161);
  static const Color lightPurple = Color(0xFFD500F9);
}

final ThemeData MovieAppThemeData = new ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.darkGrey,
  accentColor: Colors.lightGrey,
);

//Theme.of(context).colorScheme.surface
