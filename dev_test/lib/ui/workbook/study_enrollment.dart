import 'package:dev_test/controller/workbook/study_enrollment_controller.dart';
import 'package:dev_test/data/model/book_info.dart';
import 'package:dev_test/ui/workbook/book_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const double a = 0;

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
  final int _PREV = 1;
  final int _NEXT = 2;
  final _textController = TextEditingController();
  List<BookInfo> bookInfo = [];
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
    studyController = context.watch<StudyEnrollmentController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      onVerticalDragDown: (details) =>
          FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        // 키보드 입력시 화면 밀림 방지
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const Text("문제집 등록",
              style: TextStyle(
                color: Colors.black, 
                fontSize: 21.7,
                fontWeight: FontWeight.bold
                ),
              ),
        ),
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
                    child: studyController.searchTextList.isEmpty
                        ? Center(child: Text(screenMessage))
                        : ListView.builder(
                            itemCount: studyController.searchTextList.length,
                            itemBuilder: (context, index) {
                              return bookItemContainer(context,
                                  studyController.searchTextList[index]);
                            },
                          ),
                  ),
                  SizedBox(
                    height: 125,
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
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          moveStep(context, _PREV, "뒤로가기"),
                          moveStep(context, _NEXT, "다음단계")
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
}

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

Widget moveStep(BuildContext context, int move, String message,
    {String? next}) {
  // ButtonStyle style = ElevatedButton.styleFrom(
  //   textStyle: const TextStyle(fontSize: 17.7, color: Colors.black),
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
  //   minimumSize: const Size(143.3, 54),
  // );
  ButtonStyle style = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xfff6f7fa)),
    foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.white;
      }
      return const Color(0xff5664cd);
    }),
    side: MaterialStateProperty.all<BorderSide>(const BorderSide(width: 1, color: Color(0xff5664cd))),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80)
        ),
      ),
    textStyle: MaterialStateProperty.all<TextStyle>(
      const TextStyle(
        color: Colors.white, 
        fontSize: fontSize, 
        fontWeight: FontWeight.bold),
        ),
    elevation: MaterialStateProperty.all(0),
    minimumSize: MaterialStateProperty.all(const Size(143.3, 54)),
    overlayColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.pressed)
          ? const Color(0xff5664cd)
          : null;
    }),
  );
  return ElevatedButton(
    onPressed: () {
      if (move == 1) {
        Navigator.pop(context);
      } else if (move == 2) {}
    },
    style: style,
    child: Text(message),
  );
}

// 검색된 도서 표시 레이아웃
Widget bookItemContainer(BuildContext context, dynamic selectedBook) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(top: BorderSide(width: 1, color: Color(0xffeeeeee)))),
    height: 60,
    width: 100,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(27.3, 0, 17.3, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 8,
            child: Text(
              selectedBook['title'],
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Noto_Sans_KR-Medium'),
            ),
          ),
          Flexible(
            flex: 2,
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
  );
}
