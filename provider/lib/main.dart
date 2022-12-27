import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class Counter {
  int _count = 0;

  int get count => _count;

  void increment(){
    _count++;
  }
}

class providerEx extends StatelessWidget {
  const providerEx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<Counter>(
      create: (_)=>Counter(),
      child: CounterScreen(),
    );
  }
}

Widget CounterScreen{

}
