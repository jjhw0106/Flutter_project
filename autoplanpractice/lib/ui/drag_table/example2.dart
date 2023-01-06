import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  // var timeTable = List.generate(18, (index) => Container(child: Text("ff"),));
  // var timeTable2 = List.generate(8, (index) => timeTable);
  List days = ['월','화','수','목','금','토','일'];
  List times = ['09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00','24:00'];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: dayClasses(5, 5, 0)
    );
  }

  Widget oneClassTime(int index){
    print(index);
    return Text(days[0]);
  }

  Widget dayClasses(double width, double height, dynamic child){
    return Column(
      children: List.generate(times.length, (index) => oneClassTime(index)),
    );
  }
}
