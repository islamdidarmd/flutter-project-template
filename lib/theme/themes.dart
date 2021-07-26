import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme.light(
  primary: const Color(0xff128af4),
  primaryVariant: const Color(0xff0444f4),
  secondary: const Color(0xff5cddff),
  secondaryVariant: const Color(0xff32adf8),
  surface: Colors.white,
  background: Colors.white,
  error: const Color(0xffb00020),
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onSurface: Colors.black,
  onBackground: Colors.black,
  onError: Colors.white,
);

const darkColorScheme = ColorScheme.dark(
  primary: const Color(0xff128af4),
  primaryVariant: const Color(0xff0444f4),
  secondary: const Color(0xff5cddff),
  secondaryVariant: const Color(0xff32adf8),
  surface: const Color(0xff121212),
  background: const Color(0xff121212),
  error: const Color(0xffcf6679),
  onPrimary: Colors.black,
  onSecondary: Colors.black,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.black,
);

final lightIconTheme = IconThemeData(color: lightColorScheme.onPrimary);

final lightButtonTheme = ButtonThemeData(textTheme: ButtonTextTheme.accent);
final lightTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(primary: lightColorScheme.onPrimary),
);

final lightTheme = ThemeData.from(colorScheme: lightColorScheme).copyWith(
  iconTheme: lightIconTheme,
  primaryIconTheme: lightIconTheme,
  buttonTheme: lightButtonTheme,
  textButtonTheme: lightTextButtonTheme,
  unselectedWidgetColor: lightColorScheme.onPrimary,
);

final darkTheme = ThemeData.from(colorScheme: darkColorScheme).copyWith();
