import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covid19_app/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: HomePage(),
    );

  }
}