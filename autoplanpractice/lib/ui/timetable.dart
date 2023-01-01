import 'package:flutter/material.dart';

class Timetable extends StatefulWidget {

  @override
  State<Timetable> createState() => _TimetableState();
}

const double CLASS_HEIGHT = 20;
const double CLASS_WIDTH = 40;

class _TimetableState extends State<Timetable> {
  List week = ['월', '화', '수', '목', '금', '토', '일'];

  var kColumnLength = 32;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment : CrossAxisAlignment.center,
          children: [
            Text('fff'),
            timeBoard(),
          ],),
        ),
      );
  }

  Widget timeBoard(){
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all()
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(children: List.generate(week.length, (index) => Column(children: [Text('${week[index]}')],))),
              makeColumns()],
          ),
        ),
      ),
    );
  }

  // 하루(요일) 시간표 생성
  Widget classesByDay(int index){
    if(index == 0){

    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(kColumnLength, (index) => oneSubject())
    );
  }

  // 과목 한 칸
  Widget oneSubject(){
    return Container(
      height: CLASS_HEIGHT,
      width: CLASS_WIDTH,
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.blue,
      ),
    );
  }

  Widget makeColumns(){
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(week.length, (index) => classesByDay(index))
          ),
        ],
      ),
    );
  }
}

