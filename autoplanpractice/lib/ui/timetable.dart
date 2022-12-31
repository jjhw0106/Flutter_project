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
    return Container(
      height: 500,
      // width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all()
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          // children: [
          // Column안에 ListView넣을 때 화면 안나오는 오류
          // https://mike123789-dev.tistory.com/entry/%ED%94%8C%EB%9F%AC%ED%84%B0Column-%EC%95%88%EC%9D%98-ListView
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Row(children: List.generate(week.length, (index) => Column(children: [Text('${week[index]}')],))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(week.length, (index) => classesByDay(index))
                ),
              ],
            ),
          // ],
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
      height: 20,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.blue,
      ),
    );
  }
}

