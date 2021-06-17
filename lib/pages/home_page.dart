import 'dart:ui';

import 'package:covid19_app/core/consts.dart';
import 'package:covid19_app/core/flutter_icons.dart';
import 'package:covid19_app/models/food_model.dart';
import 'package:covid19_app/pages/detail_page.dart';
import 'package:covid19_app/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodModel> foodList = FoodModel.list;
  PageController pageController = PageController(viewportFraction: .8);
  var paddingLeft = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 60),
              child: _buildRightSection(),
            ),
            Container(
              color: AppColors.greenColor,
              height: MediaQuery.of(context).size.height,
              width: 60,
              padding: EdgeInsets.only(top: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: ExactAssetImage("assets/profile.jpg"),
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(FlutterIcons.menu),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Transform.rotate(
                angle: -math.pi / 2,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _buildMenu("Vegetables", 0),
                        _buildMenu("Chicken", 1),
                        _buildMenu("Salad", 2),
                      ],
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      margin: EdgeInsets.only(left: paddingLeft),
                      width: 150,
                      height: 75,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ClipPath(
                              clipper: AppClipper(),
                              child: Container(
                                width: 150,
                                height: 60,
                                color: AppColors.greenColor,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: math.pi / 2,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: Icon(
                                  FlutterIcons.arrow,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu(String menu, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          paddingLeft = index * 150.0;
        });
      },
      child: Container(
        width: 150,
        padding: EdgeInsets.only(top: 16),
        child: Center(
          child: Text(
            menu,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRightSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          _customAppBar(),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 350,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: foodList.length,
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailPage(foodList[index]),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Stack(
                            children: <Widget>[
                              _buildBackGround(index),
                              Align(
                                alignment: Alignment.topRight,
                                child: Transform.rotate(
                                  angle: math.pi / 3,
                                  child: Hero(
                                    tag: "image${foodList[index].imgPath}",
                                    child: Image(
                                      width: 180,
                                      image: AssetImage(
                                          "assets/${foodList[index].imgPath}"),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 30,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.redColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    "\$${foodList[index].price.toInt()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                _buildPopularList(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _buildBackGround(int index) {
    return Container(
      margin: EdgeInsets.only(
        top: 50,
        bottom: 20,
        right: 50,
      ),
      padding: EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.all(
          Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: SizedBox()),
          Row(
            children: <Widget>[
              SizedBox(width: 10),
              Text(
                "(120 Reviews)",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Text(
            "${foodList[index].name}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: foodList.length,
      padding: EdgeInsets.only(
        left: 40,
        bottom: 16,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: Row(
            children: <Widget>[
              Image(
                width: 80,
                image: AssetImage("assets/${foodList[index].imgPath}"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${foodList[index].name}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Text(
                        "\$${foodList[index].price.toInt()}",
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.redColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        "(${foodList[index].weight.toInt()}gm Weight)",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: "Hello,\n",
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "Bon Appétit",
                  style: TextStyle(
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}