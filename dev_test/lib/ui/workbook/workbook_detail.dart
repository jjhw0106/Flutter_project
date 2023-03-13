import 'package:dev_test/data/model/kakao_workbook.dart';
import 'package:dev_test/ui/workbook/common_layout/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                Text(widget.kakaoWorkbook.title),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('학습 범위'),
                Expanded(
                  child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '학습 범위',
                      )),
                ),
                Expanded(
                  child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '학습 범위',
                      )),
                ),
              ],
            ),
            const Text("목표 달성 완료 일자 설정"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('시작 일자'),
                Text(widget.kakaoWorkbook.title),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('총학습기간'),
                Text(widget.kakaoWorkbook.title),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('예상종료일자'),
                Text(widget.kakaoWorkbook.title),
              ],
            ),
          ],
        ));
  }
}
