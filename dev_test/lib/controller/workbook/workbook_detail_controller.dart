import 'package:dev_test/common/date.dart';
import 'package:flutter/cupertino.dart';

class WorkbookDetailController with ChangeNotifier{
  List<int> weekTermList = [];
  List<DateTime> startDateList=[];
  late String selectedStartDate;
  late int selectedWeekterm;
  late final DateTime today;
  late final Date dateUtil;
  late final ValueNotifier<String> selectedStartDateNotifier;
  late final ValueNotifier<int> selectedWeektermNotifier;

  Future onInit() async {
    dateUtil = Date();
    today = DateTime.now();
    // 26주 선택 범위
    for(int i=1; i<26 ; i++){
      weekTermList.add(i);
    }
    selectedWeekterm = weekTermList[0];
    selectedStartDate = getToday();
    selectedStartDateNotifier = ValueNotifier<String>("");
    selectedWeektermNotifier = ValueNotifier<int>(-1);
    setStartDateList();
  }

  // 시작날짜 drop down 세팅 _ 오늘 날짜부터 30일
  // 메소드 안에서 메소드 불러야 할 경우 어떻게 해결하는지? => 의견 구하기
  setStartDateList() {
    DateTime startDate = today;
    // 30일 선택 범위
    for(int i=0; i<30; i++){
      startDateList.add(startDate.add(Duration(days: i)));
    }
  }

  List<String> getFormattedStartDateList(){
    List<String> result=[];
    for(int i=0; i<startDateList.length;i++){
      result.add(convertDateFormat(startDateList[i]));
    }
    return result;
  }

  void selectStartDate(String selected){
    selectedStartDate = selected;
    selectedStartDateNotifier.value = selectedStartDate;
    // notifyListeners();
  }

  void selectWeekterm(int selected){
    selectedWeekterm = selected; 
    selectedWeektermNotifier.value = selectedWeekterm;
    // notifyListeners();
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
    DateTime targetDate = DateTime.parse(selectedStartDate);
    print(targetDate);
    targetDate = targetDate.add(Duration(days: selectedWeekterm*7));
    while (true) {
      if(targetDate.weekday == 7) break;
      targetDate = targetDate.add(const Duration(days: 1));
    }
    
    return convertDateFormat(targetDate);
  }
}