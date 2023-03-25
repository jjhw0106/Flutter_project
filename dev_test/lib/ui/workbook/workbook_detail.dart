import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/workbook/workbook_detail_controller.dart';
import '../../data/model/kakao_workbook.dart';
import 'common_layout/common_widgets.dart';

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
  late WorkbookDetailController controller;
  
  @override
  void initState() {
    print("Init WorkbookDetail state!!!");
    controller = Provider.of<WorkbookDetailController>(context, listen: false);
    controller.onInit();
    super.initState();

    // 필요한 Text Feild만큼 TextController 초기화
    for(int i = 0; i < 2; i++){
      _textEditingControllerList.add(TextEditingController());
    }
  }

  // Provider에서 controller를 관리하고 있기 때문에 dispose()를 해도 controller가 없어지지 않는 것 같다
  // dispose()내부에서 controller의 state들을 직접 해제해주어야 한다.
  @override
  void dispose() {
    controller.statesClear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    controller = context.watch<WorkbookDetailController>();

    return Scaffold(
      appBar: appBar(
        context, 
        message: "문제집 등록", 
        actionField: [
          IconButton(
            icon: const Icon(Icons.check, size: 30),
            onPressed: () {
              print(controller.saveMyWorkbook());
            },
          ),
        ],
      ),
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
              const Expanded(
                flex: 2,
                child: Text("시작날짜")
              ),
              Expanded(
                flex: 4,
                child: DropdownButton(
                  value: controller.formattedSelectedStartDate,
                  items: controller.getFormattedStartDateList().map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), 
                  onChanged: (selected) {
                    print(selected);
                    controller.selectStartDate(selected as String);
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
                  value: controller.selectedWeekterm,
                  items: controller.weekTermList.map((e) => DropdownMenuItem(value: e, child: Text("$e"))).toList(), 
                  onChanged: (selected) {
                    controller.selectWeekterm(selected as int);
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
                child: Text(controller.getExpectedEndDate(), overflow: TextOverflow.clip),
              ),
            ],
          ),
        ],
      )
    );
  }
}