import 'package:app_cost/core/AppColor.dart';
import 'package:flutter/material.dart';

class Textcomponent extends StatefulWidget {
  final String item;
  final String title;

  const Textcomponent({super.key, required this.item, required this.title});

  @override
  State<Textcomponent> createState() => _TextcomponentState();
}

class _TextcomponentState extends State<Textcomponent> {
  @override
  Widget build(BuildContext context) {
    return containerItem(widget.item, widget.title);
  }

  Column containerItem(String item, String title) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: title,

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Appcolor().borderColor),
              borderRadius: BorderRadius.circular(30),
            ),

            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Appcolor().borderColor),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onChanged: (text) {
            setState(() {
              item = text;
            });
          },
        ),
      ),
    ],
  );
}
