import 'package:app_cost/repository/method_get.dart';
import 'package:app_cost/repository/response.dart';
import 'package:flutter/material.dart';

class Llistitems extends StatefulWidget {
  const Llistitems({super.key});

  @override
  State<Llistitems> createState() => _LlistitemsState();
}

class _LlistitemsState extends State<Llistitems> {
  Future<MethodGet?>? _info = ResponseApi().fetcheResponseGet();

  @override
  Widget build(BuildContext context) {
    return containerItems(_info);
  }

  Column containerItems(Future? _info) => Column(
    children: [
      FutureBuilder(
        future: _info,
        builder: (context, snapshot) {
          
          if (snapshot.hasError) {
            return Text("error: ${snapshot.error}");
          
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          
          } else if (snapshot.hasData) {
            return Text("${snapshot.data}");
          }

          return Text("null");
        },
      ),
    ],
  );
}
