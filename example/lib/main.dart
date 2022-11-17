import 'package:clean_calendar/clean_calendar.dart';
import 'package:clean_calendar/state/properties_state.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Calendar App',
          themeMode: ThemeMode.system,
          home: Home(),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Calendar"),
      ),
      body: Center(
        child: ListView(
          children: const [
            CleanCalendar(),
            SizedBox(
              height: 20,
            ),
            CleanCalendar(
              datePickerCalendarView: DatePickerCalendarView.weekView,
            ),
            CleanCalendar(
              datePickerCalendarView: DatePickerCalendarView.weekView,
            ),
          ],
        ),
      ),
    );
  }
}
