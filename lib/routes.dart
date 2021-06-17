
import 'package:covid19_app/home_screen.dart';
import 'package:covid19_app/log_in_screen_body.dart';
import 'package:covid19_app/sign_in_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'welcome_page.dart';
import 'home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.id: (context) => HomePage(),
  SignupPage.id: (context) => SignupPage(),
  LoginPage.id: (context) => LoginPage(),
  HomeScreen.id: (context) => HomeScreen(),
};