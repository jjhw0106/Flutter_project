import 'package:event_ledger/event_happy.dart';
import 'package:event_ledger/event_sad.dart';
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
        '/first': (context) => happyMain(),
        '/second': (context) => sadMain(),
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
      body: MaterialApp(

      )
    );
  }
}
