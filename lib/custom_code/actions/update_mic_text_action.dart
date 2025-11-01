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

Future<String> updateMicTextAction(String currentText) async {
  // Tarkistetaan, onko FFAppState().micText tyhjä
  final micText = FFAppState().micText;

  if (micText.isEmpty) {
    // Jos mikrofoni ei palauttanut mitään, palautetaan alkuperäinen teksti
    return currentText;
  }

  // Yhdistetään vanha teksti ja mikrofoni-teksti
  final updatedText = currentText.isEmpty ? micText : '$currentText $micText';

  // Nollataan micText, jotta se ei tuplaudu seuraavalla kerralla
  FFAppState().update(() {
    FFAppState().micText = '';
  });

  return updatedText;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
