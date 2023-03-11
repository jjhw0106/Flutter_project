import 'package:dev_test/data/model/kakao_workbook.dart';
import 'package:dev_test/ui/workbook/common_layout/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkbookDetail extends StatefulWidget {
  late final KakaoWorkbook kakaoWorkbook;

  WorkbookDetail(selectedBook, {super.key}){
    kakaoWorkbook = selectedBook;
  }

  @override
  State<WorkbookDetail> createState() => _WorkbookDetailState();
}

class _WorkbookDetailState extends State<WorkbookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(message: "문제집 등록"),
      body: Text(widget.kakaoWorkbook.title),
    );
  }
}