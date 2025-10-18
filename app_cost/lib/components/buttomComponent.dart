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
    backgroundColor: Appcolor().backgroudItem,
    elevation: 10,

    child: Icon(Icons.add, color: Appcolor().borderColor),
    onPressed: () {
      info = _response.fetcheResponse(widget.product, widget.cost);
    },
  );
}
