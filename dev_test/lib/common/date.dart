import 'package:intl/intl.dart';

class Date{

  // ex_ 2023.03.16(목)
  String yyyyMMdd(DateTime e){
    return DateFormat('yyyy.MM.dd(E)','ko').format(e);
  }
}