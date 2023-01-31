import 'package:dev_test/controller/test_controller.dart';
import 'package:dev_test/ui/main/model/dialog_message.dart';
import 'package:dev_test/ui/main/model/message.dart';
import 'package:flutter/material.dart';


int messageType = -1 ;
String alarmTitle = "";
String? alarmContents1 = "";
String? alarmContents2 = "";
String? alarmContents3 = "";

PointDialogController controller = PointDialogController();
// 호출하면 메시지 타입 및 내용 대입
class GetPointDialog extends StatelessWidget{
  GetPointDialog(Message msg, {super.key}) {
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
          Center(child: Text(alarmTitle,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30),),),
          Center(child: Column(
              children:<Widget> [
                Text(alarmContents1!),
                Text(alarmContents2!),
                alarmContents3==null ? const SizedBox(): Text(alarmContents3!),
              ]
          )),
        ],
      ),
      actions: [
        ElevatedButton(
          child: const Center(
              child: Text("포인트 확인")
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
  // void callDialog(context) async {
  //   Message msg = await controller.getMessage();
  //   showDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     builder: (context) {
  //       return GetPointDialog(msg);
  //     },
  //   );
  // }
  _getCloseButton(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        alignment: FractionalOffset.topRight,
        child: GestureDetector(child: const Icon(Icons.clear,color: Colors.black,size: 20,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}