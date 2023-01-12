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

  // 시간표 시작구간 좌표
  double startYPos = 0;
  double startXPos = 0;
  // 마우스 커서의 위치
  double cursorX=0;
  double cursorY=0;
  // 현재 커서가 위치한 박스의 인덱스
  int cursorIndex=-1;
  // 시간표 선택 여부(드래그)
  List<bool> isSelected = [false, false, false, false, false, false];


  // 글로벌 키를 이용하여 위젯의 시작 시점 구하는 함수
  final _someWidgetKey = GlobalKey();
  late Offset position;
  PointerDownEvent pointerDownEvent = const PointerDownEvent();
  void getTablePos(pointerDownEvent) {
    // 비동기로 인해 시작점 불러오는 시점 꼬임
    WidgetsBinding.instance.addPostFrameCallback ( (_) {
      RenderBox box = (_someWidgetKey.currentContext!.findRenderObject())! as RenderBox;
      position = box.localToGlobal(Offset.zero);
      startYPos = position.dy;
      startXPos = position.dx;
      //243.7
    });
  }

  int tempIdx =0;
  bool tempBoolean = false;
  void updateLocation(PointerEvent details) {
    print("업데이트");
    cursorX=details.position.dx;
    cursorY=details.position.dy;
    tempIdx = cursorIndex;

    cursorIndex = ((cursorY - startYPos)/50).floor();
    print('temp: $tempIdx');
    setState(() {
      if(tempIdx !=cursorIndex){
        isSelected[cursorIndex] = !isSelected[cursorIndex];
      };
    });
  }
  @override
  void initState() {
    getTablePos(pointerDownEvent);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      key: _someWidgetKey,
      constraints: BoxConstraints.tight(const Size(300, 300)),
      child: Listener(

        onPointerMove: updateLocation,
        onPointerDown: updateLocation,
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
    print('인덱스: $cursorIndex x: $cursorX y: $cursorY');
    return ListView.builder(
      itemCount : 6 ,
      itemBuilder : (context, index) {
        return oneClass(index);
      },
    );
  }

  Widget oneClass(int index){
    return Container(
      height:50,
      decoration: BoxDecoration(
          color: isSelected[index]?Colors.red:Colors.blue,
          border: Border.all()
      ),
      child: Text('$index'),
    );
  }
}