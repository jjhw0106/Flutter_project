import 'package:flutter/material.dart';

class Timetable extends StatelessWidget {
  const Timetable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timetable")),
      body: const Center(
        child: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double startYPos = 0;
  double startXPos = 0;
  double cursorX=0;
  double cursorY=0;
  int cursorIndex=0;

  final _someWidgetKey = GlobalKey();
  late Offset position;

  void calculatePosition(PointerDownEvent details) => WidgetsBinding.instance.addPostFrameCallback((_) {
    RenderBox box = (_someWidgetKey.currentContext!.findRenderObject())! as RenderBox;
    position = box.localToGlobal(Offset.zero);
    startYPos = position.dy;
    startXPos = position.dx;
    //243.7
    print('시작위치: y:$startYPos x: $startXPos');
  });

  void updateLocation(PointerEvent details){
    // print('$x $y');
    setState(() {
      cursorX=details.position.dx;
      cursorY=details.position.dy;
      cursorIndex = ((cursorY - startYPos)/50).floor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      key: _someWidgetKey,
      constraints: BoxConstraints.tight(const Size(300, 300)),
      child: Listener(
        onPointerMove: updateLocation,
        onPointerDown: calculatePosition,
        onPointerUp: (event) {print("$cursorIndex");},
        child: Container(
          decoration: const BoxDecoration(color: Colors.blue),
          height:300,
          width: 300,
          child: classes(),
        ),
      ),
    );
  }

  Widget classes(){
    print('x: $cursorX y: $cursorY');
    return ListView.builder(
      itemCount : 5 ,
      itemBuilder : (context, index) {
        return oneClass(index, false);
      },
    );
  }

  Widget oneClass(int index, bool selected){
    bool isSelected = selected;
    return Container(
      height:50,
      decoration: BoxDecoration(color: isSelected?Colors.red:Colors.blue, border: Border.all()),
      child: Text('$index'),
    );
  }
  void changeColor(double x, double y){

  }
  // int selectArea(double y){
  //   int index;
  //   return index;
  // }
}

class classes extends StatefulWidget {
  const classes({Key? key}) : super(key: key);

  @override
  State<classes> createState() => _classesState();
}

class _classesState extends State<classes> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
