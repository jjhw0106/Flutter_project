import 'package:flutter/material.dart';

class Timetable extends StatefulWidget {

  @override
  State<Timetable> createState() => _TimetableState();
}

const double CLASS_HEIGHT = 20;
const double CLASS_WIDTH = 40;

class _TimetableState extends State<Timetable> {
  List week = ['월', '화', '수', '목', '금', '토', '일'];

  var columnLength = 32;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider')),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment : CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.amberAccent,
              child: Center(child: Text('시간표',style: TextStyle(fontSize: 30),))),
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
          // border: Border.
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: dayList(),
              ),
              makeColumns()
            ],
          ),
        ),
      ),
    );
  }

  // 상단 요일 리스트
  List<Widget> dayList(){
    return List.generate(week.length, (index) => Container(
      height: CLASS_HEIGHT,
      width: CLASS_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('${week[index]}')],)
    )
    );
  }


  // 과목 한 칸
  Widget oneSubject(){
    bool _isClicked = false;
    return Container(
      height: CLASS_HEIGHT,
      width: CLASS_WIDTH,
      decoration: BoxDecoration(
        border: Border.all(),
        color: _isClicked == false ? Colors.blue: Colors.green,
      ),
    );
  }

  // 하루(요일) 시간표 생성
  Widget classesByDay(int index){
    return GestureDetector(

      onTap: (){
        print('ff');
        },
      child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(columnLength, (index) => oneSubject())
      ),
    );
  }
  // 일주일 컬럼 생성
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
  // Widget changeColor(Colors color){
  //   return color;
  // }
}

