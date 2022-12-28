import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {  },
            child: const Text('자동학습계획표'),
          ),
        )
      ),
    );
  }
}
