import 'package:dev_test/controller/workbook/study_type_selection_controller.dart';
import 'package:dev_test/helpers/enums.dart';
import 'package:dev_test/ui/workbook/common_layout/common_widgets.dart';
import 'package:dev_test/ui/workbook/study_enrollment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudyTypeSelection extends StatefulWidget {
  const StudyTypeSelection({super.key});

  @override
  State<StudyTypeSelection> createState() => _StudyTypeSelectionState();
}

enum SelectedType {
  studyBook,
  studyVideo
}

class _StudyTypeSelectionState extends State<StudyTypeSelection> {
  late StudyTypeSelectionController selectionController;
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    selectionController = context.watch<StudyTypeSelectionController>();
    
    return Scaffold(
      // 가운데 점 alt+183 
      appBar: appBar(message: "문제집·인강 설정"),
      body: Center(
        child: Column(
          children: <Widget> [
            subTitle(height),
            typeSelection(width, height),
            SizedBox(height: height*0.25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                moveStep(context, UiHelpers.prev, '뒤로가기'),
                moveStep(context, UiHelpers.next, '다음단계', nextPage: selectionController.nextPage),
              ],
            ),
          ],    
        ),
      ),
    );
  }
  
  Widget subTitle(double height){
    return SizedBox(
      height: height * 0.1,
      child: const Text(
        '학습할 문제집·인강을 등록해주세요.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff787878),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }
  Widget typeSelection(double width, double height ){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
        InkWell(
          onTap: () {
            selectionController.selectType(SelectedOne.bookType);
          },
          child: Container(
            key: const Key('study_book'),
            decoration: BoxDecoration(
              color: selectionController.selectedType == SelectedOne.bookType ?
              const Color(0xff5664cd) :
              Colors.transparent,
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
                      '문제집 등록'
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            selectionController.selectType(SelectedOne.videoType);
          },
          child: Container(
            key: const Key('study_video'),
            decoration: BoxDecoration(
              // ignore: use_full_hex_values_for_flutter_colors
              color: selectionController.selectedType == SelectedOne.videoType ?
                const Color(0xff5664cd) :
                Colors.transparent,
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
                const Text(
                  '인강등록',
                ),
              ],
            ),
          ),
        ),
      ],
    ); 
  }
}