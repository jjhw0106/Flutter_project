import 'package:autoplanpractice/ui/timetable.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/timetable');
            },
            child: const Text('자동학습계획표'),
          ),
        )
      ),
    );
  }
}
