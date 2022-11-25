import 'dart:async';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  final String id;
  const Dice({Key? key, required this.id}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 2;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.orangeAccent,
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text('DiceGame'),
          ),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                            child: Image.asset('image/dice$leftDice.png')
                        ),

                        SizedBox(width: 20),

                        Expanded(
                          flex: 1,
                            child: Image.asset('image/dice$rightDice.png')
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(20, 40)),
                    onPressed: (){
                      setState(() {
                        leftDice = getRandomNum();
                        rightDice = getRandomNum();
                      });
                      showToast("토스트메시지");
                    },
                    child: Icon(Icons.play_arrow),
                  )
                ],
              )
          ),
        );
      }
    );
  }
    int getRandomNum(){
      return Random().nextInt(6)+1;
    }
    
    void showToast(String message){
      Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM
      );
    }
}
