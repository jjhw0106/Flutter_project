import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  State<Example1> createState() => _Example1State();
}


class _Example1State extends State<Example1> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.red,
      child: Column(
        children: [
          Text("Fffdata"),
          weekClasses(),
          // Text("Fffdata"),
        ],
      ),
    );
  }


  // 일주일 시간표
  Widget weekClasses(){
    return Container(
      height: 500,
      width: 300,
      child: ListView.builder(
        itemBuilder: (context, index) => dayClasses(),
        itemCount: 8,
      ),
    );
  }

  // 하루 수업
  Widget dayClasses(){
    return Container(
      height: 500,
      width: 300,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => oneClass(index),
      ),
    );
  }

  // 수업 1교시
  Widget oneClass(int index){
    double indexY = 0;
    double indexX = 0;
    bool isClicked = false;

    String msg = index == 0 ? "요일" : "$index";

    return Container(
      decoration: BoxDecoration(border: Border.all()),
      height: 40,
      child: Text("$msg"),
      // width: 10,
    );
  }
}
