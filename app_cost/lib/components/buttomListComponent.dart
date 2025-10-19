import 'package:app_cost/core/AppColor.dart';
import 'package:app_cost/core/AppFontStyle.dart';
import 'package:app_cost/screens/costTotal.dart';
import 'package:app_cost/screens/listItems.dart';
import 'package:flutter/material.dart';

class Buttomlistcomponent extends StatefulWidget {
  final String title;
  final String address;

  const Buttomlistcomponent({
    super.key,
    required this.title,
    required this.address,
  });

  @override
  State<Buttomlistcomponent> createState() => _ButtomlistcomponentState();
}

class _ButtomlistcomponentState extends State<Buttomlistcomponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 55,
      child: FloatingActionButton.extended(
        heroTag: false,
        onPressed: () {
          if (widget.address == "listItems") {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Listitems()));
          } else {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Costtotal()));
          }
        },
        backgroundColor: Appcolor().background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Appcolor().borderColor, width: 1.0),
        ),

        label: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: Appfontstyle().textStyleButtom,
        ),
      ),
    );
  }
}
