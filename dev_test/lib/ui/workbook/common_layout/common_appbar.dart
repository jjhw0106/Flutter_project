import 'package:flutter/material.dart';

AppBar appBar({String? selected, required String message}) {
    return AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(message,
            style: const TextStyle(
              color: Colors.black, 
              fontSize: 21.7,
              fontWeight: FontWeight.bold
              ),
            ),
      );
  }