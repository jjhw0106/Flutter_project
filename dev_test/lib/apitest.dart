import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ApiTest extends StatelessWidget {
  const ApiTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API test")),
      body: ElevatedButton(
        child:Text("api "),
        onPressed:() async {
          print("Fff");
          Dio dio = Dio();
          var response = await dio.get("http://192.168.137.1:3000/workbook/hello2");
          print(response);
        },
      ),
    );
  }
}