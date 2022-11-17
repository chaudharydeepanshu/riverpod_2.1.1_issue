library clean_calendar;

import 'package:clean_calendar/state/properties_state.dart';
import 'package:clean_calendar/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CleanCalendar extends StatelessWidget {
  /// - CleanCalendar, Shows a simple Calendar.
  const CleanCalendar({
    Key? key,
    this.datePickerCalendarView,
  }) : super(key: key);

  /// - datePickerCalendarView, It takes calendar view type.
  final DatePickerCalendarView? datePickerCalendarView;

  @override
  Widget build(BuildContext context) {
    initCalendarProperties(
      initProperties:
          CalendarProperties(datePickerCalendarView: datePickerCalendarView),
    );

    return ProviderScope(
      child: Calendar(datePickerCalendarView: datePickerCalendarView),
    );
  }
}

class Calendar extends ConsumerStatefulWidget {
  const Calendar({
    Key? key,
    this.datePickerCalendarView,
  }) : super(key: key);

  final DatePickerCalendarView? datePickerCalendarView;

  @override
  ConsumerState<Calendar> createState() => _CalendarState();
}

class _CalendarState extends ConsumerState<Calendar> {
  @override
  void didUpdateWidget(covariant Calendar oldWidget) {
    if (oldWidget != widget) {
      final CalendarPropertiesState readCalendarPropertiesStateProviderValue =
          ref.read(calendarPropertiesStateProvider);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        readCalendarPropertiesStateProviderValue.updateProperties(
          calendarProperties: CalendarProperties(
            datePickerCalendarView: widget.datePickerCalendarView,
          ),
        );
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
