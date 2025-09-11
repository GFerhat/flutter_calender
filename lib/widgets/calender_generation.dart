import 'package:flutter/material.dart';
import 'package:isoweek/isoweek.dart';

class TableGenerator extends StatelessWidget {
  DateTime date;
  TableGenerator({super.key, required this.date});
  @override
  Widget build(BuildContext context) {
    DateTime firstOfMonth = DateTime(date.year, date.month, 1);
    int daysOfMonth = DateTime(date.year, date.month + 1, 0).day;
    int daysOfPrevMonth = DateTime(date.year, date.month, 0).day;

    TableRow generateWeek(List<TableCell> day) {
      return TableRow(children: day);
    }

    TableCell generateDay(int dayCounter, int weekCounter) {
      int cellContent = weekCounter * 7 + dayCounter - firstOfMonth.weekday + 1;
      if (cellContent > daysOfMonth) cellContent = cellContent - daysOfMonth;
      if (cellContent < 1) cellContent = cellContent + daysOfPrevMonth;
      if (dayCounter == 0) {
        Week currentWeek = Week.fromDate(date);
        String currentWeekString = currentWeek.toString().substring(5, 7);
        int calendarWeek = int.parse(currentWeekString);
        cellContent = calendarWeek + weekCounter;
      }
      return TableCell(child: Text(cellContent.toString()));
    }

    return Table(
      children: <TableRow>[
        for (int weekCounter = 0; weekCounter < 6; weekCounter++)
          generateWeek([
            for (int dayCounter = 0; dayCounter <= 7; dayCounter++)
              generateDay(dayCounter, weekCounter),
          ]),
      ],
    );
  }
}
