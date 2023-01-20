import 'package:autoplanpractice/ui/drag_table/example1.dart';
import 'package:autoplanpractice/ui/drag_table/example2.dart';
import 'package:autoplanpractice/ui/drag_table/example3.dart';
import 'package:autoplanpractice/ui/drag_table/example4.dart';
import 'package:autoplanpractice/ui/drag_table/gpt_example.dart';
import 'package:autoplanpractice/ui/timetable.dart';
import 'package:flutter/material.dart';

class DragTable extends StatelessWidget {
  const DragTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Drag Example'),
      // ),
      body: Example4(),
      // body: Example3(),
    );
  }
}
