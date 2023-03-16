import 'package:flutter/material.dart';

TimeOfDay changeStringToTimeOfDay(String time) {
    // 수업시간 점심, 청소 시간이 형태가 다르다
    // 수업시간은 ex> 09:05, 점심시간은 ex> 13:00 ~ 13:30
    List<String> splitTime = [];

    if (time.contains('~')) {
      splitTime = time.split('~')[0].split(':');
    } else {
      splitTime = time.split(':');
    }

    String hour = splitTime[0];
    String minute = splitTime[1];

    if (hour.length > 1) {
      if (hour[0] == '0') {
        hour = hour.substring(1, 2);
      }
    }

    if (minute.length > 1) {
      if (minute[0] == '0') {
        minute = minute.substring(1, 2);
      }
    }

    return TimeOfDay(hour: int.parse(hour), minute: int.parse(minute));
  }

  // TimeOfDay 클래스는 시간 비교 메소드가 없어서
  // DateTime 클래스로 변환해서 시간 비교 한다
  DateTime changeTimeOfDayToDateTime(TimeOfDay time) {
    DateTime dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time.hour, time.minute);
    return dateTime;
  }