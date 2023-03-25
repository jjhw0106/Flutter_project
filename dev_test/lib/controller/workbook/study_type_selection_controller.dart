import 'package:dev_test/helpers/enums.dart';
import 'package:flutter/material.dart';

import '../../ui/workbook/book_enrollment.dart';

class StudyTypeSelectionController with ChangeNotifier{
  // 현재 선택되어 있는 학습타입 (교재 / 인강 / nothing)
  SelectedType? selectedType = SelectedType.bookType;
  dynamic nextPage;

  // 학습 타입에 맞는 다음 페이지를 지정
  void selectType(SelectedType selected){
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
      case null:
        nextPage = null;
      break;
    }
    notifyListeners();
  }
}