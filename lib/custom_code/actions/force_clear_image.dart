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

Future forceClearImage() async {
  Future<void> action(BuildContext context) async {
    try {
      // Etsi nykyinen StatefulWidget (eli se sivu)
      final state = context as dynamic;

      // Jos sivulla on setState (yleensä on), tämä pakottaa rebuildin heti
      if (state.mounted && state.setState != null) {
        state.setState(() {});
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {});
      }

      debugPrint('✅ ForceClearImage executed successfully');
    } catch (e) {
      debugPrint('❌ ForceClearImage error: $e');
    }
  }
}
