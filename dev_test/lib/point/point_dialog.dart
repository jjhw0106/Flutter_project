import 'package:flutter/material.dart';
import 'package:our_school_client/data/model/point_dialog_message.dart';

// 메시지 가져오는 방법에 대한 고민 필요
int messageType = 0;
String alarmTitle = "";
String? alarmContents1;
String? alarmContents2;
String? alarmContents3;

class PointDialog extends StatelessWidget {
  PointDialog(PointDialogMessage msg, {super.key}) {
    messageType = msg.pointType;
    alarmTitle = msg.title;
    alarmContents1 = msg.contents1;
    alarmContents2 = msg.contents2;
    alarmContents3 = msg.contents3;
  }

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
