import 'package:dev_test/data/model/point_dialog_message.dart';
import 'package:flutter/material.dart';

Future pointDialog(BuildContext context, PointDialogMessage message) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getCloseButton(context),
          Image.asset('assets/images/bomb.png', width: 100, height: 100),
          Center(child: Text(message.title!)),
          Center(
              child: Column(children: <Widget>[
            Text(message.contents1!),
            Text(message.contents2!),
            message.contents3 == null
                ? const SizedBox()
                : Text(message.contents3!),
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
    ),
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
