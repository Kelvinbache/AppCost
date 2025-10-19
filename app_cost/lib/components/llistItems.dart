import 'package:app_cost/components/buttomListComponent.dart';
import 'package:app_cost/core/AppColor.dart';
import 'package:app_cost/core/AppFontStyle.dart';
import 'package:app_cost/repository/method_get.dart';
import 'package:app_cost/repository/response.dart';
import 'package:app_cost/screens/listItems.dart';
import 'package:flutter/material.dart';

class Llistitems extends StatefulWidget {
  final String title;
  const Llistitems({super.key, required this.title});

  @override
  State<Llistitems> createState() => _LlistitemsState();
}

class _LlistitemsState extends State<Llistitems> {
  Future<MethodGet?>? _info = ResponseApi().fetcheResponseGet();

  @override
  Widget build(BuildContext context) {
    return containerItems(_info);
  }

  Column containerItems(Future? _info) =>
      Column(children: [SizedBox(height: 100), containerItemsBorder(_info)]);

  Container containerItemsBorder(Future<dynamic>? _info) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Appcolor().borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      
      child: Padding(
      
        padding: const EdgeInsets.all(50),
      
        child: Column(
      
          children: [
            Text(widget.title, style: Appfontstyle().textStyleButtom,),
            
            SizedBox(height: 10),

            FutureBuilder(
              future: _info,

              builder: (context, snapshot) {
                if (snapshot.hasError) {

                  return Text("error: ${snapshot.error}");

                } else if (snapshot.connectionState == ConnectionState.waiting) {

                  return CircularProgressIndicator();

                } else if (snapshot.hasData) {

                  //Aqui va un bucle que recorre todos los meses 
                  return Buttomlistcomponent(title:"hello word", address: "listItems");
                }

                  return Buttomlistcomponent(title:"hello word", address: "listItems");

                // return Text("null");
              },
            ),
          ],
        ),
      ),
    );
  }
}
