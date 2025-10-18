import 'package:app_cost/components/buttomComponent.dart';
import 'package:app_cost/components/llistItems.dart';
import 'package:app_cost/components/textComponent.dart';
import 'package:app_cost/core/AppColor.dart';
import 'package:app_cost/repository/method_post.dart';
import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  Future<MethodPost?>? _info;
  String product = "";
  String cost = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HeaderAppBar(), body: containerElements());
  }

  AppBar HeaderAppBar() => AppBar(backgroundColor: Appcolor().background);

  Container containerElements() {
    return Container(
      decoration: BoxDecoration(color: Appcolor().backgroundSecudary),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Appcolor().background),
            child: Column(
              children: [
                Textcomponent(item: product, title: "Product"),
                Textcomponent(item: cost, title: "Cost"),
                SizedBox(height: 80),
              ],
            ),
          ),

          Buttomcomponent(product: product, cost: cost),

          Llistitems(),

          // FutureBuilder(
          //   future: _info,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) {
          //       return Text("${snapshot.error}");
          //     } else if (snapshot.connectionState == ConnectionState.waiting) {
          //       return CircularProgressIndicator();
          //     } else if (snapshot.hasData) {
          //       return Text("${snapshot.data?.response}");
          //     }

          //     return Text("is not found");
          //   },
          // ),
        ],
      ),
    );
  }
}
