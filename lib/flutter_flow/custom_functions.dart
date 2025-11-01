import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? getTodayStart() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

DateTime getStartOfMonth() {
  final now = DateTime.now().toUtc(); // tämä on oleellista
  return DateTime.utc(now.year, now.month, 1); // UTC alkuun
}

double? getMoodAverage(List<dynamic> entries) {
  if (entries.isEmpty) return 0.0;

  double sum = 0;
  int count = 0;

  for (final entry in entries) {
    if (entry['mood'] != null) {
      sum += entry['mood'];
      count++;
    }
  }

  return count > 0 ? (sum / count) / 5.0 : 0.0;
}

List<int>? returnlistBq() {
  return [1, 3, 5];
}

double? getAverageFromEntries(
  List<dynamic> entries,
  String fieldName,
) {
  if (entries.isEmpty) return 0.0;

  double sum = 0;
  int count = 0;

  for (final entry in entries) {
    if (entry[fieldName] != null) {
      sum += entry[fieldName];
      count++;
    }
  }

  return count > 0 ? (sum / count) / 5.0 : 0.0;
}

double? newCustomFunction3(List<MoodEntriesRecord> documents) {
  if (documents.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  int count = 0;

  for (final doc in documents) {
    final double? value = doc.mood;

    if (value != null) {
      sum += value;
      count++;
    }
  }

  if (count == 0) {
    return 0.0;
  }

  double average = sum / count;
  double normalizedAverage = average / 5.0;
  return normalizedAverage.clamp(0.0, 1.0);
}

int? newCustomFunction4(List<dynamic> inputList) {
  if (inputList == null || inputList.isEmpty) {
    return 0;
  }

  return inputList.length;
}

double? newCustomFunctionNumber(List<MoodEntriesRecord> documents) {
  if (documents.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  int count = 0;

  for (final doc in documents) {
    final double? value = doc.mood; // tai kenttä missä sinun arvo

    if (value != null) {
      sum += value;
      count++;
    }
  }

  if (count == 0) {
    return 0.0;
  }

  double average = sum / count;
  return average; // näyttää 1–5
}

double? newCustomFunctionConfidence(List<ConfidenceEntriesRecord> documents) {
  if (documents.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  int count = 0;

  for (final doc in documents) {
    final double? value = doc.confidence; // <-- tämä on nyt kenttä "confidence"

    if (value != null) {
      sum += value;
      count++;
    }
  }

  if (count == 0) {
    return 0.0;
  }

  double average = sum / count;
  double normalizedAverage = average / 5.0;
  return normalizedAverage.clamp(0.0, 1.0);
}

double? newCustomConfidenceNumber(List<ConfidenceEntriesRecord> documents) {
  if (documents.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  int count = 0;

  for (final doc in documents) {
    final double? value = doc.confidence;

    if (value != null) {
      sum += value;
      count++;
    }
  }

  if (count == 0) {
    return 0.0;
  }

  double average = sum / count;
  return average;
}

double? newCustomBelonging(List<BelongingEntriesRecord> documents) {
  if (documents.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  int count = 0;

  for (final doc in documents) {
    final double? value = doc.belonging;

    if (value != null) {
      sum += value;
      count++;
    }
  }

  if (count == 0) {
    return 0.0;
  }

  double average = sum / count;
  double normalizedAverage = average / 5.0;
  return normalizedAverage.clamp(0.0, 1.0);
}

double? newCustombelongingNumber(List<BelongingEntriesRecord> documents) {
  if (documents.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  int count = 0;

  for (final doc in documents) {
    final double? value = doc.belonging;

    if (value != null) {
      sum += value;
      count++;
    }
  }

  if (count == 0) {
    return 0.0;
  }

  double average = sum / count;
  return average;
}

double? newCustomStrength(List<StrengthEntriesRecord> documents) {
  if (documents.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  int count = 0;

  for (final doc in documents) {
    final double? value = doc.strength;

    if (value != null) {
      sum += value;
      count++;
    }
  }

  if (count == 0) {
    return 0.0;
  }

  double average = sum / count;
  double normalizedAverage = average / 5.0;
  return normalizedAverage.clamp(0.0, 1.0);
}

double? newCustomStrengthNumber(List<StrengthEntriesRecord> documents) {
  if (documents.isEmpty) {
    return 0.0;
  }

  double sum = 0.0;
  int count = 0;

  for (final doc in documents) {
    final double? value = doc.strength; // tämä haetaan kentästä strength

    if (value != null) {
      sum += value;
      count++;
    }
  }

  if (count == 0) {
    return 0.0;
  }

  double average = sum / count;
  return average;
}

List<dynamic>? getQuestionsAsChatMessages(dynamic documentData) {
  List<Map<String, dynamic>> chatMessages = [];

  Map<String, dynamic> dataMap = {};

  // TARKISTA TÄMÄ KOHTA ERITYISEN HUOLELLISESTI
  // Jos documentData on jo Map<String, dynamic>, käytä sitä suoraan.
  if (documentData is Map<String, dynamic>) {
    dataMap = documentData;
  } else if (documentData != null && documentData.data is Function) {
    // Jos documentData on tyyppiä DocumentSnapshot (jolla on .data() metodi),
    // muunna se Mapiksi käyttämällä .data()-metodia.
    // Tämä on yleisin tapa saada data DocumentSnapshotista.
    try {
      dataMap = documentData.data() as Map<String, dynamic>;
    } catch (e) {
      // Virhe datan muuntamisessa, tulosta virhe konsoliin debuggausta varten.
      print(
          'Virhe Custom Funktiossa: Datan muuntaminen Mapiksi epäonnistui: $e');
      return chatMessages; // Palauta tyhjä lista virhetilanteessa
    }
  } else if (documentData != null) {
    // Jos documentData ei ole Map eikä DocumentSnapshot (esim. pelkkä FieldValue),
    // tulosta debug-viesti ja palauta tyhjä lista.
    print(
        'Virhe Custom Funktiossa: documentData on odottamaton tyyppi: ${documentData.runtimeType}');
    return chatMessages;
  } else {
    // documentData on null, palauta tyhjä lista.
    return chatMessages;
  }

  // Poimi kysymykset 1-10
  for (int i = 1; i <= 10; i++) {
    String questionFieldName = 'question$i';
    if (dataMap.containsKey(questionFieldName)) {
      String? questionText =
          dataMap[questionFieldName] as String?; // Lue kysymysteksti
      if (questionText != null && questionText.isNotEmpty) {
        chatMessages.add({
          'sender': 'assistant', // Aseta lähettäjäksi "assistant"
          'text': questionText, // Kysymysteksti
          'timestamp':
              DateTime.now().toIso8601String(), // Lisää nykyinen aikaleima
        });
      }
    }
  }

  return chatMessages; // Palauta koottu viestilista
}

List<dynamic>? addUserMessageToChat(
  List<dynamic> chatMessages,
  String userMessage,
) {
  {
    return [
      ...chatMessages,
      {
        'role': 'user',
        'content': userMessage,
      },
    ];
  }
}

dynamic createChatItem(String userMessage) {
  Map<String, dynamic> createChatItem(String userMessage) {
    return {
      'role': 'user',
      'content': userMessage,
    };
  }
}

List<dynamic>? addTestBotMessageToConfidence(
  List<dynamic> messages,
  String botMessage,
) {
  final newMessage = {
    'role': 'assistant',
    'content': botMessage,
  };
  return [...messages, newMessage];
}

List<dynamic>? addTestUserMessageToConfidence(
  List<dynamic> messages,
  String userMessage,
) {
  final newMessage = {
    'role': 'test_user',
    'content': userMessage,
  };
  return [...messages, newMessage];
}

int? getQuestionNumberFromApi(
  String? apiResponse,
  dynamic apiResponsegetTestQuestion,
) {
  int getQuestionNumberFromApi(dynamic apiResponse) {
    if (apiResponse != null &&
        apiResponse is Map<String, dynamic> &&
        apiResponse.containsKey('currentQuestion')) {
      return apiResponse['currentQuestion'] as int;
    }
    return 0; // Palauta 0 tai jokin muu oletusarvo, jos numeroa ei löydy
  }
}

int? getQuestionNumberFromApiTest(dynamic apiResponse) {
  int getQuestionNumberFromApi(dynamic apiResponse) {
    if (apiResponse != null &&
        apiResponse is Map<String, dynamic> &&
        apiResponse.containsKey('currentQuestion')) {
      return apiResponse['currentQuestion'] as int;
    }
    return 0;
  }
}

String generateUuid() {
  {
    final now = DateTime.now().millisecondsSinceEpoch;
    final random =
        now.toRadixString(36) + now.toString().split('').reversed.join();
    // Varmista, että pituus ei ylitä merkkijonon todellista pituutta.
    final int endIndex = random.length < 32 ? random.length : 32;
    return random.substring(0, endIndex);
  }
}

List<dynamic>? getTestsByCategory(String? category) {
// Funktio hakee testit Firestoresta kategorian perusteella.
// Se palauttaa listan Map-objekteista, joissa on testin otsikko ja dokumentin ID.
// Koska FlutterFlow'ssa palautustyyppi on JSON, muutamme listan JSON-stringiksi.
  Future<String> getTestsByCategory(String category) async {
    // Palautustyyppi muutettu Stringiksi (JSON-string)
    // Varmista, että kategoria-parametri ei ole tyhjä
    if (category.isEmpty) {
      print('Kategoriaa ei annettu. Palautetaan tyhjä JSON-lista.');
      return jsonEncode([]); // Palautetaan tyhjä JSON-lista
    }

    try {
      // Viittaus 'confidenceTestQuestions' -kokoelmaan Firestoresta
      final CollectionReference testsCollection =
          FirebaseFirestore.instance.collection('confidenceTestQuestions');

      // Suoritetaan kysely: hae dokumentit, joissa 'category'-kenttä on yhtä suuri kuin annettu kategoria.
      final QuerySnapshot querySnapshot =
          await testsCollection.where('category', isEqualTo: category).get();

      // Käydään läpi kyselyn tulokset ja rakennetaan lista Map-objekteista
      final List<Map<String, String>> testList = querySnapshot.docs.map((doc) {
        // Haetaan testin otsikko ja dokumentin ID
        final String title = doc['title'] as String? ??
            'Nimetön Testi'; // Oletusarvo, jos otsikkoa ei löydy
        final String documentId = doc.id; // Dokumentin oma ID

        // Palautetaan Map, joka sisältää otsikon ja ID:n
        return {
          'title': title,
          'documentId': documentId,
        };
      }).toList();

      print('Haettu ${testList.length} testiä kategorialle: $category');
      return jsonEncode(testList); // Muunnetaan lista JSON-stringiksi
    } catch (e) {
      // Virheen sattuessa tulostetaan virhe konsoliin ja palautetaan tyhjä JSON-lista
      print('Virhe testien hakemisessa kategorialla $category: $e');
      return jsonEncode([]); // Palautetaan tyhjä JSON-lista virhetilanteessa
    }
  }
}

List<ConfidenceTestQuestionStruct>? getTestsByCategory1(String? category) {
  Future<List<dynamic>> getTestsByCategory1(String category) async {
    // Palautustyyppi muutettu List<dynamic>:ksi
    // Varmista, että kategoria-parametri ei ole tyhjä
    if (category.isEmpty) {
      print('Kategoriaa ei annettu. Palautetaan tyhjä lista.');
      return []; // Palautetaan tyhjä lista
    }

    try {
      // Viittaus 'confidenceTestQuestions' -kokoelmaan Firestoresta
      final CollectionReference testsCollection =
          FirebaseFirestore.instance.collection('confidenceTestQuestions');

      // Suoritetaan kysely: hae dokumentit, joissa 'category'-kenttä on yhtä suuri kuin annettu kategoria.
      final QuerySnapshot querySnapshot =
          await testsCollection.where('category', isEqualTo: category).get();

      // Käydään läpi kyselyn tulokset ja rakennetaan lista Map-objekteista
      final List<Map<String, dynamic>> testList = querySnapshot.docs.map((doc) {
        // Haetaan testin otsikko ja dokumentin ID
        final String title = doc['title'] as String? ??
            'Nimetön Testi'; // Oletusarvo, jos otsikkoa ei löydy
        final String documentId = doc.id; // Dokumentin oma ID

        // Palautetaan Map, joka sisältää otsikon ja ID:n
        return {
          'title': title,
          'documentId': documentId,
          // Voit lisätä tähän myös muita kenttiä, jos tarvitset niitä
        };
      }).toList();

      print('Haettu ${testList.length} testiä kategorialle: $category');
      return testList; // Palautetaan suoraan lista Map-objekteista
    } catch (e) {
      // Virheen sattuessa tulostetaan virhe konsoliin ja palautetaan tyhjä lista
      print('Virhe testien hakemisessa kategorialla $category: $e');
      return []; // Palautetaan tyhjä lista virhetilanteessa
    }
  }
}

List<ConfidenceTestQuestionStruct>? getTestsByCategory2(String? category) {
// Funktio hakee testit Firestoresta kategorian perusteella.
// Se palauttaa suoraan listan Map-objekteista, joissa on vain otsikko ja dokumentin ID.
  Future<List<dynamic>> getTestsByCategory2(String category) async {
    // Varmista, että kategoria-parametri ei ole tyhjä
    if (category.isEmpty) {
      print('Kategoriaa ei annettu. Palautetaan tyhjä lista.');
      return [];
    }

    try {
      // Viittaus 'confidenceTestQuestions' -kokoelmaan Firestoresta
      final CollectionReference testsCollection =
          FirebaseFirestore.instance.collection('confidenceTestQuestions');

      // Suoritetaan kysely: hae dokumentit, joissa 'category'-kenttä on yhtä suuri kuin annettu kategoria.
      final QuerySnapshot querySnapshot =
          await testsCollection.where('category', isEqualTo: category).get();

      // Käydään läpi kyselyn tulokset ja rakennetaan lista Map-objekteista
      final List<Map<String, dynamic>> testList = querySnapshot.docs.map((doc) {
        // Haetaan testin otsikko ja dokumentin ID
        final String title = doc['title'] as String? ?? 'Nimetön Testi';
        final String documentId = doc.id; // Dokumentin oma ID

        // Palautetaan Map, joka sisältää VAIN otsikon ja ID:n
        return {
          'title': title,
          'documentId': documentId,
        };
      }).toList();

      print('Haettu ${testList.length} testiä kategorialle: $category');
      return testList;
    } catch (e) {
      print('Virhe testien hakemisessa kategorialla $category: $e');
      return [];
    }
  }
}

DateTime? getFirstDayOfMonth() {
  DateTime getFirstDayOfMonth() {
    // Get the current date
    DateTime now = DateTime.now();
    // Return the first day of the current month (year, month, day: 1)
    return DateTime(now.year, now.month, 1);
  }
}

DateTime? getLastDayOfMonth() {
  DateTime getLastDayOfMonth() {
    // Get the current date
    DateTime now = DateTime.now();
    // Calculate the first day of the next month
    DateTime firstDayOfNextMonth = DateTime(now.year, now.month + 1, 1);
    // Subtract one day to get the last day of the current month
    return firstDayOfNextMonth.subtract(const Duration(days: 1));
  }
}

double? getAverageFromApiGraph(dynamic apiResponse) {
  double? getAverageFromApiGraph(dynamic apiResponse) {
    if (apiResponse == null) return 0.0;

    // Jos arvo on suoraan numero
    if (apiResponse is num) {
      double avg = apiResponse.toDouble();
      return avg % 1 == 0
          ? avg.truncateToDouble()
          : double.parse(avg.toStringAsFixed(1));
    }

    // Jos arvo on JSON-muodossa ja siellä average
    if (apiResponse is Map<String, dynamic> &&
        apiResponse.containsKey('average')) {
      final average = apiResponse['average'];
      if (average is num) {
        double avg = average.toDouble();
        return avg % 1 == 0
            ? avg.truncateToDouble()
            : double.parse(avg.toStringAsFixed(1));
      }
    }

    return 0.0;
  }
}

String? getAlignmentFromRole(String? role) {
  Alignment getAlignmentFromRole(String role) {
    if (role == 'user') {
      return Alignment.centerRight;
    } else {
      return Alignment.centerLeft;
    }
  }
}

bool? isAssistantMessage(dynamic senderRole) {
// This function checks if the given role is "assistant".
// It returns true if the role is "assistant", otherwise false.
// Funktio on nyt vankempi ja käsittelee tapauksia, joissa senderRole ei ole String.
  bool isAssistantMessage(dynamic senderRole) {
    // Tyyppi dynamic
    // Tulostetaan senderRole-muuttujan arvo konsoliin debuggausta varten.
    // Tämä auttaa meitä näkemään, mitä arvoa funktio todella saa.
    print(
        'isAssistantMessage: senderRole received: $senderRole (Type: ${senderRole.runtimeType})');

    // Tarkistetaan, onko senderRole String-tyyppiä ennen vertailua.
    if (senderRole is String) {
      // Varmistetaan, ettei senderRole ole null ja verrataan sitä "assistant"-merkkijonoon.
      return senderRole == 'assistant';
    }
    return false; // Jos senderRole ei ole String tai on null, palautetaan false.
  }
}

bool? isMessageFavorite(
  String? currentMessageText,
  List<OmatOivalluksetRecord>? favoriteInsightsDocs,
) {
// This function checks if the current message text exists in the list of favorite insights.
// It iterates through the favoriteInsightsDocs and compares their 'message_text' field
// with the currentMessageText.
  bool isMessageFavorite(
      String currentMessageText, List<dynamic> favoriteInsightsDocs) {
    // If either the current message text is null/empty or the list of favorite insights is null/empty,
    // then the message cannot be considered saved.
    if (currentMessageText == null ||
        currentMessageText.isEmpty ||
        favoriteInsightsDocs == null ||
        favoriteInsightsDocs.isEmpty) {
      return false;
    }

    // Iterate through each document in the favorite insights list.
    for (final doc in favoriteInsightsDocs) {
      // Ensure the document is a Map and contains the 'message_text' key.
      // Firestore-dokumentit tulevat usein Map-tyyppisinä.
      if (doc is Map<String, dynamic> && doc.containsKey('message_text')) {
        // Get the saved message text from the document.
        final savedMessageText = doc['message_text'] as String?;
        // Compare the current message text with the saved message text.
        // Trim whitespace and compare in a case-insensitive manner for better matching.
        // Tämä auttaa, jos viestissä on pieniä eroja välilyönneissä tai isoissa/pienissä kirjaimissa.
        if (savedMessageText != null &&
            savedMessageText.trim().toLowerCase() ==
                currentMessageText.trim().toLowerCase()) {
          return true; // Viesti löytyi tallennetuista!
        }
      }
    }
    return false; // Viestiä ei löytynyt tallennetuista.
  }
}

Color? getFavoriteIconColor(String? currentMessageText) {
  Color? getFavoriteIconColor(
    String? currentMessageText,
    List<OmatOivalluksetRecord>? favoriteInsightsDocs,
  ) {
    // Jos viesti tai lista on tyhjä, palauta harmaa
    if (currentMessageText == null ||
        currentMessageText.isEmpty ||
        favoriteInsightsDocs == null ||
        favoriteInsightsDocs.isEmpty) {
      return Colors.grey;
    }

    final currentText = currentMessageText.trim().toLowerCase();

    for (final doc in favoriteInsightsDocs) {
      final savedText = doc.messageContent?.trim().toLowerCase();
      if (savedText == currentText) {
        return Colors.red; // Viesti löytyi, sydän muuttuu punaiseksi
      }
    }

    return Colors.grey; // Ei löytynyt, sydän pysyy harmaana
  }
}

String? getChatMessageText(dynamic chatMessageData) {
// Tämä funktio palauttaa annetun tekstin sellaisenaan.
// Se on nyt yksinkertaisempi, jotta vältetään tyyppiongelmat.
  String getChatMessageText(String messageText) {
    // Muutettu String-tyyppiin
    return messageText;
  }
}

String? formatDateFromSeconds(int? timestampSeconds) {
  String formatDateFromSeconds(int timestampSeconds) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestampSeconds * 1000);
    return "${date.day}.${date.month}.${date.year}";
  }
}

/// viikkokalenteri
List<DateTime>? getCurrentWeekRange() {
  List<DateTime> getCurrentWeekRange() {
    final now = DateTime.now();
    final monday = DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: now.weekday - 1));
    final nextMonday = monday.add(Duration(days: 7));
    return [monday, nextMonday];
  }
}

List<DateTime>? getMoodEntryDates(List<MoodEntriesRecord>? moodEntries) {
// ÄLÄ LISÄÄ TÄNNE MITÄÄN IMPORT-RIVEJÄ MANUAALISESTI!
// FlutterFlow lisää automaattisesti kaikki tarvittavat, jos tarvitaan.

  List<DateTime> getMoodEntryDates(List<MoodEntriesRecord>? moodEntries) {
    if (moodEntries == null) {
      return [];
    }
    return moodEntries
        .map((entry) {
          // Tässä on se tärkeä muutos: Käsittelemme timestamp-kentän dynaamisena
          // ja muunnamme sen eksplisiittisesti Timestamp-tyypiksi.
          // Oletetaan, että 'timestamp' on olemassa ja se on Firestoren Timestamp-tyyppinen.
          // FlutterFlow'n Record-luokissa on usein tapa päästä käsiksi alkuperäisiin Firestore-tyyppeihin.

          // Huom: 'Timestamp' on FlutterFlow'n automaattisesti tuoma tyyppi,
          // vaikka et itse importtia lisää.
          final dynamic timestampValue =
              entry.timestamp; // Haetaan arvo dynaamisena

          if (timestampValue is Timestamp) {
            // Tarkistetaan, onko se Timestamp
            return timestampValue.toDate(); // Muunna Timestamp DateTimeksi
          }

          // Jos timestamp puuttuu tai on väärää tyyppiä, palauta null
          return null;
        })
        .where((date) => date != null)
        .toList()
        .cast<DateTime>(); // Poista null-arvot ja varmista tyyppi
  }
}

List<DateTime>? convertStringsToDateTimes(List<String>? dateStrings) {
  List<DateTime> convertStringsToDateTimes(List<String> dateStrings) {
    if (dateStrings == null) {
      print(
          'convertStringsToDateTimes: Input dateStrings is null. Returning empty list.'); // #DEBUG
      return [];
    }
    print(
        'convertStringsToDateTimes: Processing ${dateStrings.length} date strings.'); // #DEBUG
    return dateStrings
        .map((dateString) {
          try {
            // Jäsennä merkkijono ensin DateTime-objektiksi
            final parsedDateTime = DateTime.parse(dateString);
            // Palauta uusi DateTime-objekti, joka on UTC-aikaan nollattu keskiyöllä
            final utcMidnightDateTime = DateTime.utc(
                parsedDateTime.year, parsedDateTime.month, parsedDateTime.day);
            print(
                'convertStringsToDateTimes: Parsed "$dateString" to $parsedDateTime, converted to UTC midnight: $utcMidnightDateTime (isUtc: ${utcMidnightDateTime.isUtc})'); // #DEBUG
            return utcMidnightDateTime;
          } catch (e) {
            print('Error parsing date string: $dateString - $e'); // #DEBUG
            return null;
          }
        })
        .where((dt) => dt != null)
        .cast<DateTime>()
        .toList();
  }
}

List<String>? convertApiStringList(List<String>? rawDates) {
  List<String> convertApiStringList(List<String> rawDates) {
    return rawDates;
  }
}

List<String>? dateListToStringList(List<DateTime>? dates) {
  List<String>? dateListToStringList(List<DateTime>? dates) {
    if (dates == null) return null;
    return dates.map((d) => d.toIso8601String()).toList();
  }
}

List<String>? joinDateListToText(List<DateTime>? dates) {
  String? joinDateListToText(List<DateTime>? dates) {
    if (dates == null || dates.isEmpty) return 'No dates found.';
    return dates.map((d) => d.toIso8601String()).join(', ');
  }
}

String? formatDateTimeToIso8601(DateTime? dateTime) {
// Funktio, jonka FlutterFlow luo automaattisesti
// Tässä on jo valmiiksi null-safety huomioitu.
  String? formatDateTimeToIso8601(DateTime? dateTime) {
// MODIFY CODE ONLY BELOW THIS LINE
    if (dateTime == null) {
      return null; // Tai tyhjä merkkijono ''
    }
    return dateTime.toIso8601String();
// MODIFY CODE ONLY ABOVE THIS LINE
  }
}

List<DateTime>? getTestDates() {
  List<DateTime> getTestDates() {
    return [
      DateTime(2025, 7, 22),
      DateTime(2025, 7, 29),
      DateTime(2025, 7, 31),
    ];
  }
}

List<DateTime>? getHardcodedDates() {
  print(
      'DEBUG: Palautetaan kovakoodattuja päiviä.'); // Lisää tämä debug-tuloste
  return [
    DateTime.utc(2025, 7, 22),
    DateTime.utc(2025, 7, 23),
    DateTime.utc(2025, 7, 24),
  ];
}

List<DateTime>? parseApiDates(List<String>? dateStrings) {
// Koodi alkaa suoraan tästä:
// (FlutterFlow lisää import 'dart:core'; ja funktion nimen automaattisesti)

  List<DateTime> dateTimes = [];

// Tarkista, onko dateStrings-input null tai tyhjä
  if (dateStrings == null || dateStrings.isEmpty) {
    print(
        'convertStringsToDateTimes: Saatu tyhjä tai null dateStrings-lista. Palautetaan tyhjä lista.');
    return [];
  }

  print(
      'convertStringsToDateTimes: Käsittelyssä ${dateStrings.length} merkkijonoa.');

  for (String dateString in dateStrings) {
    try {
      // Varmista, että merkkijono päättyy 'Z'-merkkiin UTC-muodossa
      if (!dateString.endsWith('Z')) {
        dateString += 'Z';
      }
      // Jäsennä merkkijono ja muunna UTC-aikavyöhykkeeseen
      final parsedDateTime =
          DateTime.parse(dateString).toUtc(); // <-- TÄMÄ ON MÄÄRITELMÄ
      // Nollaa kellonaika UTC-keskiyöhön (jotta table_calendar vertailee vain päivää)
      final utcMidnightDateTime = DateTime.utc(
          parsedDateTime.year, // <-- KORJATTU NIMEKSI parsedDateTime
          parsedDateTime.month, // <-- KORJATTU NIMEKSI parsedDateTime
          parsedDateTime.day // <-- KORJATTU NIMEKSI parsedDateTime
          );
      dateTimes.add(utcMidnightDateTime);
      print('  ✅ Parsed "$dateString" to UTC midnight: $utcMidnightDateTime');
    } catch (e) {
      print('  ❌ ERROR: Virhe päivämäärän parsimisessa "$dateString": $e');
      // Älä keskeytä, vaan jatka muiden päivämäärien käsittelyä, jos virhe ilmenee
    }
  }

  print(
      'convertStringsToDateTimes: Muunnettu yhteensä ${dateTimes.length} kelvollista päivämäärää.');
  return dateTimes;
}

String? createDailySummaryDocId(
  String userId,
  DateTime selectedDate,
) {
  final formatter = DateFormat('yyyy-MM-dd');
  final formattedDate = formatter.format(selectedDate);
  return '${userId}_$formattedDate';
}

String? getDeviceTimeZone() {
  String? getDeviceTimeZone() {
    return DateTime.now().timeZoneName;
  }
}

String? formatTimestampSimle(DateTime? timestamp) {
  String formatTimestampSimple(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return "Juuri nyt";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} min sitten";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} t sitten";
    } else if (difference.inDays < 7) {
      return "${difference.inDays} pv sitten";
    } else {
      final localTime = timestamp.toLocal();
      return "${localTime.day}.${localTime.month}.${localTime.year} klo ${localTime.hour}:${localTime.minute.toString().padLeft(2, '0')}";
    }
  }
}

String? formatToLocalTime(String? utcTime) {
  String convertUtcStringToLocalString(String utcString) {
    if (utcString.isEmpty) return '';
    try {
      final utc = DateTime.parse(utcString);
      final local = utc.toLocal();
      // Muotoile haluamallasi tavalla
      return DateFormat('dd.MM.yyyy HH:mm').format(local);
    } catch (e) {
      return utcString;
    }
  }
}

DateTime? secondsToDateTime(int? seconds) {
  DateTime? secondsToDateTime(int seconds) {
    if (seconds == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
  }
}

String? formatDateTimeFromSeconds(int? seconds) {
  String formatDateTimeFromSeconds(int seconds) {
    if (seconds == null) {
      return '';
    }
    final date = DateTime.fromMillisecondsSinceEpoch(seconds * 1000).toLocal();
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }
}

String? formatDate(int? seconds) {
  String formatDate(int seconds) {
    if (seconds == null) {
      return '';
    }
    final date = DateTime.fromMillisecondsSinceEpoch(seconds * 1000).toLocal();
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }
}

Color? getMessageColorNew(String? sender) {
  if (sender == "user") {
    return Color(0xFF007BFF); // Sininen käyttäjälle
  } else {
    return Color(0xFFE0E0E0); // Harmaa assistentille
  }
}

String? checkMessage(String? messageText) {
  if (messageText == null || messageText.trim().isEmpty) {
    return null; // Ei palauteta edes välilyöntiä
  } else {
    return messageText.trim(); // Palautetaan puhdistettu teksti
  }
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}

bool? isUserRole(dynamic message) {
  bool isUserRole(Map<String, dynamic>? message) {
    return message != null && message['role'] == 'user';
  }
}

bool? isAssistantRole(dynamic message) {
  bool isAssistantRole(Map<String, dynamic>? message) {
    return message != null && message['role'] == 'assistant';
  }
}

String? formatDateTimeIso8601UrlEncoded(DateTime? dateTime) {
  String? formatDateTimeIso8601UrlEncoded(DateTime? dateTime) {
    // Jos argumentti on null, palautetaan null
    if (dateTime == null) {
      return null;
    }

    // Muutetaan ISO 8601 -muotoon laitteen aikavyöhykkeellä
    String isoString = dateTime.toIso8601String();

    // URL-enkoodataan, jotta esim. +03:00 ei muutu välilyönniksi API-kutsussa
    String encoded = Uri.encodeComponent(isoString);

    return encoded;
  }
}

List<DateTime>? parseYyyyMmDdList(List<String>? dates) {
  /// Muuntaa merkkijonolistan (YYYY-MM-DD) DateTime-listaksi.
  /// Palauttaa tyhjän listan, jos mitään kelvollista ei ole.
  /// Epäkelvot alkiot ohitetaan hiljaisesti.
  ///
  /// Esim. ["2025-08-10", "2025-08-13"] -> [DateTime(2025,8,10), DateTime(2025,8,13)]
  List<DateTime> parseYyyyMmDdList(List<String> dates) {
    if (dates.isEmpty) return <DateTime>[];

    final List<DateTime> out = [];
    for (final s in dates) {
      if (s == null) continue; // varmuuden vuoksi, jos API joskus antaa nullin
      final str = s.trim();
      // hyväksytään vain tarkka muoto YYYY-MM-DD
      final parts = str.split('-');
      if (parts.length != 3) continue;
      final y = int.tryParse(parts[0]);
      final m = int.tryParse(parts[1]);
      final d = int.tryParse(parts[2]);
      if (y == null || m == null || d == null) continue;
      if (m < 1 || m > 12 || d < 1 || d > 31) continue;
      try {
        // Huom: tämä luo PAIKALLISEN DateTime’n (ei UTC:tä), mikä on kalenterille juuri se mitä halutaan.
        out.add(DateTime(y, m, d));
      } catch (_) {
        // ohitetaan virheelliset päivät (kuten 2025-02-30)
      }
    }
    return out;
  }
}

dynamic findSummaryByDate(
  List<dynamic>? items,
  String? date,
) {
  dynamic findSummaryByDate(List<dynamic> items, String date) {
    if (items == null) return null;
    for (final item in items) {
      if (item is Map && item['date'] == date) {
        return item;
      }
    }
    return null;
  }
}

String getFirstDayOfYear() {
  DateTime now = DateTime.now();
  DateTime firstDay = DateTime(now.year, 1, 1);
  return firstDay.toString().substring(0, 10);
}

String getLastDayOfYear() {
  DateTime now = DateTime.now();
  DateTime lastDay = DateTime(now.year, 12, 31);
  return lastDay.toString().substring(0, 10);
}

List<DateTime>? singleDateTodayList() {
  List<DateTime> singleDateTodayList() {
    final now = DateTime.now();
    return [DateTime(now.year, now.month, now.day)];
  }
}

List<DateTime>? parseYMDtoDateList(List<String>? dates) {
  List<DateTime> parseYMD_toDateList(List<String> dates) {
    final out = <DateTime>[];
    if (dates.isEmpty) {
      print('parseYMD_toDateList: input empty');
      return out;
    }
    print('parseYMD_toDateList: got ${dates.length} items');
    final re = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$'); // vain YYYY-MM-DD

    for (final raw in dates) {
      if (raw == null) continue;
      final s = raw.trim();
      final m = re.firstMatch(s);
      if (m == null) {
        // ei kelvollinen muoto, ohitetaan hiljaisesti
        continue;
      }
      final y = int.parse(m.group(1)!);
      final mo = int.parse(m.group(2)!);
      final d = int.parse(m.group(3)!);
      try {
        out.add(DateTime(y, mo, d)); // paikallinen päivä, ei UTC-kikkailua
      } catch (_) {
        // ohita mahdoton päivämäärä
      }
    }
    print('parseYMD_toDateList: produced ${out.length} DateTimes');
    return out;
  }
}

List<DateTime>? emptyDateTimeList() {
  List<DateTime> emptyDateTimeList() {
    return <DateTime>[];
  }
}

List<String>? cleanDateStrings(List<String>? rawDates) {
  List<String> cleanDateStrings(List<String> rawDates) {
    if (rawDates == null || rawDates.isEmpty) {
      return [];
    }
    return rawDates.map((date) {
      if (date == null) {
        return '';
      }
      // Poistaa kaiken 'T'-kirjaimen jälkeen
      final cleanDate = date.split('T')[0];
      return cleanDate;
    }).toList();
  }
}

double? avgStrToProgress(dynamic value) {
  double avgToProgress(dynamic value, [double max = 5]) {
    if (value == null) return 0.0;
    final parsed = (value is num)
        ? value.toDouble()
        : double.tryParse(value.toString().replaceAll(',', '.'));
    if (parsed == null) return 0.0;
    final p = parsed / (max == 0 ? 1 : max);
    return p.isFinite ? p.clamp(0.0, 1.0) : 0.0;
  }
}

String? avgStrToLabel(String? averageNumber) {
  String avgStrToLabel(String? s, int decimals) {
    final v = double.tryParse((s ?? '').trim());
    if (v == null) return '—';
    return v.toStringAsFixed(decimals);
  }
}

double? avgStrToProgressDebug(String? value) {
  double avgStrToProgressDebug(String? value) {
    print('DEBUG: Funktio sai arvon: $value');

    // Jos value on tyhjä/null → palautetaan 0.0
    if (value == null || value.trim().isEmpty) {
      print('DEBUG: value oli null/tyhjä → palautetaan 0.0');
      return 0.0;
    }

    try {
      final parsed = double.parse(value);
      print('DEBUG: onnistui parsimaan $parsed');
      return parsed;
    } catch (e) {
      print('DEBUG: virhe parsinnassa: $e → palautetaan 0.0');
      return 0.0;
    }
  }
}

int? getWeekOfYear(DateTime dateTime) {
  int getWeekOfYear(DateTime dateTime) {
    final firstThursday = DateTime(dateTime.year, 1, 4);
    final daysOffset = firstThursday.weekday - DateTime.monday;
    final firstMonday = firstThursday.subtract(Duration(days: daysOffset));
    final diff = dateTime.difference(firstMonday).inDays;
    return (diff ~/ 7) + 1;
  }
}

String? nlistToJsonString(List<String>? summaryList) {
  String nListToJsonString(List<String>? summaryList) {
    if (summaryList == null) {
      return "[]";
    }
    return jsonEncode(summaryList);
  }
}

bool? shouldTriggerRollingSummary(int? messageCount) {
  bool shouldTriggerRollingSummary(int messageCount) {
    if (messageCount == 0) return false;
    return messageCount % 4 == 0;
  }
}

int? resetMessageCount(int? currentCount) {
  int resetMessageCount(int currentCount) {
    return 0;
  }
}

List<MessageStruct>? jsonToChatList(dynamic apiResponse) {
  List<MessageStruct> jsonToChatList(dynamic apiResponse) {
    try {
      dynamic body = apiResponse;

      // Jos tulee string, yritä parse
      if (body is String) {
        try {
          body = jsonDecode(body);
        } catch (_) {}
      }

      // Etsi lista: joko body.messages tai body suoraan lista
      final msgs = (body is Map && body['messages'] is List)
          ? body['messages']
          : (body is List)
              ? body
              : null;

      if (msgs == null) return <MessageStruct>[];

      int? toMillis(dynamic ts) {
        if (ts == null) return null;
        if (ts is int) return ts;
        if (ts is String) return int.tryParse(ts);
        if (ts is Map) {
          final sec = (ts['seconds'] ?? ts['_seconds']);
          final ns = (ts['nanoseconds'] ?? ts['_nanoseconds']) ?? 0;
          if (sec is int) return sec * 1000 + (ns is int ? ns ~/ 1000000 : 0);
        }
        return null;
      }

      String normRole(dynamic r) {
        final s = (r ?? '').toString().trim().toLowerCase();
        return (s == 'user' || s == 'assistant' || s == 'placeholder')
            ? s
            : 'assistant';
      }

      return (msgs as List).map<MessageStruct>((m) {
        final map = (m is Map) ? m : <String, dynamic>{};
        final ms =
            toMillis(map['timestamp']) ?? DateTime.now().millisecondsSinceEpoch;
        final id0 = (map['id'] ?? '').toString();
        return MessageStruct(
          id: id0.isEmpty ? ms.toString() : id0,
          role: normRole(map['role']),
          text: (map['text'] ?? '').toString(),
          timeStamp: DateTime.fromMillisecondsSinceEpoch(ms),
          sessionId: (map['sessionId'] ?? '').toString(),
        );
      }).toList();
    } catch (_) {
      return <MessageStruct>[];
    }
  }
}

DateTime? convertTimestamp(List<dynamic>? timestamp) {
  DateTime convertTimestamp(dynamic timestamp) {
    if (timestamp == null || timestamp['_seconds'] == null) {
      return DateTime.now();
    }
    return DateTime.fromMillisecondsSinceEpoch(timestamp['_seconds'] * 1000);
  }
}

String? normalizeRole(String? raw) {
  String normalizeRole(String? raw) {
    final r = (raw ?? '').trim().toLowerCase();
    if (r == 'assistant') return 'assistant';
    if (r == 'placeholder') return 'placeholder';
    // kaikki muu → user
    return 'user';
  }
}

String? toLowerTrim(String? s) {
  String toLowerTrim(String? s) {
    return (s ?? '').trim().toLowerCase();
  }
}

bool? isAssistant(String? raw) {
  bool isAssistant(String? raw) {
    return (raw ?? '').trim().toLowerCase() == 'assistant';
  }
}

bool? isPlaceholder(String? raw) {
  bool isPlaceholder(String? raw) {
    return (raw ?? '').trim().toLowerCase() == 'placeholder';
  }
}

int? getCurrentYear() {
  int getCurrentYear() {
    return DateTime.now().year;
  }
}

int? getCurrentMonth() {
  int getCurrentMonth() {
    return DateTime.now().month; // 1..12
  }
}

List<dynamic>? getLast12Months() {
  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  List<Map<String, dynamic>> getLast12MonthsAsJson() {
    final now = DateTime.now();
    final List<Map<String, dynamic>> months = [];

    for (int i = 0; i < 12; i++) {
      final date = DateTime(now.year, now.month - i);
      final startDate = DateTime(date.year, date.month, 1);
      final endDate = DateTime(startDate.year, startDate.month + 1, 1);

      final monthName = DateFormat.MMMM('fi').format(startDate);
      final year = startDate.year;

      months.add({
        'label': '${capitalize(monthName)} $year',
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
      });
    }

    return months;
  }
}

List<String>? getLast12MonthsLocalized() {
  List<Map<String, String>> getLast12MonthsLocalized() {
    final now = DateTime.now();
    final months = <Map<String, String>>[];
    final names = [
      'tammikuu',
      'helmikuu',
      'maaliskuu',
      'huhtikuu',
      'toukokuu',
      'kesäkuu',
      'heinäkuu',
      'elokuu',
      'syyskuu',
      'lokakuu',
      'marraskuu',
      'joulukuu'
    ];

    for (int i = 0; i < 12; i++) {
      final date = DateTime(now.year, now.month - i, 1);
      final key =
          '${date.year}-${date.month.toString().padLeft(2, '0')}'; // esim. 2025-09
      final name =
          '${names[date.month - 1]} ${date.year}'; // esim. syyskuu 2025
      months.add({'key': key, 'label': name});
    }

    return months;
  }
}

List<dynamic>? groupTestsByMonth(List<dynamic>? tests) {
  List<Map<String, dynamic>> groupTestsByMonth(
      List<Map<String, dynamic>> tests) {
    final buckets = <String, List<Map<String, dynamic>>>{};

    for (final t in tests) {
      if (t['startDate'] == null) continue;
      final d = DateTime.tryParse(t['startDate'].toString());
      if (d == null) continue;
      final key = '${d.year}-${d.month.toString().padLeft(2, '0')}';
      (buckets[key] ??= []).add(t);
    }

    final monthNames = [
      'tammikuu',
      'helmikuu',
      'maaliskuu',
      'huhtikuu',
      'toukokuu',
      'kesäkuu',
      'heinäkuu',
      'elokuu',
      'syyskuu',
      'lokakuu',
      'marraskuu',
      'joulukuu'
    ];

    final now = DateTime.now();
    final result = <Map<String, dynamic>>[];

    for (int i = 0; i < 12; i++) {
      final d = DateTime(now.year, now.month - i, 1);
      final key = '${d.year}-${d.month.toString().padLeft(2, '0')}';
      result.add({
        'label': '${monthNames[d.month - 1]} ${d.year}',
        'key': key,
        'tests': buckets[key] ?? <Map<String, dynamic>>[],
      });
    }

    return result;
  }
}

bool? isItemType(
  List<dynamic>? item,
  String? expectedType,
) {
  bool isItemType(
    Map<String, dynamic> item,
    String expectedType,
  ) {
    if (item == null) return false;
    final typeValue = item['type'];
    if (typeValue == null) return false;
    return typeValue.toString() == expectedType;
  }
}

List<dynamic> safeListFromJson(dynamic data) {
  if (data == null) return [];
  if (data is List) return data;
  try {
    return List<dynamic>.from(data);
  } catch (_) {
    return [];
  }
}

List<dynamic>? processAndFilterSessions(List<dynamic>? sessionsList) {
// Funktion koodi
  List<Map<String, dynamic>> processAndFilterSessions(
      List<Map<String, dynamic>> sessionsList) {
    // Varmistetaan, että syötetty sessionsList ei ole null
    if (sessionsList == null) {
      print("Received null sessionsList, returning empty list.");
      return [];
    }

    // Suodatetaan lista: varmistetaan, että jokainen alkio on Map ja sisältää 'title'-avaimen
    print("Filtering sessionsList with ${sessionsList.length} items.");
    return sessionsList
        .where((item) {
          return item is Map<String, dynamic> && item.containsKey('title');
        })
        .map((item) => item as Map<String,
            dynamic>) // Muunnetaan validit alkiot Map-tyyppisiksi
        .toList();
  }
}

List<dynamic>? passSessionsThrough(List<dynamic>? sessionsList) {
  List<dynamic> passSessionsThrough(List<dynamic>? sessionsList) {
    if (sessionsList == null) {
      print("NULL list");
      return [];
    }
    print("List length: ${sessionsList.length}");
    return sessionsList;
  }
}

bool? hasSessions(List<dynamic>? sessions) {
  bool hasSessions(List<dynamic>? sessions) {
    return sessions != null && sessions.isNotEmpty;
  }
}

List<dynamic>? extractSessionsFromJSON(dynamic data) {
  List<dynamic> extractSessionFromJson(dynamic data) {
    if (data == null || data.toString().trim() == '') {
      return [
        {
          "id": "dummy",
          "title": "Tervetuloa!",
          "message": "Aloita keskustelu valitsemalla oikeasta yläkulmasta +",
          "timestamp": DateTime.now().toIso8601String(),
        }
      ];
    }

    if (data is List) return data;

    try {
      return List<dynamic>.from(data);
    } catch (_) {
      return [
        {
          "id": "dummy",
          "title": "Tervetuloa!",
          "message": "Aloita keskustelu valitsemalla oikeasta yläkulmasta +",
          "timestamp": DateTime.now().toIso8601String(),
        }
      ];
    }
  }
}

dynamic wrapSessions(List<dynamic>? data) {
  Map<String, dynamic> wrapSessions(dynamic data) {
    if (data == null || data.toString().trim() == '') {
      return {"sessions": []}; // aina vähintään tyhjä lista
    }

    if (data is List) {
      return {"sessions": data};
    }

    try {
      return {"sessions": List<dynamic>.from(data)};
    } catch (_) {
      return {"sessions": []};
    }
  }
}

List<String>? safeListString(List<String>? input) {
  List<String> safeListString(List<String>? input) {
    return input ?? <String>[];
  }
}

List<dynamic>? safeListDynamic(List<dynamic>? input) {
  List<dynamic>? safeListDynamic(List<dynamic>? input) {
    return input ?? <dynamic>[];
  }
}

List<String>? emptyStringList() {
  List<String> emptyStringList() {
    return <String>[];
  }
}

List<dynamic>? emptyJsonObject() {
// Tyhjä JSON-objekti
  Map<String, dynamic> emptyJsonObject() {
    return <String, dynamic>{};
  }
}

double? forceDouble(dynamic input) {
  double forceDouble(dynamic input) {
    if (input == null) return 0.0;
    if (input is double) return input;
    if (input is int) return input.toDouble();
    if (input is String) {
      final parsed = double.tryParse(input);
      return parsed ?? 0.0;
    }
    return 0.0;
  }
}

String? returnEmptyString() {
  String returnEmptyString(String? input) {
    if (input == null) {
      return '';
    }
    return input;
  }
}

double? returnZero() {
  double returnZero() {
    return 0.0;
  }
}

String? getRandomQuote() {
  String getRandomQuote() {
    final quotes = [
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

    quotes.shuffle();
    return quotes.first;
  }
}

double? asDoubleSafe(dynamic value) {
  double asDoubleSafe(dynamic value) {
    if (value == null) return 0.0;
    return (value as num).toDouble();
  }
}

String? safeDocId(dynamic message) {
  String safeDocId(dynamic message) {
    try {
      if (message is Map && message.containsKey('docId')) {
        return message['docId']?.toString() ?? '';
      }
      return '';
    } catch (e) {
      return '';
    }
  }
}

bool? safeBool(String value) {
  bool safeCompleted(dynamic value) {
    try {
      if (value == null) return false;
      if (value is bool) return value;
      if (value is String) return value.toLowerCase() == 'true';
      if (value is num) return value != 0;
    } catch (_) {
      return false;
    }
    return false;
  }
}

bool? isIdSaved(
  String? currentId,
  List<String>? savedIdList,
) {
  bool isIdSaved(String? currentId, List<String>? savedIdList) {
    // Jos jokin argumentti puuttuu, palauta false.
    if (currentId == null || savedIdList == null || savedIdList.isEmpty) {
      return false;
    }

    // Tässä tapahtuu varsinainen tarkistus.
    // Käytetään 'contains'-metodia tarkistamaan, onko ID listalla.
    return savedIdList.contains(currentId);
  }
}

String? getUserTimezoneOffset() {
  String getUserTimezoneOffset() {
    return (DateTime.now().timeZoneOffset.inMinutes * -1).toString();
  }
}

double? divideByFive() {
  double divideByFive(dynamic value) {
    if (value == null) return 0.0;
    if (value is int) return value.toDouble() / 5.0;
    if (value is double) return value / 5.0;
    return 0.0;
  }
}

double? asDoubleSafeNew() {
  double asDoubleSafeNew(dynamic value, {bool scaleTo01 = true}) {
    if (value == null) return 0.0;

    num? n;
    if (value is num) {
      n = value;
    } else if (value is String) {
      n = num.tryParse(value.replaceAll(',', '.'));
    } else if (value is List && value.isNotEmpty) {
      return asDoubleSafeNew(value.first,
          scaleTo01: scaleTo01); // 🔥 tämä oli virheellinen ennen
    }
    if (n == null) return 0.0;

    double v = n.toDouble();

    if (scaleTo01) {
      if (v > 1.0 && v <= 5.0)
        v = v / 5.0;
      else if (v > 5.0 && v <= 100.0) v = v / 100.0;
      if (v.isNaN || v.isInfinite) return 0.0;
      if (v < 0.0) v = 0.0;
      if (v > 1.0) v = 1.0;
    }

    return v;
  }
}

/// The image picked by user (from Gallery/Camera)
String? convertImageToBase64(FFUploadedFile? imageBytes) {
  String convertImageToBase64(FFUploadedFile? imageFile) {
    if (imageFile == null || imageFile.bytes == null) {
      return '';
    }

    try {
      final base64String = base64Encode(imageFile.bytes!);
      return base64String;
    } catch (e) {
      return '';
    }
  }
}

String? formatLocalTime(String? isoString) {
  String formatLocalTime(String isoString) {
    final date = DateTime.parse(isoString).toLocal();
    return DateFormat('dd.MM.yyyy HH:mm').format(date);
  }
}

String? formatTime(
  String? timestampString,
  String? locale,
) {
  String formatTime({
    required String timestampString,
    String locale = 'fi',
    String fallbackText = 'Aikaa ei voitu muotoilla',
  }) {
    // Tarkista, onko syöte tyhjä, null-string tai muuten virheellinen.
    if (timestampString.isEmpty ||
        timestampString == 'null' ||
        timestampString.toLowerCase() == 'data') {
      return fallbackText;
    }

    try {
      // 1. Parsitaan ISO 8601 -aikaleima (esim. "2025-10-18T09:59:00.000Z")
      // Tämä onnistuu nyt, koska Cloud Function palauttaa sen stringinä.
      final DateTime utcTime = DateTime.parse(timestampString);

      // 2. Muunnetaan paikalliseen aikaan (laitekohtainen aikavyöhyke)
      final DateTime localTime = utcTime.toLocal();

      // 3. Muotoillaan: Esim. "18.10.2025 12:33"
      // Voit muuttaa muotoilua täällä haluamaksesi.
      final formatter = DateFormat('dd.MM.yyyy HH:mm', locale);
      final formattedTime = formatter.format(localTime);

      return formattedTime;
    } catch (e) {
      // 4. Jos parsimisessa tapahtuu virhe, palautetaan virheilmoitus diagnostiikkaa varten.
      print('Error parsing timestamp: $timestampString. Error: $e');
      return fallbackText;
    }
  }
}

String? formatIsoDateLocalized(
  String? isoString,
  String? languageCode,
) {
  String formatIsoDateLocalized(String isoString, String languageCode) {
    if (isoString.isEmpty) return '';

    try {
      final date = DateTime.parse(isoString).toLocal();

      // Päivämäärän perusmuoto
      String formattedDate = '';
      if (languageCode == 'fi') {
        formattedDate = '${date.day}.${date.month}.${date.year}';
      } else {
        // oletuksena englanti
        final monthNames = [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec'
        ];
        final monthName = monthNames[date.month - 1];
        formattedDate = '$monthName ${date.day}, ${date.year}';
      }

      // aamu / iltapäivä tunniste
      final hour = date.hour;
      final minute = date.minute.toString().padLeft(2, '0');
      final isAm = hour < 12;
      final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);

      String ampm = isAm ? 'AM' : 'PM';
      if (languageCode == 'fi') {
        ampm = isAm ? 'ap' : 'ip'; // aamu- / iltapäivä
      }

      final formattedTime = '$displayHour:$minute $ampm';

      return '$formattedDate $formattedTime';
    } catch (e) {
      return isoString; // fallback, jos muunto epäonnistuu
    }
  }
}

dynamic findProgramByItem(
  List<dynamic>? programs,
  String? itemId,
) {
// HUOM: Muutettu parametrin nimi 'item' -> 'itemId' ja tyyppi String
  dynamic findProgramByItem(List<dynamic> programs, String itemId) {
    if (programs.isEmpty || itemId == null) return {};

    // Final id haetaan suoraan stringinä, ei objektin sisältä
    final id = itemId; // EI enää item['id']

    if (id == null) return {};

    for (final p in programs) {
      // Tästä eteenpäin logiikka on sama
      if (p['id'] == id) {
        final contentList = p['content'] as List<String>?;
        if (contentList != null) {
          p['content_text'] = contentList.join('\n\n');
        }
        return p;
      }
    }
    return {};
  }
}

List<String>? jsonToListString(dynamic jsonContent) {
  List<String> jsonToListString(dynamic jsonContent) {
    // Tarkistaa, onko annettu sisältö olemassa ja onko se lista.
    // Vaikka FlutterFlow tunnistaa sen JSON-tyyppinä, Dart käsittelee sen dynamic-tyyppinä.
    if (jsonContent != null && jsonContent is List) {
      // TÄMÄ RIVI on avain: Muuntaa jokaisen listan alkion nimenomaisesti Stringiksi.
      // Tämä ratkaisee "Return type mismatch" -virheen pakottamalla tyypin.
      return jsonContent.map((e) => e.toString()).toList();
    }

    // Jos data ei ole lista, on null tai tyhjä, palautetaan tyhjä lista.
    return [];
  }
}
