import 'dart:convert';

import 'dart:io';

import 'package:app_cost/core/AppColor.dart';

import 'package:app_cost/repository/method_post.dart';

import 'package:flutter/material.dart';

import 'package:app_cost/repository/response.dart';


class Buttomcomponent extends StatefulWidget {
  final String product;
  final String cost;

  const Buttomcomponent({super.key, required this.product, required this.cost});

  @override
  State<Buttomcomponent> createState() => _ButtomcomponentState();
}

class _ButtomcomponentState extends State<Buttomcomponent> {
  Future<MethodPost?>? _info;
  ResponseApi _response = ResponseApi();

  @override
  Widget build(BuildContext context) {
    return buttomComponent(_info);
  }

  FloatingActionButton buttomComponent(Future? info) => FloatingActionButton(
    heroTag: false,
    backgroundColor: Appcolor().backgroudItem,
    elevation: 10,

    child: Icon(Icons.add, color: Appcolor().borderColor),
    onPressed: () {
      info = _response.fetcheResponse(widget.product, widget.cost);

      // FutureBuilder(
      //   future: info,
      //   builder: (context, snapshot) {
         
      //     if (snapshot.hasError) {
      //       return Text("${snapshot.error}");
         
      //     } else if (snapshot.connectionState == ConnectionState.waiting) {
      //       return CircularProgressIndicator();
         
      //     } else if (snapshot.hasData) {
      //       print(snapshot.data);
      //       return Text(snapshot.data);
      //     }

      //     return Text("null");
      //   },
      // );
    },
  );
}
