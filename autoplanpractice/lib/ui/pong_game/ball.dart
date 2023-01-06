import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double diam = 50;
    return Container(
      width: diam,
      height: diam,
      decoration: new BoxDecoration(
        color: Colors.amber[400],
        shape: BoxShape.circle,
      )
    );
  }
}
