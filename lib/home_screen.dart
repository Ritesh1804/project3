import 'package:covid19_app/size_config.dart';
import 'package:flutter/material.dart';
import 'bottom_bar/main.dart';

class HomeScreen extends StatelessWidget {

  static const String id = "home_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: MyApp(),
    );
  }
}