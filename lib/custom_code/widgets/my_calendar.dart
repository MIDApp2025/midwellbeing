// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:table_calendar/table_calendar.dart';
import 'package:collection/collection.dart';

class MyCalendar extends StatefulWidget {
  final double width;
  final double height;
  final List<DateTime>? markedDates;
  final List<String>? markedYmdDates;
  final void Function(String)? onDaySelected;
  final String? entryType;
  final Function(double)? onSizeChanged; // 👈 tämä uusi lisäys

  const MyCalendar({
    Key? key,
    required this.width,
    required this.height,
    this.markedDates,
    this.markedYmdDates,
    this.onDaySelected,
    this.entryType,
    this.onSizeChanged, // 👈 ja tämä lisäys
  }) : super(key: key);

  @override
  _MyCalendarState createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  String _keyOf(DateTime d) {
    String two(int v) => v.toString().padLeft(2, '0');
    return '${d.year.toString().padLeft(4, '0')}-${two(d.month)}-${two(d.day)}';
  }

  Set<String> _stringDateSet = {};

  List<DateTime> get _dtList => widget.markedDates ?? const <DateTime>[];
  List<String> get _strList => widget.markedYmdDates ?? const <String>[];

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
    _stringDateSet = {for (final s in _strList) s.trim().split('T').first};
  }

  @override
  void didUpdateWidget(covariant MyCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldDT = oldWidget.markedDates ?? const <DateTime>[];
    final newDT = widget.markedDates ?? const <DateTime>[];
    final oldStr = oldWidget.markedYmdDates ?? const <String>[];
    final newStr = widget.markedYmdDates ?? const <String>[];

    if (!const DeepCollectionEquality().equals(newDT, oldDT) ||
        !const DeepCollectionEquality().equals(newStr, oldStr)) {
      _stringDateSet = {for (final s in newStr) s.trim().split('T').first};
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final calendarKey = ValueKey<String>(
      (_dtList.map(_keyOf).toList() + _stringDateSet.toList()).join(','),
    );

    return SizedBox(
      key: calendarKey,
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          const Divider(
            thickness: 1.0,
            indent: 12,
            endIndent: 12,
            color: Color(0xcc94b5d8),
          ),
          Expanded(
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              availableCalendarFormats: const {
                CalendarFormat.twoWeeks: '2 weeks',
                CalendarFormat.month: 'Month',
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                  widget.onDaySelected?.call(_keyOf(selectedDay));
                }
              },
              onFormatChanged: (format) {
  setState(() {
    _calendarFormat = format;

    // 🔹 Ilmoita ulospäin, että kalenterin korkeus muuttui
    if (widget.onSizeChanged != null) {
      final newHeight =
          format == CalendarFormat.month ? 440.0 : 220.0;
      widget.onSizeChanged!(newHeight);
    }
  });
},
availableGestures: AvailableGestures.none,
eventLoader: (day) {
  if (_dtList.any((d) => isSameDay(d, day))) return ['marked'];
  if (_stringDateSet.contains(_keyOf(day))) return ['marked'];
  return [];
},

              headerStyle: const HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 16),
              ),

              // 🟡 Tässä lisättiin Light/Dark mood värit:
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? const Color(0xFFB0B0B0)
                      : const Color(0xFF444444),
                ),
                weekendStyle: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? const Color(0xFFE0E0E0)
                      : const Color(0xFF222222),
                ),
              ),

              calendarStyle: CalendarStyle(
                todayDecoration: const BoxDecoration(
                  color: Color(0xFF3B82F6),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Color(0xFFFACC15),
                  shape: BoxShape.circle,
                ),
                markerDecoration: const BoxDecoration(
                  color: Color(0xFFEF4444),
                  shape: BoxShape.circle,
                ),
                markersMaxCount: 1,
                outsideDaysVisible: false,
                defaultTextStyle: TextStyle(
                  color: isDark
                      ? const Color(0xFFE0E0E0)
                      : const Color(0xFF333333),
                ),
                weekendTextStyle: TextStyle(
                  color: isDark
                      ? const Color(0xFFB0B0B0)
                      : const Color(0xFF666666),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1.0,
            indent: 16,
            endIndent: 16,
            color: Color(0xcc94b5d8),
          ),
        ],
      ),
    );
  }
}
