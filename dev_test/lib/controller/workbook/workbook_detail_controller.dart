import 'package:dev_test/common/date.dart';
import 'package:flutter/cupertino.dart';

class WorkbookDetailController with ChangeNotifier{
  final weekTerm = {1,2,3,4,5,6,7,8};
  final today = DateTime.now();
  final dateUtil = Date();
  getToday(){
    String formattedToday = dateUtil.yyyyMMdd(today);
    print(formattedToday);
  }
}