import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_provider/constants/styles.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeLightData(BuildContext context) {
  final _colors = Styles.colors;
  return ThemeData(
      appBarTheme: appBarTheme,
      primaryColor: _colors.primaryLight,
      iconTheme: IconThemeData(color: _colors.iconColorLight),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(secondary: _colors.secondaryLight),
      backgroundColor: Colors.white,
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: _colors.toggleBtnActiveColorLight,
        disabledColor: _colors.toggleBtnTrackerColorLight,
      ),
      textTheme: GoogleFonts.abelTextTheme().copyWith(
        bodyText1: GoogleFonts.abel(color: _colors.textColorLight),
      ));
}

ThemeData themeDarkData(BuildContext context) {
  final _colors = Styles.colors;
  return ThemeData(
      appBarTheme: appBarTheme,
      primaryColor: _colors.primaryDark,
      scaffoldBackgroundColor: Color.fromARGB(255, 29, 27, 27),
      iconTheme: IconThemeData(color: _colors.iconColorDark),
      colorScheme: ColorScheme.light(secondary: _colors.secondaryDark),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: _colors.toggleBtnActiveColorDark,
        disabledColor: _colors.toggleBtnTrackerColorDark,
      ),
      backgroundColor: Colors.black,
      textTheme: GoogleFonts.abelTextTheme().copyWith(
        bodyText1: GoogleFonts.abel(color: _colors.textColorDark),
      ));
}

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);
