import 'package:autoplanpractice/data/model/subject_model.dart';
import 'package:flutter/material.dart';

class StateTest extends StatefulWidget {

  SubjectModel subjectModel = SubjectModel(0, false);

  @override
  State<StateTest> createState() => _StateTestState();
}


class _StateTestState extends State<StateTest> {
  // late List<bool> isClickedArr = [];

  // @override
  // void initState() {
  //   super.initState();
  //
  //   for (int i = 0; i < 5; i++) {
  //     isClickedArr.add(false);
  //   }
  // }

  late List<bool> isClickedArr = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for(int i=0; i<5; i++){
      isClickedArr.add(false);
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("State")),
      body: Container(
        child: ListView(
            children: boxRow(),
        ),
      )
      // ListView(
      //   children: boxRow(),
      // ),
    );
  }
  Widget box(int idx){
    int index = idx;

    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isClickedArr[index] = !isClickedArr[index];
          });

          // setState(() {
          //   isClickedArr[index] = !isClickedArr[index];
          // });
        },
        child: Container(
          // color: isClickedArr[index] ? Colors.yellow : Colors.blue,
          color: isClickedArr[index] ? Colors.yellow : Colors.blue,
          height: 50,
          width: 50,
          child: Center(child: Text("$index")),
        ),
      ),
    );
  }
  
  List<Widget> boxRow(){
    return List.generate(5, (index) => box(index));
  }

  // void changeColor(){
  //   setState(() {
  //     _isClicked == true ? _isClicked = false : _isClicked = true;
  //     // if(isClicked == true){isClicked = false;}
  //     // else {isClicked = true;}
  //   });
  // }
}
