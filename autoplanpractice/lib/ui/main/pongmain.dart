import 'package:autoplanpractice/ui/pong_game/pong.dart';
import 'package:flutter/material.dart';

class MyPong extends StatelessWidget {
  const MyPong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Pong'),
      ),
      body: Pong(),
    );
  }
}
