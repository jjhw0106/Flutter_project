import 'package:event_ledger/event_happy.dart';
import 'package:event_ledger/event_sad.dart';
import 'package:event_ledger/event_total.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ledgerMain(),
      routes: {
        '/happy': (context) => happyMain(),
        '/sad': (context) => sadMain(),
        '/total': (context) => totalMain(),
      }
    );
  }
}

class ledgerMain extends StatefulWidget {
  const ledgerMain({Key? key}) : super(key: key);

  @override
  State<ledgerMain> createState() => _ledgerMainState();
}

class _ledgerMainState extends State<ledgerMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메인페이지'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: ElevatedButton(
                      child: Text("경사", textAlign: TextAlign.center),
                      onPressed: () async{
                        final result = await Navigator.pushNamed(context,'/happy');
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height:100,
                    width: 100,
                    child: ElevatedButton(
                      child: Text("조사"),
                      onPressed: () async{
                        final result = await Navigator.pushNamed(context, '/sad');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Container(
                  child: Text("집계"),
                ),
                onPressed: () async{
                  final result = await Navigator.pushNamed(context, '/total');
                },
              )
            ],
          )
        ],
      )
    );
  }
}
