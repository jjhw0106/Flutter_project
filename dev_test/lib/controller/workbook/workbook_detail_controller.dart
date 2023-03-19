import 'package:dev_test/common/date.dart';
import 'package:dev_test/helpers/constants.dart';
import 'package:flutter/cupertino.dart';

class WorkbookDetailController with ChangeNotifier{
  List<int> weekTermList = [];
  List<DateTime> startDateList=[];
  late DateTime selectedStartDate;
  late int selectedWeekterm;
  late String formattedSelectedStartDate;
  late Date dateUtil;
  DateTime today = DateTime.now();

  Future onInit() async {
    dateUtil = Date();
    setWeekTermList();
    setStartDateList();
    selectedWeekterm = weekTermList[0];
    selectedStartDate = startDateList[0];
    formattedSelectedStartDate = convertDateFormat(selectedStartDate);
  }

  // 시작날짜 drop down 세팅 _ 오늘 날짜부터 30일
  setStartDateList() {
    DateTime startDate = DateTime(today.year, today.month, today.day);
    print(startDate);
    // 30일 선택 범위
    for(int i=0; i < STUDY_START_DATE_RANGE; i++){
      startDateList.add(startDate.add(Duration(days: i)));
    }
  }

  // 학습주차 drop down 세팅 _ 오늘 날짜부터 26주
  setWeekTermList(){
    for(int i=1; i < STUDY_WEEK_RANGE; i++){
      weekTermList.add(i);
    }
  }
  
  
  List<String> getFormattedStartDateList(){
    List<String> result=[];
    for(int i=0; i<startDateList.length;i++){
      result.add(convertDateFormat(startDateList[i]));
    }
    return result;
  }

  /*
    1. String으로 포맷팅 된 형태의 날짜를 받아온다.
    2. 1.의 포맷팅된 날짜를 DateTime으로 파싱
    3. selectedStartDate를 2.의 DateTime 값으로 업데이트
  */
  void selectStartDate(String selected){
    // selectedStartDate = selected;
    formattedSelectedStartDate = selected;
    selectedStartDate = DateTime.parse('${selected.replaceAll('.', '-').replaceRange(10, 13, ' ')}00:00:00.000');
    notifyListeners();
  }

  void selectWeekterm(int selected){
    selectedWeekterm = selected;  
    notifyListeners();
  }

  // 오늘 날짜 yyyMMdd(요일)로 포맷팅
  String getToday() => dateUtil.yyyyMMdd(today);

  // 전달받은 date를 yyyyMMdd 포맷으로 변환
  String convertDateFormat(DateTime date) => dateUtil.yyyyMMdd(date);

  // 예상 종료일자 구하기(주차+ 한 뒤 그 주의 일요일)
  // 일자 + 주차수*7
  // 해당 일자의 요일값이 일요일인지 체크
  // 아니면 loop(일자 + 1)
  String getExpectedEndDate(){
    DateTime targetDate = selectedStartDate;
    print(targetDate);
    targetDate = targetDate.add(Duration(days: selectedWeekterm*7));
    while (true) {
      if(targetDate.weekday == 7) break;
      targetDate = targetDate.add(const Duration(days: 1));
    }
    
    return convertDateFormat(targetDate);
  }

  void statesClear(){
    startDateList.clear();
    weekTermList.clear();
  }
}