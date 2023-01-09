import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  // var timeTable = List.generate(18, (index) => Container(child: Text("ff"),));
  // var timeTable2 = List.generate(8, (index) => timeTable);
  List days = ['','월','화','수','목','금','토','일'];
  List times = ['','09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00','18:00','19:00','20:00','21:00','22:00','23:00','24:00'];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: classesOfWeek(5, 5, 0)
    );
  }

  Widget classContainer(Widget child){
    return Container(height: 50, width: 40, child: child);
  }

  Widget oneClassTime(int yIndex, int xIndex){
    Text value;
    if(xIndex ==0 ) value = Text(times[yIndex]);
    else if(yIndex ==0 ) value = Text(days[xIndex]);
    else value = Text(" ");

    return classContainer(value);
  }

  Widget dayClasses(int yIndex, int xIndex, dynamic child){
    return Column(
      children: List.generate(times.length, (index) => oneClassTime(index, xIndex)),
    );
  }

  Widget classesOfWeek(int yIndex, int xIndex, dynamic child){
    return Row(
      children: List.generate(days.length, (index) => dayClasses( yIndex,  index,  child)),
    );
  }
}
