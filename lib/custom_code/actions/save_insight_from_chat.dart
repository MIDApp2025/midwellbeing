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

import 'dart:convert'; // Tuo JSON-enkoodausta varten
import 'package:http/http.dart' as http; // Tuo HTTP-pyyntöjä varten

// Custom Action: saveInsightFromChat
// Tallentaa oivalluksen Firebase Firestoreen Vercel-funktion kautta.
// Palauttaa true, jos tallennus onnistui, muuten false.
Future<bool> saveInsightFromChat(
    String userId, String messageContent, bool isImportant) async {
  // HUOM: Korvaa tämä TÄSMÄLLEEN omalla Vercel-funktiosi URL-osoitteella!
  // Esimerkki: 'https://midai-functions.vercel.app/api/saveInsight'
  final String vercelFunctionUrl =
      'https://midai-functions.vercel.app/api/saveInsight';

  // Tulostetaan konsoliin, mitä tietoja yritetään lähettää.
  // Tämä auttaa debuggaamaan, jos ongelmia ilmenee.
  print('Yritetään tallentaa oivallus:');
  print('  userId: $userId');
  print('  messageContent: $messageContent');
  print('  isImportant: $isImportant');
  print('  URL: $vercelFunctionUrl');

  try {
    // Tehdään HTTP POST -pyyntö Vercel-funktiolle
    final response = await http.post(
      Uri.parse(vercelFunctionUrl),
      headers: <String, String>{
        'Content-Type':
            'application/json; charset=UTF-8', // Varmista Content-Type
      },
      body: jsonEncode(<String, dynamic>{
        // Enkoodaa data JSON-muotoon
        'userId': userId,
        'messageContent': messageContent,
        'isImportant': isImportant,
      }),
    );

    // Tarkistetaan vastauksen tilakoodi
    if (response.statusCode == 200) {
      // API-kutsu onnistui HTTP-tasolla
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      // Tarkistetaan Vercel-funktion palauttama success-kenttä
      if (responseBody['success'] == true) {
        print('Oivallus tallennettu onnistuneesti Firebaseen!');
        print('Dokumentin ID: ${responseBody['docId']}');
        return true; // Tallennus onnistui
      } else {
        // Vercel-funktio palautti virheen (esim. puuttuvat kentät)
        print(
            'Oivalluksen tallennus epäonnistui (Vercel-funktio): ${responseBody['message']}');
        return false; // Tallennus epäonnistui
      }
    } else {
      // HTTP-virhe (esim. 404 Not Found, 500 Internal Server Error)
      print(
          'HTTP-virhe oivalluksen tallennuksessa: ${response.statusCode}, ${response.body}');
      return false; // Tallennus epäonnistui
    }
  } catch (e) {
    // Yleinen virhe (esim. verkkoyhteysongelma, JSON-parsintavirhe)
    print('Virhe API-kutsua tehdessä (catch-lohko): $e');
    return false; // Tallennus epäonnistui
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
