import 'package:flutter/material.dart';

import '../login_app/login3.dart';

class MyButton extends StatelessWidget {
  // const MyButton({Key? key}) : super(key: key);

  MyButton(
      {
        required this.image,
        required this.text,
        required this.color,
        required this.radius,
        required this.onPressed,
        required this.backgroundColor
      }
  );

  final Widget image;
  final Widget text;
  final Color color;
  final Color? backgroundColor;
  final double radius;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {

    final LogIn logIn = new LogIn();

    return ButtonTheme(
      height: 50,
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            image,
            text,
            Opacity(
              opacity: 0,
              child: image,
            )
          ],
        ),
        onPressed: onPressed,
        onLongPress: (){
          print('Text Button');
        },
        style: TextButton.styleFrom(
          primary: color,
          backgroundColor: backgroundColor,
          side: BorderSide(width: 0.5),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(radius),
              )
          ),
        ),
      ),
    );
  }
}
