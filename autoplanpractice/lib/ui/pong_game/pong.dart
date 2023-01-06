import 'package:flutter/material.dart';

import 'ball.dart';
import 'bat.dart';

class Pong extends StatefulWidget {
  const Pong({Key? key}) : super(key: key);

  @override
  State<Pong> createState() => _PongState();
}

class _PongState extends State<Pong> with SingleTickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController animationController;

  double width = 0;
  double height =0;
  double posX = 0;
  double posY = 0;
  double batWidth = 0;
  double batHeight = 0;
  double batPosition = 0;

  @override
  void initState() {
    posX = 0;
    posY = 0;
    animationController = AnimationController(duration: const Duration(seconds: 3),vsync: this,);
    animation = Tween<double>(begin: 0, end: 100).animate(animationController);
    animation.addListener(() {
      setState(() {
        posX++;
        posY++;
      });
    });
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          width = constraints.maxWidth;
          height = constraints.maxHeight;
          batWidth = width/20;
          batHeight = height/5;
          return Stack(
             children: [
              Positioned(
                child: Ball(),
                top: posY,
                left: posX,
              ),
              Positioned(
                child: Bat(batHeight, batWidth),
                bottom: 0,
              ),
            ],
          );
        },
    );
  }
}
