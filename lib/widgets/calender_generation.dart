import 'package:flutter/material.dart';
import 'package:isoweek/isoweek.dart';
import 'package:flutter_calender/utils/holiday_checker.dart';

class TableGenerator extends StatelessWidget {
  final DateTime date;
  const TableGenerator({super.key, required this.date});
  @override
  Widget build(BuildContext context) {
    DateTime firstOfMonth = DateTime(date.year, date.month, 1);
    int daysOfMonth = DateTime(date.year, date.month + 1, 0).day;
    int daysOfPrevMonth = DateTime(date.year, date.month, 0).day;

    TableRow generateCalendarHead() {
      List<String> weekdays = ["CW", "MO", "TU", "WE", "TH", "FR", "ST", "SU"];
      List<TableCell> calendarHeader = [];
      for (int i = 0; i < weekdays.length; i++) {
        calendarHeader.add(
          TableCell(
            child: Container(
              height: 40, // Set your desired height
              padding: EdgeInsets.symmetric(),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFEAD8C0)),
                color: Color(0xFFFFF6EC),
              ),
              child: Text(
                weekdays[i],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        );
      }
      return TableRow(children: calendarHeader);
    }

    TableRow generateWeek(List<TableCell> day) {
      return TableRow(children: day);
    }

    TableCell generateCell(int dayCounter, int weekCounter) {
      int cellContent = weekCounter * 7 + dayCounter - firstOfMonth.weekday + 1;
      if (cellContent > daysOfMonth) cellContent = cellContent - daysOfMonth;
      if (cellContent < 1) cellContent = cellContent + daysOfPrevMonth;
      if (dayCounter == 0) {
        Week currentWeek = Week.fromDate(date);
        String currentWeekString = currentWeek.toString().substring(5, 7);
        int calendarWeek = int.parse(currentWeekString);
        cellContent = calendarWeek + weekCounter;
      }
      HolidayChecker checker = HolidayChecker(date: date);
      bool isHoliday =
          !(dayCounter == 0) &&
          checker.getHoliday(DateTime(date.year, date.month, cellContent)) !=
              null;
      return TableCell(
        child: Container(
          alignment: Alignment.center,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFEAD8C0)),
            color: dayCounter == 0
                ? Color((0xFF70C1B3))
                : isHoliday
                ? Color.fromARGB(255, 138, 189, 214)
                : null,
          ),
          child: Text(cellContent.toString()),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Table(
        children: <TableRow>[
          generateCalendarHead(),
          for (int weekCounter = 0; weekCounter < 6; weekCounter++)
            generateWeek([
              for (int dayCounter = 0; dayCounter <= 7; dayCounter++)
                generateCell(dayCounter, weekCounter),
            ]),
        ],
      ),
    );
  }
}
