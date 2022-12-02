import 'package:chef_hard/increment_decrement.dart';
import 'package:chef_hard/login2.dart';
import 'package:flutter/material.dart';
import 'package:chef_hard/login_app/login3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

/*
* 1. IncrementDecrement
* 2. login_dice
* */
class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogIn(),
    );
  }
}