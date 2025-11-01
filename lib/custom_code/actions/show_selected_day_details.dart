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

import 'package:cloud_firestore/cloud_firestore.dart';
// KORJATTU: Poistettu vanhentunut import, jota ei voida suoraan käyttää
// import '/flutter_flow/flutter_flow_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
// LISÄTTY: Tarvitaan DateFormat-luokkaa varten
import 'package:intl/intl.dart';

Future<void> showSelectedDayDetails(
    BuildContext context, DateTime selectedDay) async {
  if (selectedDay == null) {
    print('Custom Action: selectedDay on null, ei voida hakea tietoja.');
    return;
  }

  // KORJATTU: Käytetään Dartin omaa toIso8601String() -metodia
  final String formattedDate = selectedDay.toIso8601String().substring(0, 10);

  // KORJATTU: Varmistettu, että FirebaseAuth on tuotu
  final String userId = (FirebaseAuth.instance.currentUser?.uid ?? '');

  if (userId.isEmpty) {
    print('Custom Action: Käyttäjän ID puuttuu, ei voida hakea tietoja.');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Käyttäjän tietoja ei saatavilla. Kirjaudu sisään?'),
      ),
    );
    return;
  }

  final String documentId = '${userId}_$formattedDate';
  final String collectionName =
      'DailySummaries'; // KORJATTU: Oikea kokoelman nimi aiemman perusteella

  print(
      'Custom Action: Yritetään hakea dokumenttia: $collectionName/$documentId');

  try {
    final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(documentId)
        .get();

    // KORJATTU: Käytetään DateFormat-luokkaa
    String title =
        'Päivän tiedot: ${DateFormat('dd.MM.yyyy').format(selectedDay)}';
    String message;

    if (documentSnapshot.exists) {
      final data = documentSnapshot.data() as Map<String, dynamic>;
      final double moodAverage =
          (data['mood_average'] as num?)?.toDouble() ?? 0.0;
      final String aiMessage =
          data['ai_message'] as String? ?? 'Ei viestiä tälle päivälle.';

      message = 'Moodi: ${moodAverage.toStringAsFixed(1)}\n$aiMessage';
      print(
          'Custom Action: Dokumentti löytyi. Moodi: $moodAverage, Viesti: $aiMessage');
    } else {
      // KORJATTU: Käytetään DateFormat-luokkaa
      message =
          'Tietoja päivälle ${DateFormat('dd.MM.yyyy').format(selectedDay)} ei löytynyt.';
      print('Custom Action: Dokumenttia $documentId ei löytynyt.');
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } catch (e) {
    print(
        'Custom Action: Virhe datan hakemisessa tai dialogin näyttämisessä: $e');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Virhe'),
          content: Text('Tietojen hakemisessa tapahtui virhe: $e'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
