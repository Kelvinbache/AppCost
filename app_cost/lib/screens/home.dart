import 'package:app_cost/components/buttomComponent.dart';
import 'package:app_cost/components/llistItems.dart';
import 'package:app_cost/components/textComponent.dart';
import 'package:app_cost/core/AppColor.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  String product = "";
  String cost = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderAppBar(),
      body: containerElements(),
      resizeToAvoidBottomInset: true,
    );
  }

  AppBar HeaderAppBar() => AppBar(backgroundColor: Appcolor().background);

  Stack containerElements() {
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        Column(
          children: [
            Expanded(
              child: Container(
                color: Appcolor().background,
                child: Column(
                  children: [
                    Textcomponent(item: product, title: "Product"),
                    Textcomponent(item: cost, title: "Cost"),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                color: Appcolor().backgroundSecudary,
                child: Llistitems(title: "History"),
              ),
            ),
          ],
        ),

        Positioned(
          child: Buttomcomponent(product: "cafe", cost: "12.3"),
        ),
      ],
    );
  }
}
