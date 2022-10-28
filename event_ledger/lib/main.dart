import 'package:event_ledger/event_happy.dart';
import 'package:event_ledger/event_sad.dart';
import 'package:event_ledger/event_total.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
  Future<Database> initDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(), 'happy_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE HAPPY (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, active BOOL)",
        );
      },
      version: 1,
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
