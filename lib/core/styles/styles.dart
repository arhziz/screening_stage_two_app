import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ButtonStyle customButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
    padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.symmetric(vertical: 10)),
  );

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      primaryColorDark: isDarkTheme ? Colors.white : Colors.black,
      backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      scaffoldBackgroundColor:
          isDarkTheme ? Color(0xFF151515) : Colors.grey[50],
      appBarTheme: AppBarTheme(
          elevation: 1.0,
          backgroundColor: isDarkTheme ? Color(0xFF151515) : Colors.grey[50]),
    );
  }
}
