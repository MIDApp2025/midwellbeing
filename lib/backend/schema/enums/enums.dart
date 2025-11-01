import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

enum CalendarView {
  month,
  TwoWeeks,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (CalendarView):
      return CalendarView.values.deserialize(value) as T?;
    default:
      return null;
  }
}
