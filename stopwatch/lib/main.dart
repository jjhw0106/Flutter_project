import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "스톱워치 프로젝트",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StopWatchPage(),
    );
  }
}

class StopWatchPage extends StatefulWidget {
  const StopWatchPage({Key? key}) : super(key: key);

  @override
  State<StopWatchPage> createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stop Watch'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>setState((){
          _clickButton();
        }),
        child: _isRunning ? Icon(Icons.pause) : Icon(Icons.play_arrow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Widget _buildBody(){
    var sec = _time ~/ 100;
    var hundredth = '${_time %100}'.padLeft(2,'0');

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Stack(
          children: <Widget>[
            Column(
              children:<Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '$sec',
                      style: TextStyle(fontSize: 50.0),
                    ),
                    Text('$hundredth'),
                  ],
                ),
                Container(
                  width: 100,
                  height: 200,
                  child: ListView(
                    children: _labTimes.map((time)=>Text(time).toList()),
                ),
              ],
            ),
            Positioned(
              left: 10,
              bottom: 10,
              child: FloatingActionButton(
                backgroundColor: Colors.deepOrange,
                  onPressed: _reset,
                  // onPressed: (){_reset();},
                child: Icon(Icons.rotate_left),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: ElevatedButton(
                  onPressed: (){
                    setState((){
                      _recordLapTime('$sec.$hundredth');
                    });
                  },
                child: Text('랩타임'),
              )
            )
          ]
        )
      )
    );
  }
  void _clickButton(){
    _isRunning = !_isRunning;

    if(_isRunning){
      _start();
    } else{
      _pause();
    }
  }

  void _reset(){
    setState((){
      _isRunning = false;
      _timer?.cancel();
      _labTimes.clear();
      _time = 0;
    });
  }

  void _recordLapTime(String time){
    _labTimes.add('${(_labTimes.length+1)}등 $time');
  }

  void _start(){
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState((){
        _time++;
      });
    });
  }
  void _pause(){
    return _timer?.cancel();
  }

  Timer? _timer;
  var _time = 0;
  var _isRunning = false;

  List<String> _labTimes = [];

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }
}
