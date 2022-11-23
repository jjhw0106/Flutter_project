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
                        child: Image.asset('image/dice1.png')
                    ),

                    SizedBox(width: 20),

                    Expanded(
                      flex: 1,
                        child: Image.asset('image/dice2.png')
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){}, child: )
            ],
          )
      ),
    );
  }
}
