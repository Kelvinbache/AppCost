import 'package:app_cost/core/AppColor.dart';
import 'package:app_cost/core/AppFontStyle.dart';
import 'package:flutter/material.dart';

class Costtotal extends StatefulWidget {
  const Costtotal({super.key});

  @override
  State<Costtotal> createState() => _CosttotalState();
}

class _CosttotalState extends State<Costtotal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HeaderContainer(), body: ContainerBody());
  }

  Stack ContainerBody() => Stack(
    children: [
      Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Appcolor().background),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Appcolor().backgroundSecudary),
            ),
          ),
        ],
      ),

      Positioned(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 60),
              child: Container(
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Appcolor().borderColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Product"),
                        SizedBox(width: 60),
                        Text("Cost"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("cafe"),
                        SizedBox(width: 75),
                        Text("12.08"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );

  AppBar HeaderContainer() => AppBar(
    title: Text("Octubre", style: Appfontstyle().textStyleButtom),
    backgroundColor: Appcolor().background,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(Icons.arrow_back, color: Appcolor().borderColor),
    ),
  );
}
