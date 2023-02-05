import 'package:dev_test/data/model/point_dialog_message.dart';
import 'package:flutter/material.dart';

class RandomBoxController with ChangeNotifier {
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
  // int pointType = 0;
  // String title = "꽝!";
  // String contents1 = "아쉽게도 꽝이네요";
  // String contents2 = "다음 기회에 도전해보세요!";
  // String contents3 = "";

  late final PointDialogMessage _message;
  RandomBoxController({required PointDialogMessage message})
      : _message = message;

  bool isLoading = false;

  void onInit(context) {
    isLoading = true;
    notifyListeners();
  }

  // void insertPoint(){}
  PointDialogMessage getMessage() {
    if (_message.pointType == 0) {
      // message = PointDialogMessage(pointType, headline6, contents1,
      //     contents2: contents2, contents3: contents3);
      isLoading = false;
      return _message;
    }
    return _message;
  }
}
