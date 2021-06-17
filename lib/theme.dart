import 'package:flutter/material.dart';
import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "",
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      textTheme: TextTheme(
        headline6: TextStyle(
            color: Color(0xFF888888),
            fontSize: 20.0
        ),
      ),
    ),
    inputDecorationTheme: inputDecorationTheme(),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10.0,
    ),
    focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(28.0),
      borderSide: BorderSide(color: kTextColor),
      gapPadding: 10.0,
    ),
  );
}