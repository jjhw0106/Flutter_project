import 'package:dev_test/data/model/kakao_workbook.dart';
import 'package:dev_test/data/repository/study_enrollment_repository.dart';
import 'package:flutter/cupertino.dart';

class StudyEnrollmentController with ChangeNotifier {
  late List<KakaoWorkbook> bookList;
  final StudyEnrollmentRepository studyEnrollmentRepository;

  StudyEnrollmentController(this.studyEnrollmentRepository);

  bool isLoading = false;
  // bool isClicked = false;
  String title = "";
  dynamic selectedItem;

  Future<void> onInit(context) async {
    isLoading = true;
    print("controller setting...");
    bookList = <KakaoWorkbook>[];
    isLoading = false;
  }

  Future<void> setBookInfoList(String? title) async {
    List<dynamic> apiList = await studyEnrollmentRepository.getBookInfos(title);
    // 리스트에 누적돼서 초기화 필요
    bookList = [];
    for (var element in apiList) {
      bookList.add(KakaoWorkbook.fromMap(element));
    }
    isLoading=false;
    notifyListeners();
  }

  String resultYn() {
    if(bookList.isEmpty) {
      return "검색 결과가 없습니다.";
    } 
    return "";
  }

  void rowSelection(dynamic selectedItem){
    // for문 말고 다른 방법은?
    for (var element in bookList) {
      if(element != selectedItem && element.isClicked == true){
        element.isClicked = false;
      }
    }
    selectedItem.isClicked = !selectedItem.isClicked;
    !selectedItem.isClicked ? selectedItem = null : selectedItem = selectedItem;
    // print('클릭여부 $isClicked');
    print('선택 아이템: selectedItem');
    notifyListeners();
  }

}
