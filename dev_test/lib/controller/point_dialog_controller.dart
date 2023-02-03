import 'package:flutter/material.dart';
import 'package:our_school_client/data/model/point_dialog_message.dart';
import 'package:our_school_client/ui/point/point_dialog.dart';

class RandomBoxController with ChangeNotifier{
  // 규식피디님이 포인트 로직 담당
  // Message? -> 
  // enum PointType {  
  //    attendance('출석체크'),  
  //    studyTime('목표시간달성'),  
  //    studyDialog('공부일기'),  
  //    randomBox('랜덤박스');  
  //    final String categoryName;  
  //    const PointType(this.categoryName);
  // }
  // TestRepository repository;
  // PointDialogController(this.repository);
  int pointType = 0;
  String title = "꽝!";
  String contents1 = "아쉽게도 꽝이네요";
  String contents2 = "다음 기회에 도전해보세요!";
  String contents3 = "";
  bool isLoading = false;

  late PointDialogMessage message;

  List messageList = [];

  void onInit(context) {
    isLoading = true;
    getMessage();
    notifyListeners();
  }

  // void insertPoint(){}
  PointDialogMessage getMessage() {
    if (pointType == 0) {
      message = PointDialogMessage(pointType, title, contents1,
          contents2: contents2, contents3: contents3);
      isLoading = false;
      return message;
    }
    return message;
  }
}
