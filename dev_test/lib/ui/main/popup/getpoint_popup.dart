import 'package:dev_test/ui/main/model/dialog_message.dart';
import 'package:dev_test/ui/main/model/message.dart';
import 'package:flutter/material.dart';

final int messageType =1;
final String alarmTitle = "꽝!";
final String alarmContents1 = "아쉽게도 꽝이네요";
final String alarmContents2 = "다음 기회에 도전해보세요!";
final String alarmContents3 = '';

class GetPointDialog extends StatelessWidget {
  GetPointDialog({super.key});

  // 내장에서 get?
  Message dialogMessage = Message(messageType, alarmTitle, alarmContents1, contents2: alarmContents2, contents3: alarmContents3 );

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
          Center(child: Text(dialogMessage.title)),
          Center(child: Column(
              children:<Widget> [
                Text(dialogMessage.contents1!),
                Text(dialogMessage.contents2!),
                alarmContents3.isEmpty ? SizedBox(): Text(alarmContents3),
              ]
          )),
        ],
      ),
      actions: [
        ElevatedButton(
          child: Center(
              child: Text("포인트 확인")
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],

    );
  }
  _getCloseButton(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: GestureDetector(
        onTap: () {

        },
        child: Container(
          alignment: FractionalOffset.topRight,
          child: GestureDetector(child: Icon(Icons.clear,color: Colors.black,size: 20,),
            onTap: (){
              Navigator.pop(context);
            },),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class AlertDialogDemo extends StatelessWidget{
//   var buttonsRowDirection=1 ;//ROW DIRECTION
//   var buttonsColDirection=2 ;//COLOUMN DIRECTION
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Container(
//         child: RaisedButton(
//           child: Text("Show Button"),
//           onPressed: (){
//             showGeneralDialog(
//                 context: context,
//                 pageBuilder: (BuildContext buildContext, Animation animation,
//                     Animation secondaryAnimation) {
//                   return _buildDialog(context);
//                 }
//             );
//
//           },
//         ),
//       ),
//     );
//   }
// // Returns alert default border style
//   ShapeBorder _defaultShape() {
//     return RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10.0),
//       side: BorderSide(
//         color: Colors.deepOrange,
//       ),
//     );
//   }
//
//   _getCloseButton(context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
//       child: GestureDetector(
//         onTap: () {
//
//         },
//         child: Container(
//           alignment: FractionalOffset.topRight,
//           child: GestureDetector(child: Icon(Icons.clear,color: Colors.red,),
//
//             onTap: (){
//               Navigator.pop(context);
//             },),
//         ),
//       ),
//     );
//   }
//
//   _getRowButtons(context) {
//     return  [
//       DialogButton(
//         child: Text(
//           "Continue",
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//         onPressed: () => Navigator.pop(context),
//         color: Color.fromRGBO(0, 179, 134, 1.0),
//       ),
//       DialogButton(
//         child: Text(
//           "Cancel",
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//         onPressed: () => Navigator.pop(context),
//         gradient: LinearGradient(colors: [
//           Color.fromRGBO(116, 116, 191, 1.0),
//           Color.fromRGBO(52, 138, 199, 1.0)
//         ]),
//       )
//     ];
//
//   }
//
//   _getColButtons(context) {
//     return   [
//       DialogButton(
//         child: Text(
//           "Continue",
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//         onPressed: () => Navigator.pop(context),
//         color: Color.fromRGBO(0, 179, 134, 1.0),
//       ),
//       DialogButton(
//         child: Text(
//           "Cancel",
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//         onPressed: () => Navigator.pop(context),
//         gradient: LinearGradient(colors: [
//           Color.fromRGBO(116, 116, 191, 1.0),
//           Color.fromRGBO(52, 138, 199, 1.0)
//         ]),
//       )
//     ];
//   }
//
//   Widget _buildDialog(context) {
//     return  AlertDialog(
//
//         backgroundColor:Colors.white,
//         shape: _defaultShape(),
//         insetPadding: EdgeInsets.all(8),
//         elevation: 10,
//         titlePadding: const EdgeInsets.all(0.0),
//         title: Container(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _getCloseButton(context),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(
//                       20,10, 20, 0),
//                   child: Column(
//                     children: [
//                       Icon(Icons.warning_amber_sharp,size: 48,),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Text(
//                         "Alert with Close Button",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w500,
//                             fontStyle: FontStyle.normal),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height:  10,
//                       ),
//                       Text(
//                         "Your Subscription Plan Expiered",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400,
//                             fontStyle: FontStyle.normal),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(
//                         height:  20,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         contentPadding: EdgeInsets.all(8),
//         content: buttonsRowDirection==1
//             ? Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: _getRowButtons(context),
//         )
//             : Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: _getColButtons(context),
//         ));
//   }
// }