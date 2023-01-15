import 'dart:collection';

import 'package:flutter/material.dart';

late ScrollController scrollController;

class Example4 extends StatelessWidget {
  const Example4({Key? key}) : super(key: key);

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

  // 위아래 방향 true: 아래/ false: 위
  bool upDown = false;

  // 이전 좌표 및 인덱스
  double prevPosY=0;
  double prevPosX=0;

  // 시간표 선택 여부(드래그)
  List<bool> isSelected = List.generate(20, (index) => false);

  // reverse 체크
  Queue<bool> reverseCheck = ListQueue<bool>();
  bool reverseYn=false;

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
  Queue<double> cursorTrace = ListQueue<double>();

  void initLocation(PointerEvent details){
    tempIdx =0;
    cursorIndex = -1;
    cursorTrace.clear();
  }
  List<int> idxStack = [];
  List<int> idxTempStack = [];
  // void changeCursorIdx(){
  //   if()
  //
  // }
  void updateLocation(PointerEvent details) {
    cursorX=details.position.dx;
    cursorY=details.position.dy;

    tempIdx = cursorIndex;
    cursorIndex = ((cursorY - startYPos)/50).floor();


    setState(() {
      // 1. 하방 상방 판별
      checkUpDown();
      // if(cursorY > )
      // if(q.first>q.last)

      // 2. 인덱스 바꼈을 경우 색상 변경
      // 2-1. 하방드래그일 경우
      // cursorIndex>tempIndex 색상 반전
      // 2-2. 상방드래그일 경우
      // cursorIndex<tempIndex
      // tempIdx의 색상 반전

      // bool reverse = false;
      // 인덱스 바뀌고 reverse가 true면 tempIdx의 색상을 변경하고 reverse를 false로
      // 인덱스 바뀌고 reverse가 false면 cursorIdx만 색상 변경

      reverseYn= checkReverse();
      reverseYn?print("역방향"):print("정방향");
      if(tempIdx !=cursorIndex){
        isSelected[cursorIndex] = !isSelected[cursorIndex];
      }else if(tempIdx !=cursorIndex){
        isSelected[tempIdx] = !isSelected[tempIdx];
        // reverse = !reverse;
      }
      //하방 드래그
      // if(upDown == true && cursorIndex>tempIdx){
      //   print("check1");
      //   isSelected[tempIdx] = isSelected[cursorIndex];
      //
      // } else if(upDown == false && cursorIndex<tempIdx){
      //   print("check2");
      //   isSelected[tempIdx] = isSelected[cursorIndex];
      // }

    });
  }
  bool checkReverse(){
    // false : 방향 유지 - true : 방향 전환
    // upDown : true(아래) - false(위)
    bool result = false;
    if(tempIdx != cursorIndex) {
      reverseCheck.add(upDown);
      if(reverseCheck.length>2) reverseCheck.removeFirst();
    }
    //같은방향
    if(reverseCheck.length>=2 && reverseCheck.first == reverseCheck.last){
      // reverseCheck.removeFirst();
    print('$cursorIndex, $tempIdx , reverse: $reverseCheck');
      return false;
    }
    print('$cursorIndex, $tempIdx , reverse: $reverseCheck');

    return result;
  }

  void checkUpDown(){
    cursorTrace.add(cursorY);
    cursorTrace.length>2?cursorTrace.removeFirst():null;

    if(cursorTrace.first<cursorTrace.last ){
      upDown = true; // 아래로
    }else {
      upDown = false; // 위로
    }
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
      child: GestureDetector(
        onTap: () {
          print("tapped");
        },
        child: Listener(
          behavior: HitTestBehavior.deferToChild,
          onPointerMove: updateLocation,
          // onPointerDown: updateLocation,
          onPointerUp: initLocation,// clear position
          child: Container(
            decoration: const BoxDecoration(color: Colors.blue),
            height:300,
            width: 300,
            child: classes(),
          ),
        ),
      ),
    );
  }

  Widget classes(){
    return ListView.builder(
      // controller: scrollController,
      itemCount : 6,
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