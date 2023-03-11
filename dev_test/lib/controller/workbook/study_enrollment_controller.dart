import 'package:dev_test/data/model/kakao_workbook.dart';
import 'package:dev_test/data/repository/study_enrollment_repository.dart';
import 'package:dev_test/ui/workbook/workbook_detail.dart';
import 'package:flutter/cupertino.dart';

class StudyEnrollmentController with ChangeNotifier {
  late List<KakaoWorkbook> bookList;
  final StudyEnrollmentRepository studyEnrollmentRepository;

  StudyEnrollmentController(this.studyEnrollmentRepository);

  bool isLoading = false;
  String title = "";
  dynamic nextPage;

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
    isLoading = false;
    notifyListeners();
  }

  String resultYn() {
    if (bookList.isEmpty) {
      return "검색 결과가 없습니다.";
    }
    return "";
  }

  void rowSelection(dynamic selectedItem) {
    // for문 말고 다른 방법은?
    for (var element in bookList) {
      if (element != selectedItem && element.isClicked == true) {
        element.isClicked = false;
      }
    }
    selectedItem.isClicked = !selectedItem.isClicked;
    !selectedItem.isClicked ? selectedItem = null : selectedItem = selectedItem;
    print('선택 아이템: $selectedItem');
    notifyListeners();
  }

  // rowSelection안에서 실행하려다 분리
  // 인강과 교재 선택에 따라 받아오는 nextpage를 하나의 메소드로 구분하기 위한 메소드
  // dynamic -> Widget?으로 변경 x => Widget이 아니고 객체타입이 옴
  void getNextPage(dynamic selectedItem) {
    nextPage = null;
    // 클릭된 경우만 nextPage 지정해야하기 때문
    if (selectedItem.isClicked == true) {
      // if (selectedItem.runtimeType == KakaoWorkbook) {
      //   nextPage = const WorkbookDetail();
      //   print("nextPage2: $nextPage");
      // }
      print("nextpage: $nextPage");
      switch (selectedItem.runtimeType) {
        case KakaoWorkbook:
          nextPage = WorkbookDetail(selectedItem);
          break;
        default:
      }
    }
  }
}
