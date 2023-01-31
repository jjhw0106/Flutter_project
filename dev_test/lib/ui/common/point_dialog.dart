import 'package:dev_test/data/model/message.dart';
import 'package:flutter/material.dart';

int messageType = 0/*=1*/;
String alarmTitle = "" /*= "꽝!"*/;
String? alarmContents1/*= "아쉽게도 꽝이네요"*/;
String? alarmContents2/*= "다음 기회에 도전해보세요!"*/;
String? alarmContents3/*= ''*/;

class PointDialog extends StatelessWidget {
  PointDialog(Message msg, {super.key}) {
    messageType = msg.pointType;
    alarmTitle = msg.title;
    alarmContents1 = msg.contents1;
    alarmContents2 = msg.contents2;
    alarmContents3 = msg.contents3;
  }

  // 내장에서 get?
  // Message dialogMessage = Message(messageType, alarmTitle, alarmContents1, contents2: alarmContents2, contents3: alarmContents3 );

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getCloseButton(context),
          Image.asset('assets/images/bomb.png', width: 100, height: 100),
          Center(child: Text(alarmTitle)),
          Center(
              child: Column(children: <Widget>[
            Text(alarmContents1!),
            Text(alarmContents2!),
            alarmContents3 == null ? const SizedBox() : Text(alarmContents3!),
          ])),
        ],
      ),
      actions: [
        ElevatedButton(
          child: const Center(child: Text("포인트 확인")),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  _getCloseButton(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        alignment: FractionalOffset.topRight,
        child: GestureDetector(
          child: const Icon(
            Icons.clear,
            color: Colors.black,
            size: 20,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
