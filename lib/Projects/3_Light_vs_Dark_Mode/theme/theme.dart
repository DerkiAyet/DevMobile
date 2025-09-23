import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  //well this controlled by the device for example for the web in chrome if we change the theme to dark the text will change to white automatically
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade400,
    secondary: Colors.grey.shade300,
    tertiary: Colors.grey.shade200,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.grey.shade900,
    secondary: Colors.grey.shade800,
    tertiary: Colors.grey.shade700,
  ),
);
