import 'dart:convert';
import 'dart:io';
import 'package:app_cost/repository/method_get.dart';
import 'package:app_cost/repository/method_post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResponseApi {
  Future<MethodPost?> fetcheResponse(String product, String cost) async {
    try {
      final response = await http.post(
        Uri.parse("http://127.0.0.1:8080/api/app_cost"),
        body: jsonEncode({"product": product, "cost": cost}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var decoden = jsonDecode(response.body);
        MethodPost responseApi = MethodPost.FromJson(decoden);
        return responseApi;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      print('Error de conexión (SocketException): El servidor no está disponible o no hay red. $e');
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<MethodGet?> fetcheResponseGet() async {
    try {
      final response = await http.get(
        Uri.parse("http://127.0.0.1:8080/api/app_cost"),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var decoden = jsonDecode(response.body);
        MethodGet responseApi = MethodGet.FromJson(decoden);
        return responseApi;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      print(
        'Error de conexión (SocketException): El servidor no está disponible o no hay red. $e',
      );
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
