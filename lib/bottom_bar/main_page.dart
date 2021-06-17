import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

enum BottomIcons { Home, Stats, Nearby, Profile }

class _MainPageState extends State<MainPage> {

  List<String> items = ['Taco', 'Chicken Wings', 'Pizza', 'Burger', 'Hot dog', 'Taco', 'Chicken Wings', 'Pizza', 'Burger', 'Hot dog', 'Taco'];
  List<String> prices = ['120', '300', '200', '110', '70', '120', '300', '200', '110', '70', '120'];

  List<String> blogTitle = ['Hot Sauce-Spiked Sausage', 'Tasty Taco', 'Sizzling Sushi', 'Jamaican Salad'];
  List<String> blogContent = ['Hot sauce is used twice to season these super flavorful veggie... Read more', 'Hot sauce is used twice to season these super flavorful veggie... Read more', 'Hot sauce is used twice to season these super flavorful veggie... Read more', 'Hot sauce is used twice to season these super flavorful veggie... Read more'];

  BottomIcons bottomIcons = BottomIcons.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          bottomIcons == BottomIcons.Home
              ? Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10.0, top: 20.0, bottom: 60.0),
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: prices.length,
                      itemBuilder: (BuildContext context, int index) => Card(
                        color: Colors.grey.shade300,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Image.asset('images/$index.png'),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(items[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                        SizedBox(height: 10,),
                                        Text(prices[index], style: TextStyle(fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ),
                ),
              )
              : Container(),
          bottomIcons == BottomIcons.Stats
              ? Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10.0, top: 20.0, bottom: 60.0),
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Image.asset('images/$index.png'),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(blogTitle[index], style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10,),
                                    Text(blogContent[index], textAlign: TextAlign.center,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
              : Container(),
          bottomIcons == BottomIcons.Nearby
              ? Center(
            child: Text(
              "Hi, this is cart page",
              style: TextStyle(fontSize: 18),
            ),
          )
              : Container(),
          bottomIcons == BottomIcons.Profile
              ? Center(
            child: Text(
              "Hi, this is profile page",
              style: TextStyle(fontSize: 18),
            ),
          )
              : Container(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Home;
                        });
                      },
                      bottomIcons:
                      bottomIcons == BottomIcons.Home ? true : false,
                      icons: EvaIcons.homeOutline,
                      text: "Home"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Stats;
                        });
                      },
                      bottomIcons:
                      bottomIcons == BottomIcons.Stats ? true : false,
                      icons: EvaIcons.bookOutline,
                      text: "Blog"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Nearby;
                        });
                      },
                      bottomIcons:
                      bottomIcons == BottomIcons.Nearby ? true : false,
                      icons: EvaIcons.shoppingCartOutline,
                      text: "Cart"),
                  BottomBar(
                      onPressed: () {
                        setState(() {
                          bottomIcons = BottomIcons.Profile;
                        });
                      },
                      bottomIcons:
                      bottomIcons == BottomIcons.Profile ? true : false,
                      icons: EvaIcons.personOutline,
                      text: "Profile"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

