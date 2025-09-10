import 'package:flutter/material.dart';
import 'package:flutter_calender/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  }); //constructor die Funktion/Methode die genau so heißt wie die Klasse.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dyncamicCalender',
      theme: ThemeData(),
      home: const Calendar(),
    );
  }
}
