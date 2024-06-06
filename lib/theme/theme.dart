import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.amber.shade100,
    primary: Colors.amber.shade500,
    secondary: Colors.amber.shade200,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade100,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
  ),
);
