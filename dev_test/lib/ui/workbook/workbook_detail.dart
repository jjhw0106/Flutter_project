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
  // List<TextEditingController> textEditingControllerList =[];
  final _textEditingController = TextEditingController();
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('학습 범위'),
              TextField(
                controller: _textEditingController,
                onSubmitted: (value) => Text(value),
                decoration: InputDecoration(
                        hintText: "찾으실 교재명을 적어주세요",
                        isDense: true,
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff5664cd))),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff5664cd))),
                        // border: OutlineInputBorder(borderSide: Border(bottom: BorderSide)),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 30,
                          color: Color(0xff5664cd),
                        ),
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                            ),
                            child: const Text(
                              "검색",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ), 
                // const InputDecoration(
                //   hintText: "시작분량",
                //   isDense: true,
                //   ),
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
      ) 
    );
  }
}