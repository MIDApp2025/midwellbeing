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

// Custom Action: updateNoteContent
// This action will retrieve the current text from a controller-like structure
// or force a refresh before the API call.

// Huom: Koska me emme voi luoda TextControlleria,
// käytämme tätä Actionia pakottamaan Widget Stated tiedon.

Future<String> getTextFromTextField(String currentText) async {
  // Oletetaan, että currentText on se arvo, jonka Widget State
  // palauttaa juuri ennen kutsun suorittamista.
  // Custom Actionit ovat luotettavampia lukemaan transientin tilan.

  // Emme tee mitään muuta kuin palautamme sen arvon.
  // Tämä askel pakottaa FlutterFlow'n VM:n lukemaan arvon
  // luotettavammalla tavalla kuin suora Action Flow.
  return currentText;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
