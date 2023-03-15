import 'package:dev_test/common/date.dart';
import 'package:dev_test/controller/workbook/workbook_detail_controller.dart';
import 'package:dev_test/data/model/kakao_workbook.dart';
import 'package:dev_test/ui/workbook/common_layout/common_widgets.dart';
import 'package:flutter/material.dart';

class WorkbookDetail extends StatefulWidget {
  late final KakaoWorkbook kakaoWorkbook;

  WorkbookDetail(selectedBook, {super.key}) {
    kakaoWorkbook = selectedBook;
  }

  @override
  State<WorkbookDetail> createState() => _WorkbookDetailState();
}

class _WorkbookDetailState extends State<WorkbookDetail> {
  // @override
  // List<TextEditingController> textEditingControllerList =[];
  final _textEditingController = TextEditingController();
  WorkbookDetailController workbookDetailController = WorkbookDetailController();
  
  @override
  void initState() {
    print("Init WorkbookDetail state!!!");
    super.initState();
    workbookDetailController.onInit();
    // setState(() {
    //   selectedTest = testList[0];
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(message: "문제집 등록"),
        body: Column(
          children: [
            const Text("문제집명 입력"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('교재명'),
                Text(
                  widget.kakaoWorkbook.title,
                  overflow: TextOverflow.clip),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('학습 범위'),
                Expanded(
                  child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '시작 페이지',
                      )),
                ),
                Expanded(
                  child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '종료 페이지',
                      )),
                ),
                const Text('페이지'),
              ],
            ),
            const Text("목표 달성 완료 일자 설정"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Text("시작날짜 ${workbookDetailController.getDate(DateTime.now())}") //Text('시작 일자')
                ),
                Expanded(
                  flex: 4,
                  child: DropdownButton(
                    value: workbookDetailController.selectedWeekterm,
                    items: workbookDetailController.weekTerm.map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(), 
                    onChanged: (selected) {
                      setState(() {
                        workbookDetailController.selectedWeekterm = selected as int;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  flex: 2,
                  child: Text('총학습기간')
                ),
                Expanded(
                  flex: 4,
                  child: DropdownButton(
                    value: workbookDetailController.selectedWeekterm,
                    items: workbookDetailController.weekTerm.map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(), 
                    onChanged: (selected) {
                      setState(() {
                        workbookDetailController.selectedWeekterm = selected as int;
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  flex: 2,
                  child: Text('예상종료일자')
                  ),
                Expanded(
                  flex: 4,
                  child: Text(widget.kakaoWorkbook.title, 
                  overflow: TextOverflow.clip),
                )
              ],
            ),
          ],
        )
      );
  }
}