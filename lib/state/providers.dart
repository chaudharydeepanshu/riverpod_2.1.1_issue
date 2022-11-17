import 'package:clean_calendar/state/properties_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late CalendarProperties calendarProperties;

void initCalendarProperties({required CalendarProperties initProperties}) {
  calendarProperties = initProperties;
}

final calendarPropertiesStateProvider =
    ChangeNotifierProvider.autoDispose((ref) {
  return CalendarPropertiesState()
    ..initializeProperties(calendarProperties: calendarProperties);
});
