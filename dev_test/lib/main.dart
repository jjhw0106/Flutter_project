import 'package:dev_test/ui/main/popup/popup_main.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
d
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PopupMain(),
    );
  }
}
