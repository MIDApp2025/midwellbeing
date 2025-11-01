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

import 'package:intl/intl.dart';
import 'dart:io' show Platform;

class LocalTimeTextAuto extends StatelessWidget {
  final dynamic timestamp; // voi olla String, List tai null
  final String? formattedDateTime; // vaihtoehtoinen lähde
  final double width;
  final double height;

  const LocalTimeTextAuto({
    Key? key,
    this.timestamp,
    this.formattedDateTime,
    this.width = double.infinity,
    this.height = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🔹 1. Jos formattedDateTime on annettu, näytä se suoraan
    if (formattedDateTime != null && formattedDateTime!.isNotEmpty) {
      return Text(
        formattedDateTime!,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.color
                  ?.withOpacity(0.7),
              fontSize: 13,
            ),
      );
    }

    // 🔹 2. Poimi timestamp mahdollisesta listasta
    final ts = (timestamp is List && timestamp.isNotEmpty)
        ? timestamp.first.toString()
        : timestamp?.toString();

    if (ts == null || ts.isEmpty) return const Text('');

    // 🔹 3. Parsitaan aika
    final parsed = DateTime.tryParse(ts);
    if (parsed == null) return const Text('');

    // 🔹 4. Muutetaan laitteen aikavyöhykkeelle
    final local = parsed.toLocal();

    // 🔹 5. Näytetään paikallinen päivämäärä ja kellonaika
    final locale = Platform.localeName.toLowerCase();
    final dateFormatter = DateFormat.yMd(locale);
    final timeFormatter = DateFormat.Hm(locale);

    final formatted =
        '${dateFormatter.format(local)} ${timeFormatter.format(local)}';

    return SizedBox(
      width: width,
      height: height,
      child: Text(
        formatted,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.color
                  ?.withOpacity(0.7),
              fontSize: 13,
            ),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
