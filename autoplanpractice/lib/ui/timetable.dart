import 'package:flutter/material.dart';

class Timetable extends StatelessWidget {

  List week = ['월', '화', '수', '목', '금', '토', '일'];
  var kColumnLength = 32;
  double kFirstColumnHeight = 20;
  double kBoxSize = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider')),
      body: Container(
        // width: double.infinity,
        // height: double.infinity,
        color: Colors.green,
        child: Column(
          crossAxisAlignment : CrossAxisAlignment.center,
          children: [
            Text('fff'),
            timeBoard(),
          ],),
        ),
      );
  }

  Widget timeBoard(){
    return Container(
      height: 400,
      // width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all()
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Row(
              children: List.generate(week.length, (index) => classesByDay())
            ),
          ],
        ),
      ),
    );
  }

  // 하루(요일) 시간표 생성
  Widget classesByDay(){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(kColumnLength, (index) => oneSubject())
    );
  }

  // 과목 한 칸
  Widget oneSubject(){
    return Container(
      height: 20,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.blue,
      ),
    );
  }
}

