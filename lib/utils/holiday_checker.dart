import 'package:collection/collection.dart';
import 'package:flutter_calender/utils/date_formatter.dart';
import 'package:flutter_calender/utils/holiday.dart';

class HolidayChecker {
  final DateTime date;
  HolidayChecker({required this.date});

  Holiday? getHoliday(DateTime selectedDate) {
    List<Holiday> holidayList = _getAllHolidays();
    return holidayList.firstWhereOrNull(
      (element) => selectedDate == element.date,
    );
  }

  List<Holiday> _getAllHolidays() {
    final List<Holiday> allHolidays = [];
    final Holiday easterSunday = _getEasterSunday(); 
    final Holiday easterMonday = _getEasterMonday(easterSunday.date);
    final Holiday himmelfahrt = _getHimmelfahrt(easterSunday.date);
    final Holiday pfingsten = _getPfingsten(easterSunday.date);
    final Holiday karfreitag = _getKarfreitag(easterSunday.date);
    final Holiday fronleichnam = _getFronleichnam(easterSunday.date);
    final Holiday tagDerDeutschenEinheit = Holiday(
      date: DateTime(date.year, 10, 3),
      holidayName: "Tag der Deutschen Einheit",
      dateAsString: DateFormatterHelper.formatDate(DateTime(date.year, 10, 3)),
    );

    allHolidays.addAll([
      easterSunday,
      easterMonday,
      himmelfahrt,
      pfingsten,
      karfreitag,
      fronleichnam,
      tagDerDeutschenEinheit,
    ]);
    return allHolidays;
  }

  Holiday _getEasterMonday(DateTime easterSundayDate) {
    final Holiday easterMonday = Holiday(
      date: easterSundayDate.add(Duration(days: 1)),
      holidayName: "Easter Monday",
      dateAsString: DateFormatterHelper.formatDate(
        easterSundayDate.add(Duration(days: 1)),
      ),
    );
    return easterMonday;
  }

  Holiday _getHimmelfahrt(DateTime easterSundayDate) {
    final Holiday himmelfahrt = Holiday(
      date: easterSundayDate.add(Duration(days: 39)),
      holidayName: "Himmelfahrt",
      dateAsString: DateFormatterHelper.formatDate(
        easterSundayDate.add(Duration(days: 39)),
      ),
    );
    return himmelfahrt;
  }

  Holiday _getPfingsten(DateTime easterSundayDate) {
    final Holiday pfingsten = Holiday(
      date: easterSundayDate.add(Duration(days: 49)),
      holidayName: "Pfingsten",
      dateAsString: DateFormatterHelper.formatDate(
        easterSundayDate.add(Duration(days: 49)),
      ),
    );
    return pfingsten;
  }

  Holiday _getKarfreitag(DateTime easterSundayDate) {
    final Holiday karfreitag = Holiday(
      date: easterSundayDate.add(Duration(days: -2)),
      holidayName: "Karfreitag",
      dateAsString: DateFormatterHelper.formatDate(
        easterSundayDate.add(Duration(days: -2)),
      ),
    );
    return karfreitag;
  }

  Holiday _getFronleichnam(DateTime easterSundayDate) {
    return Holiday(
      date: easterSundayDate.add(Duration(days: 60)),
      holidayName: "Fronleichnam",
      dateAsString: DateFormatterHelper.formatDate(
        easterSundayDate.add(Duration(days: 60)),
      ),
    );
  }

  Holiday _getEasterSunday() {
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
    final easterDate = DateTime(year, n, o + 1); //n is month o is the day
    return Holiday(
      date: easterDate,
      holidayName: "Easter",
      dateAsString: DateFormatterHelper.formatDate(date),
    );
  }
}
