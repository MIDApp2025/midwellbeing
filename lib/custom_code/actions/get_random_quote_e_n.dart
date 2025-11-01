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

Future<String> getRandomQuoteEN() async {
  final emojis = ["🌱", "✨", "💡", "🌼", "🪴"];

  final quotesEn = [
    "Small insights lead to big changes.",
    "Even a small insight can start a big transformation.",
    "Tiny insights can spark the biggest changes.",
    "Every step forward matters.",
    "Your journey starts with one thought.",
    "Growth starts with awareness.",
    "Little by little, a lot becomes enough.",
    "Progress, not perfection.",
    "Small steps, big results.",
    "Today is a good day to start again."
  ];

  emojis.shuffle();
  quotesEn.shuffle();

  return "${emojis.first} ${quotesEn.first}";
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
