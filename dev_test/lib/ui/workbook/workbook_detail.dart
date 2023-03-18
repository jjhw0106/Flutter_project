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
  final List<TextEditingController> _textEditingControllerList =[];
  WorkbookDetailController workbookDetailController = WorkbookDetailController();
  
  @override
  void initState() {
    print("Init WorkbookDetail state!!!");
    super.initState();
    workbookDetailController.onInit();

    // 필요한 Text Feild만큼 TextController 초기화
    for(int i=0; i<2; i++){
      _textEditingControllerList.add(TextEditingController());
    }
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
            children: [
              const Text('학습 범위'),
              Expanded(
                child: TextField(
                    controller: _textEditingControllerList[0],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '시작 페이지',
                    )),
              ),
              Expanded(
                child: TextField(
                    controller: _textEditingControllerList[1],
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
                child: Text("시작날짜 ${workbookDetailController.selectedStartDate}")
              ),
              Expanded(
                flex: 4,
                // state를 controller에서 관리하기 위해 setState를 쓰지 않고 ValueListenableBuilder위젯을 사용
                child: ValueListenableBuilder(
                  valueListenable: workbookDetailController.selectedStartDateNotifier,
                  builder: (context, value, child) {
                    return DropdownButton(
                      value: workbookDetailController.selectedStartDate,
                      items: workbookDetailController.getFormattedStartDateList().map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(), 
                      onChanged: (selected) {
                        print(selected);
                        workbookDetailController.selectStartDate(selected as String);
                      },
                    );
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
                child: ValueListenableBuilder(
                  valueListenable: workbookDetailController.selectedWeektermNotifier,
                  builder: (context, value, child) {
                    return DropdownButton(
                      value: workbookDetailController.selectedWeekterm,
                      items: workbookDetailController.weekTermList.map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(), 
                      onChanged: (selected) {
                        workbookDetailController.selectWeekterm(selected as int);
                      },
                    );
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
                child: Text('workbookDetailController.getExpectedEndDate()', overflow: TextOverflow.clip),
              ),
            ],
          ),
        ],
      )
    );
  }
}