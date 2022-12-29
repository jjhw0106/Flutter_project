import 'package:autoplanpractice/ui/main/home.dart';
import 'package:autoplanpractice/ui/timetable.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        '/timetable': (context) => Timetable(),
      },
    );
  }
}
