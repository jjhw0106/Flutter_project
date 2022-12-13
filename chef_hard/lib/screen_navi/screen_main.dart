import 'package:chef_hard/screen_navi/ScreenA.dart';
import 'package:chef_hard/screen_navi/ScreenB.dart';
import 'package:chef_hard/screen_navi/ScreenC.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/'  : (context) => ScreenA(),
        '/b' : (context) => ScreenB(),
        '/c' : (context) => ScreenC(),
      },
    );
  }
}