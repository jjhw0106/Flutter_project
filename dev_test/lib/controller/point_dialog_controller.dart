import 'package:flutter/material.dart';

import '../data/model/message.dart';
import '../ui/common/point_dialog.dart';

class PointDialogController {
  // repository에서 연결 해준다고 가정
  // TestRepository repository = TestRepository();
  // int pointType= repository.getInstance().pointType;
  // ...
  int pointType = 0;
  String title = "꽝!";
  String contents1 = "아쉽게도 꽝이네요";
  String contents2 = "다음 기회에 도전해보세요!";
  String contents3 = "";

  late Message message;

  List messageList = [];

  // void insertPoint(){}
  Future<Message> getMessage() async {
    if (pointType == 0) {
      message = Message(pointType, title, contents1,
          contents2: contents2, contents3: contents3);
      return message;
    }
    return message;
  }

  void callDialog(BuildContext context) async {
    Message msg = await getMessage();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return PointDialog(msg);
      },
    );
  }
}
