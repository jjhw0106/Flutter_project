import 'package:intl/intl.dart';

class Date{
  String yyyyMMdd(DateTime e){
    return DateFormat('yyyy.MM.dd(E)').format(e);
  }
}