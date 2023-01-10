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
  double x=0;
  double y=0;

  final someWidgetKey = GlobalKey();
  late Offset position;

  void calculatePosition(PointerDownEvent details) => WidgetsBinding.instance.addPostFrameCallback((_) {
    RenderBox box = (someWidgetKey.currentContext!.findRenderObject())! as RenderBox;
    position = box.localToGlobal(Offset.zero);
    print('시작위치: $position');
  });

  void updateLocation(PointerEvent details){
    setState(() {
      x=details.position.dx;
      y=details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tight(const Size(300, 300)),
      child: Listener(
        // onPointerMove: updateLocation,
        onPointerDown: calculatePosition,
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
    print('x: $x y: $y');
    return ListView.builder(itemCount:5 , itemBuilder: (context, index) => Container(
        height:50, decoration: BoxDecoration(color: Colors.red,border: Border.all())),);
  }
  void changeColor(double x, double y){

  }
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
