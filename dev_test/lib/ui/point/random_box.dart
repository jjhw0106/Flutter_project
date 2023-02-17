import 'package:dev_test/controller/point/randombox_controller.dart';
import 'package:dev_test/ui/workbook/study_enrollment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'point_dialog.dart';

class RandomBox extends StatelessWidget {
  const RandomBox({super.key});

  @override
  Widget build(BuildContext context) {
    RandomBoxController controller =
        Provider.of<RandomBoxController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('팝업메뉴'),
      ),
      body: !controller.isLoading
          ? Center(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        print("callDialog!!");
                        pointDialog(context, controller.getMessage());
                      },
                      child: const ButtonBar(
                        children: [Text("포인트 지급")],
                      )),
                  ElevatedButton(
                      onPressed: () {
                        print("setStudy!!");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const StudyEnrollment(),));
                      },
                      child: const ButtonBar(
                        children: [Text("버튼")],
                      )),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(
                // https://stackoverflow.com/questions/49952048/how-to-change-color-of-circularprogressindicator
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffffffff)),
                strokeWidth: 10.0,
              ),
            ),
    );
  }
}