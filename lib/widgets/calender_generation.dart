import 'package:flutter/material.dart';

class TableGenerator extends StatelessWidget {
  DateTime date;
  TableGenerator({super.key, required this.date});
  @override
  Widget build(BuildContext context) {
    DateTime firstOfMonth = DateTime(date.year, date.month, 1);
    int daysOfMonth = DateTime(date.year, date.month + 1, 0).day;
    int daysOfPrevMonth = DateTime(date.year, date.month, 0).day;
    print(daysOfPrevMonth);
    TableRow generateWeek(List<TableCell> days) {
      return TableRow(children: days);
    }

    TableCell generateDay(int dayCounter, int weekCounter) {
      int day = weekCounter * 7 + dayCounter - firstOfMonth.weekday;
      if (day > daysOfMonth) day = day - daysOfMonth;
      if (day < 1) day = day + daysOfPrevMonth;
      return TableCell(child: Text(day.toString()));
    }

    return Table(
      children: <TableRow>[
        for (int weekCounter = 0; weekCounter < 6; weekCounter++)
          generateWeek([
            for (int dayCounter = 1; dayCounter <= 8; dayCounter++)
              generateDay(dayCounter, weekCounter),
          ]),
      ],
    );
  }
}
