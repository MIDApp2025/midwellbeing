// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart';

String getDeviceTimeZone1() {
  final now = DateTime.now();
  final offset = now.timeZoneOffset;
  final hours = offset.inHours;
  final minutes = offset.inMinutes.remainder(60);
  final sign = hours >= 0 ? '+' : '-';
  final formattedOffset =
      '$sign${hours.abs().toString().padLeft(2, '0')}:${minutes.abs().toString().padLeft(2, '0')}';
  final name = now.timeZoneName;
  return '$name (UTC$formattedOffset)';
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
