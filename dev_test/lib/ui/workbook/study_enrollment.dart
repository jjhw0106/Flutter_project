import 'package:dev_test/controller/workbook/study_enrollment_controller.dart';
import 'package:dev_test/data/model/kakao_workbook.dart';
import 'package:dev_test/helpers/enums.dart';
import 'package:dev_test/ui/workbook/book_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common_layout/common_widgets.dart';

class StudyEnrollment extends StatefulWidget {
  const StudyEnrollment({super.key});
  // const double a = 0; 클래스 변수 필드에서는 const사용 불가, static 필요
  // 이유 : 클래스 생성시 생성자를 도는데 컴파일 시 먼저 읽어 드리는 const 변수가 클래스 변수로 존재하면
  // 클래스 생성 전에 클래스 변수가 먼저 생성되어 있는 모순이 발생
  @override
  State<StudyEnrollment> createState() => _StudyEnrollmentState();
}

const double fontSize = 16;

class _StudyEnrollmentState extends State<StudyEnrollment> {
  final _textController = TextEditingController();
  late StudyEnrollmentController studyController;
  late dynamic bookList;
  // 최초 검색 전 표시 문구
  String screenMessage = "학습할 교재명을 검색해주세요!";

  @override
  void initState() {
    super.initState();
    studyController =
        Provider.of<StudyEnrollmentController>(context, listen: false);
    studyController.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    studyController = context.watch<StudyEnrollmentController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onVerticalDragDown: (details) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // 키보드 입력시 화면 밀림 방지
        resizeToAvoidBottomInset: false,
        appBar: appBar(message: "문제집 등록", selected: "국어"),
        body: !studyController.isLoading
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _textController,
                      onSubmitted: (value) {
                        _searchBooks();
                        _textController.clear();
                      },
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
                              _searchBooks();
                              _textController.clear();
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
                    ),
                  ),
                  Expanded(
                    child: studyController.bookList.isEmpty
                        ? Center(child: Text(screenMessage))
                        : ListView.builder(
                            itemCount: studyController.bookList.length,
                            itemBuilder: (context, index) {
                              return bookItemContainer(context, studyController.bookList[index], height, width);
                            },
                          ),
                  ),
                  SizedBox(
                    height: height*0.2,
                    width: double.infinity,
                    // color: Color(0xff66000000),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.question_mark),
                        const SizedBox(height: 10),
                        footerText("원하는 문제집이 없으시다면"),
                        footerText("검색어를 상세하게 입력 후 재검색해 주세요!"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          moveStep(context, UiHelpers.prev, "뒤로가기"),
                          moveStep(context, UiHelpers.next, "다음단계")
                        ]),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 175, 45, 45)),
                  strokeWidth: 10.0,
                ),
              ),
      ),
    );
  }

  // 검색결과 x 문구세팅 및 책검색 API 검색결과 세팅
  void _searchBooks() {
    studyController.setBookInfoList(_textController.text);
    screenMessage = studyController.resultYn();
  }
  // 하단 노출 메시지
  Widget footerText(String message) {
    return Text(
      message,
      style: const TextStyle(
          color: Color(0xff66000000),
          fontSize: fontSize,
          fontFamily: 'NotoSansKR-Medium',
          fontWeight: FontWeight.bold),
    );
  }

  // 검색된 도서 표시 레이아웃
  Widget bookItemContainer(BuildContext context, KakaoWorkbook selectedBook, double height, double width) {
    return Container(
      decoration: BoxDecoration(
          border: const Border(top: BorderSide(width: 1, color: Color(0xffeeeeee))),
          color: selectedBook.isClicked ? Colors.amber : Colors.transparent,
          ),
      height: height*0.08,
      width: width,
      child: GestureDetector(
        // GestureDetector의 child에 아무리 큰 Container 영역을 잡아도 실제 위젯만큼만 터치 영역이 설정된다
        // 아래 코드는 GestureDetector의 child 전체 영역을 터치 범위로 인식할 수 있도록 해준다.
        behavior: HitTestBehavior.translucent,
        onTap: () {
          print("도서 선택 ${selectedBook.title}");
          studyController.rowSelection(selectedBook);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(27.3, 0, 17.3, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: Text(
                  selectedBook.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Noto_Sans_KR-Medium'),
                ),
              ),
              Flexible(
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  onPressed: () {
                    bookInfoDialog(context, selectedBook);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

