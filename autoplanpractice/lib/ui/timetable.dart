import 'package:flutter/material.dart';

class Timetable extends StatelessWidget {

  List week = ['월', '화', '수', '목', '금', '토', '일'];
  var kColumnLength = 14;
  double kFirstColumnHeight = 20;
  double kBoxSize = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Row(
          children: [
            dayCol(0),
            dayCol(1),
            dayCol(2),
          ],),
        ),
      );
  }
  Widget dayCol(int index){
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Text('${week[index]}'),
          Row(
            children: [
              VerticalDivider(
              width: 1,
              thickness: 1,
              color: Colors.black,
            )],
          )
        ],
      )
    );
  }
}

