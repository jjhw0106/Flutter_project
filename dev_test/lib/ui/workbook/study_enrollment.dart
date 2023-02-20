import 'package:dev_test/controller/workbook/study_enrollment_controller.dart';
import 'package:dev_test/data/model/book_info.dart';
import 'package:dev_test/ui/workbook/book_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudyEnrollment extends StatefulWidget {
  const StudyEnrollment({super.key});

  @override
  State<StudyEnrollment> createState() => _StudyEnrollmentState();
}

class _StudyEnrollmentState extends State<StudyEnrollment> {
  int _PREV = 1;
  int _NEXT = 2;
  final _textController = TextEditingController();
  List<BookInfo> bookInfo=[];
  late StudyEnrollmentController studyController;
  late dynamic bookList;
  // 최초 검색 전 표시 문구
  String noSearchMessage = "학습할 교재명을 검색해주세요!";

  @override
  void initState() {
    super.initState();
    studyController = Provider.of<StudyEnrollmentController>(context, listen: false);
    studyController.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    studyController = context.watch<StudyEnrollmentController>();
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
            ),
          elevation: 0,
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const Text("문제집 등록", style: TextStyle(color: Colors.black,fontSize: 21.7)),
        ),
      
      body: !studyController.isLoading
          ? GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _textController,
                      onSubmitted: (value) => _searchBooks(),
                      decoration: InputDecoration(
                        hintText: "찾으실 교재명을 적어주세요",
                        isDense: true,
                        prefixIcon: const Icon(Icons.search,size: 30),
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 20 ),
                          child: ElevatedButton(
                            onPressed: () => _searchBooks(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                            ), 
                            child: const Text("검색",style: TextStyle(color: Colors.black),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: studyController.searchTextList.length == 0 ? 
                    Center(child: Text(noSearchMessage)): 
                    ListView.builder(
                      itemCount: studyController.searchTextList.length,
                      itemBuilder: (context, index) {
                        return bookItemContainer(context, studyController.searchTextList[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        moveStep(context, _PREV, "뒤로가기"),
                        moveStep(context, _NEXT, "다음단계")
                      ]
                    ),  
                  )
                ],
              ),
          ) 
          : const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 175, 45, 45)),
                strokeWidth: 10.0,
              ),
            ),
    );
  }
  // 검색결과 x 문구세팅 및 책검색 API 검색결과 세팅
  void _searchBooks(){
    noSearchMessage = "검색 결과가 없습니다.";
    studyController.setBookInfoList(_textController.text);
    _textController.text = '';
    setState(() {});
  }
}

Widget moveStep(BuildContext context, int move, String message,{String? next}){
  ButtonStyle style =  ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 17.7, color: Colors.black),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
    minimumSize: const Size(143.3,54),
    );
  return ElevatedButton(
    onPressed: (){
      if(move == 1){
        Navigator.pop(context);
      }else if(move == 2){
        
      }
    },
    style: style, 
    child: Text(message),
  );
}

// 검색된 도서 표시 레이아웃
Widget bookItemContainer(BuildContext context, dynamic selectedBook){
  return SizedBox(
    height: 70,
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
              }
            )
          )
        ],
      ),
    ),
  );
}