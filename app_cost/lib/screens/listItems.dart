import 'package:app_cost/components/buttomListComponent.dart';
import 'package:app_cost/core/AppColor.dart';
import 'package:app_cost/core/AppFontStyle.dart';
import 'package:flutter/material.dart';

class Listitems extends StatefulWidget {
  const Listitems({super.key});

  @override
  State<Listitems> createState() => _ListitemsState();
}

class _ListitemsState extends State<Listitems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HearderContainer(), body: ContainerBody());
  }

  Stack ContainerBody() => Stack(
    alignment: AlignmentDirectional.center,
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
        child: Padding(
          padding: const EdgeInsets.only(top:30),
          child: Column(
            children: [
              Buttomlistcomponent(title: "19/10/25", address: "costTotal",),
            ],
          ),
        ),
      ),
    ],
  );

  AppBar HearderContainer() => AppBar(
    // Tengo que hacer que reciba el mes correspondiente
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
