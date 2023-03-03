import 'package:dev_test/ui/point/random_box.dart';
import 'package:dev_test/ui/workbook/common_layout/common_appbar.dart';
import 'package:dev_test/ui/workbook/study_enrollment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudyTypeSelection extends StatefulWidget {
  const StudyTypeSelection({super.key});

  @override
  State<StudyTypeSelection> createState() => _StudyTypeSelectionState();
}

class _StudyTypeSelectionState extends State<StudyTypeSelection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    
    return Scaffold(
      // 가운데 점 alt+183
      appBar: appBar(message: "문제집·인강 설정"),
      body: Center(
        child: Column(
          children: <Widget> [
            typeSelection(width, height)
          ],    
        ),
      ),
    );
  }
}

  Widget typeSelection(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
        InkWell(
          onTap: () {
          },
          child: Container(
            key: const Key('study_book'),
            decoration: BoxDecoration(
              // 버튼 체크 yn -> controller 사용해보자
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xff5664cd),
              )
            ),
            width : width * 0.4,
            height: height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/iconbook.png',
                  width: width * 0.3,
                  height: width * 0.2,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(height: width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget> [
                    Text(
                      '하루에 '
                    ),
                    Text(
                      '한 두 과목',
                      style: TextStyle(
                        color: Color(0xff5664cd),
                      ),
                    ),
                    Text(
                      '을'
                    ),
                  ],
                ),
                const Text(
                  '집중 있게 공부할래!',
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
          },
          child: Container(
            key: const Key('study_video'),
            decoration: BoxDecoration(
              // ignore: use_full_hex_values_for_flutter_colors
              color: const Color(0xff197ca8f8),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xff5664cd),
              )
            ),
            width: width * 0.4,
            height: height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/iconvideo.png',
                  width: width * 0.2,
                  height: width * 0.2,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget> [
                    Text(
                      '하루에 '
                    ),
                    Text(
                      '여러 과목',
                      style: TextStyle(
                        color: Color(0xff5664cd),
                      ),
                    ),
                    Text(
                      '을'
                    ),
                  ],
                ),
                const Text(
                  '다양하게 공부할래!',
                ),
              ],
            ),
          ),
        ),
      ],
    ); 
  }