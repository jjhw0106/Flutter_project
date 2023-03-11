import 'package:dev_test/helpers/enums.dart';
import 'package:dev_test/ui/workbook/book_enrollment.dart';
import 'package:flutter/material.dart';

class StudyTypeSelectionController with ChangeNotifier{
  // bool isClicked = false;
  // 현재 선택되어 있는 학습타입 (교재 / 인강 / nothing)
  Enum? selectedType = SelectedType.bookType;
  dynamic nextPage;

  // 학습 타입에 맞는 다음 페이지를 지정
  void selectType(SelectedType selected){
    // isClicked = !isClicked;
    // selected != selectedType ?
    // selectedType = selected : 
    // selectedType = SelectedType.nothing;
    selectedType = selected;
    
    switch (selectedType){
      case SelectedType.bookType:
        nextPage = const BookEnrollment();
        print(nextPage);
        break;
      case SelectedType.videoType:
        nextPage = null;
        print(nextPage);
        break;
    }
    notifyListeners();
  }
  // 학습 디테일 입력 페이지 지정
}