import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqlite_api.dart';
import 'happyInfo.dart';

class AddInfoApp extends StatefulWidget {
  final Future<Database> db;
  AddInfoApp(this.db);

  @override
  State<AddInfoApp> createState() => _AddInfoAppState();
}

class _AddInfoAppState extends State<AddInfoApp> {

  final _items = <HappyInfo>[];
  final numberFormat = NumberFormat('#,###');

  var _nameController = TextEditingController();
  var _dateController = TextEditingController();
  var _moneyController = TextEditingController();

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('info 추가'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
