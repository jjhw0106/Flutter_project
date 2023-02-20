import 'package:dev_test/controller/workbook/study_enrollment_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future bookInfoDialog(BuildContext context, dynamic selectedBook) async{
  StudyEnrollmentController controller = Provider.of<StudyEnrollmentController>(context, listen:false);
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      actions: [
        SizedBox(child: Center(
          child: Container(
            height: 137, 
            width: 108,
            decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
            child: Image.network(
              selectedBook['thumbnail'],
              errorBuilder: (context, error, stackTrace) => const Center(child: Text('no Image')),
              ))),
        ),
        SizedBox(child: Align(alignment:Alignment.centerLeft, child: Text(selectedBook['title']))),
        SizedBox(child: Align(alignment:Alignment.centerLeft, child: Text(selectedBook['publisher']))),
        SizedBox(child: Align(alignment:Alignment.centerLeft, child: Text(selectedBook['datetime']))),
        Row(
          children: [
            ElevatedButton(
              child: const Center(child: Text("취소")),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Center(child: Text("확인")),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    ),
  );
}