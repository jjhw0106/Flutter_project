import 'package:dev_test/ui/main/model/dialog_message.dart';
import 'package:dev_test/ui/main/model/message.dart';
import 'package:dev_test/ui/main/popup/getpoint_popup.dart';
import "package:flutter/material.dart";

class PointDialogController {
  // repository에서 연결 해준다고 가정
  // TestRepository repository = TestRepository();
  // int pointType= repository.getInstance().pointType;
  // ...
  int pointType=1;
  String title = "";
  String contents1 ="";
  String contents2 ="";
  String contents3 ="";

  late Message message;

  List messageList =[];

  // void insertPoint(){}
  Future<Message> getMessage() async {
    print("getMessage!!!");
    pointType = 1;
    if(pointType==1){
      title = "꽝!";
      contents1 ="아쉽게도 꽝이네요";
      contents2 ="다음 기회에 도전해보세요!";
      contents3 ="";
    }else if(pointType== 2){
      title = "500포인트 당첨";
      contents1 ="당첨을 축하합니다";
      contents2 ="획득한 포인트를 확인해 보세요";
      contents3 ="";
    }
    message = Message(pointType, title, contents1, contents2: contents2,contents3: contents3);
    return message;
  }

  void callDialog(context) async {
    Message msg = await getMessage();
    print("callDialog!!!");
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return GetPointDialog(msg);
      },
    );
  }
}

