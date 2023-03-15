import 'package:dev_test/common/date.dart';
import 'package:flutter/cupertino.dart';

class WorkbookDetailController with ChangeNotifier{
  late List<int> weekTerm;
  late int selectedWeekterm;
  late final DateTime today;
  late final Date dateUtil;
  late List<String> startDateList;

  Future onInit() async {
    weekTerm = [1,2,3,4,5,6,7,8];
    selectedWeekterm = weekTerm[0];
    // today = DateTime.now();
    dateUtil = Date();
    setStartDateList();
  }

  setStartDateList(){
    DateTime today = getDate(DateTime.now());
    for(int i=0; i<60; i++){
      print(today.add(Duration(days: i)));
      // startDateList.add();
    }
  }

  getDate(DateTime date){
    String formattedToday = dateUtil.yyyyMMdd(date);
    return formattedToday;
  }
}