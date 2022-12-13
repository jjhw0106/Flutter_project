import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Screen A'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/b');
                },
                child: Text('Screen B'),
              ),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/c');
                },
                child: Text('Screen C'),
              ),
            ],
          ),
        )
    );
  }
}