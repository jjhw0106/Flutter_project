import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  final String id;
  const Dice({Key? key, required this.id}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
        centerTitle: true,
      ),
      body: Text("로그인하신 ID : " + widget.id),
    );
  }
}
