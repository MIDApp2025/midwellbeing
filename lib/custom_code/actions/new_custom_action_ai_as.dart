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

Future<List<dynamic>> newCustomActionAiAs(String documentId) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    DocumentSnapshot snapshot = await firestore
        .collection('confidenceTestQuestions')
        .doc(documentId)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      List<dynamic> messages = [];

      // Intro message (in English)
      messages.add({
        'role': 'assistant',
        'content':
            'Hello! Great to see that you have chosen the Confidence Test. Let’s get started! You will receive 10 questions, and you can answer on a scale of 1 to 5. (1 = strongly disagree, 5 = strongly agree). Here comes the first question:',
        'timestamp': DateTime.now().toIso8601String(),
      });

      // Add questions (question0 .. question10)
      for (int i = 0; i <= 10; i++) {
        String key = 'question$i';
        if (data.containsKey(key)) {
          messages.add({
            'role': 'assistant',
            'content': data[key],
            'timestamp': DateTime.now().toIso8601String(),
          });
        }
      }

      return messages;
    } else {
      print('Document not found');
      return [];
    }
  } catch (e) {
    print('Error fetching document: $e');
    return [];
  }
}
