import 'package:dev_test/controller/mynote/my_note_controller.dart';
import 'package:dev_test/ui/workbook/common_layout/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyNoteEnrollment extends StatefulWidget {
  const MyNoteEnrollment({super.key});

  @override
  State<MyNoteEnrollment> createState() => _MyNoteEnrollmentState();
}

class _MyNoteEnrollmentState extends State<MyNoteEnrollment> {
  final MyNoteController _controller = MyNoteController();

  @override
  void initState() {
    super.initState();
    _controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;

    return Scaffold(
      appBar: appBar(context, message: "MY 메모"),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 30,
              color: Colors.blue,
            ),
            Container(
              width: double.infinity,
              color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text("메모 작성"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text("제목을 입력해주세요"),)
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  
                  controller: _controller.contentsController,
              
                ),
              ),
            ),
            SizedBox(height: height*0.1)
          ],
        )
        ),
    );
  }
}