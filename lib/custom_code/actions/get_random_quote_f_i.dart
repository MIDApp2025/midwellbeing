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

Future<String> getRandomQuoteFI() async {
  final emojis = ["🌱", "✨", "💡", "🌼", "🪴"];

  final quotesFi = [
    "Pienet oivallukset johtavat suuriin muutoksiin.",
    "Yksikin pieni oivallus voi aloittaa ison muutoksen.",
    "Pienet oivallukset voivat käynnistää suurimmat muutokset.",
    "Jokainen askel vie eteenpäin.",
    "Matkasi alkaa yhdestä ajatuksesta.",
    "Kasvu alkaa tiedostamisesta.",
    "Pikkuhiljaa pienestä tulee tarpeeksi.",
    "Edistys, ei täydellisyys.",
    "Pienet askeleet, suuret tulokset.",
    "Tänään on hyvä päivä aloittaa alusta."
  ];

  emojis.shuffle();
  quotesFi.shuffle();

  return "${emojis.first} ${quotesFi.first}";
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
