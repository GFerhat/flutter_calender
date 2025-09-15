import 'package:collection/collection.dart';
import 'package:flutter_calender/utils/date_formatter.dart';
import 'package:flutter_calender/utils/holiday.dart';

class HolidayChecker {
  final DateTime date;
  HolidayChecker({required this.date});

  bool isHoliday(DateTime selectedDate) {
    List<Holiday> holidaysList = _getAllHolidays();
    final holiday = holidaysList.firstWhereOrNull(
      (element) => selectedDate == element.date,
    );
    return holiday == null ? false : true;
  }

  List<Holiday> _getAllHolidays() {
    final List<Holiday> allHolidays = [];
    final Holiday easterSunday = Holiday(
      date: getEasterSunday(),
      holidayName: "Easter",
      dateAsString: DateFormatterHelper.formatDate(date),
    );
    final Holiday easterMonday = Holiday(
      date: getEasterSunday().add(Duration(days: 1)),
      holidayName: "Easter Monday",
      dateAsString: DateFormatterHelper.formatDate(date),
    );
    final Holiday himmelfahrt = Holiday(
      date: getEasterSunday().add(Duration(days: 39)),
      holidayName: "Himmelfahrt",
      dateAsString: DateFormatterHelper.formatDate(date),
    );
    final Holiday pfingsten = Holiday(
      date: getEasterSunday().add(Duration(days: 49)),
      holidayName: "Pfingsten",
      dateAsString: DateFormatterHelper.formatDate(date),
    );
    final Holiday karfreitag = Holiday(
      date: getEasterSunday().add(Duration(days: -2)),
      holidayName: "Karfreitag",
      dateAsString: DateFormatterHelper.formatDate(date),
    );
    final Holiday fronLeichnam = Holiday(
      date: getEasterSunday().add(Duration(days: 60)),
      holidayName: "Fronleichnam",
      dateAsString: DateFormatterHelper.formatDate(date),
    );
    allHolidays.addAll([
      easterSunday,
      himmelfahrt,
      pfingsten,
      karfreitag,
      fronLeichnam,
    ]);
    return allHolidays;
  }

  // String() {
  //   final DateTime easterSunday = getEasterSunday(date.year);
  //   return easterSunday.toIso8601String();
  // }

  DateTime getEasterSunday() {
    final year = date.year;
    //Spencer algorythm to get eastern Date
    int a = year % 19;
    int b = (year / 100).floor();
    int c = year % 100;
    int d = (b / 4).floor();
    int e = b % 4;
    int f = ((b + 8) / 25).floor();
    int g = ((b - f + 1) / 3).floor();
    int h = (19 * a + b - d - g + 15) % 30;
    int i = (c / 4).floor();
    int k = c % 4;
    int l = (32 + 2 * e + 2 * i - h - k) % 7;
    int m = ((a + 11 * h + 22 * l) / 451).floor();
    int n = ((h + l - 7 * m + 114) / 31).floor();
    int o = (h + l - 7 * m + 114) % 31;
    return DateTime(year, n, o + 1);
    //n is month o is the day
  }
}
  // Function getFlexibleHoliday() {
  // var osternDate = getOsterSonntag(year);

  //berechnet die vom Ostern abhängigen Feiertage- + / - addiert / subtrahiert Tage
  // ostermontag  + 1);

  // christiHimmelfahrt + 39);

  // pfingsten + 49);

  // karfreitag - 2);

  // fronleichnam + 60);
