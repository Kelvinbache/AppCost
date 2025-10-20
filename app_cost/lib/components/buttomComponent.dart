import 'dart:convert';
import 'dart:io';

import 'package:app_cost/core/AppColor.dart';

import 'package:app_cost/repository/method_post.dart';

import 'package:flutter/material.dart';

import 'package:app_cost/repository/response.dart';

import 'package:http/http.dart' as http;

class Buttomcomponent extends StatefulWidget {
  final String product;
  final String cost;

  const Buttomcomponent({super.key, required this.product, required this.cost});

  @override
  State<Buttomcomponent> createState() => _ButtomcomponentState();
}

class _ButtomcomponentState extends State<Buttomcomponent> {
  // Future<MethodPost?>? _info;
  // ResponseApi _response = ResponseApi();

  @override
  Widget build(BuildContext context) {
    return buttomComponent();
  }

  FloatingActionButton buttomComponent() => FloatingActionButton(
    heroTag: false,
    backgroundColor: Appcolor().backgroudItem,
    elevation: 10,

    child: Icon(Icons.add, color: Appcolor().borderColor),
    onPressed: () {
      http.post(
        Uri.parse('http://127.0.0.1:8080/api/app_cost'),
        body: jsonEncode({"product": widget.product, "cost": widget.cost}),
        headers: {'Content-Type': 'application/json'},
      );

      // info = _response.fetcheResponse(widget.product, widget.cost);
    },
  );
}
