import 'package:flutter/material.dart';
import 'package:flutter_calender/widgets/calender_generation.dart';
import 'package:flutter_calender/widgets/headsection.dart';

class Calendar extends StatefulWidget {
  Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime date = DateTime(2025, 4, 1);
  void changeSelectedDate(DateTime selectedDate) {
    setState(() {
      date = selectedDate;
    });
    debugPrint('${date.day}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // or your desired height
        child: Header(
          date: date,
        ), // Replace 'YourTitle' with the required argument
      ),
      body: TableGenerator(date: date, onChangeDate: changeSelectedDate),
    );
  }
}
