import 'package:flutter/material.dart';

class Timetable extends StatelessWidget {

  List week = ['월', '화', '수', '목', '금', '토','일'];
  var kColumnLength = 22;
  double kFirstColumnHeight = 20;
  double kBoxSize = 52;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider')),
      body: SingleChildScrollView(
          child:Column(
            children: [
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
            ],
          )
      ),
    );
  }
}
