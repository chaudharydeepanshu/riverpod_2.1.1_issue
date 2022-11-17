import 'package:flutter/material.dart';

enum DatePickerCalendarView { monthView, weekView }

class CalendarProperties {
  final DatePickerCalendarView datePickerCalendarView;

  CalendarProperties({DatePickerCalendarView? datePickerCalendarView})
      : datePickerCalendarView =
            datePickerCalendarView ?? DatePickerCalendarView.monthView;
}

class CalendarPropertiesState extends ChangeNotifier {
  late DatePickerCalendarView _datePickerCalendarView;
  DatePickerCalendarView get datePickerCalendarView => _datePickerCalendarView;

  void initializeProperties({
    required CalendarProperties calendarProperties,
  }) {
    _datePickerCalendarView = calendarProperties.datePickerCalendarView;
  }

  void updateProperties({
    required CalendarProperties calendarProperties,
  }) {
    _datePickerCalendarView = calendarProperties.datePickerCalendarView;
    notifyListeners();
  }
}
