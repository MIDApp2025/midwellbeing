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

import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:m_i_d_kysymykset_toimii/app_state.dart';
import 'package:uuid/uuid.dart';

stt.SpeechToText _speech = stt.SpeechToText();
final _uuid = Uuid();

/// 🎙️ Aloita reaaliaikainen puheentunnistus
Future<String> startListeningAction(String languageCode) async {
  final correctLocaleId = languageCode.replaceAll('-', '_');

  // Luo uusi session ID jos puhe aloitetaan tyhjältä chatilta
  if (FFAppState().activeSessionIdApp.isEmpty) {
    final newSessionId = _uuid.v4();
    FFAppState().update(() {
      FFAppState().activeSessionIdApp = newSessionId;
    });
    print('🆕 Luotiin uusi mikrofoni-session ID: $newSessionId');
  }

  if (await _speech.initialize()) {
    FFAppState().update(() {
      FFAppState().isListening = true;
    });

    await _speech.listen(
      localeId: correctLocaleId,
      listenMode: stt.ListenMode.dictation,
      partialResults: true,
      onResult: (result) {
        final newText = result.recognizedWords.trim();
        if (newText.isEmpty) return;

        // 🔁 Päivitä teksti ja triggeröi UI:n päivitys
        FFAppState().update(() {
          FFAppState().micText = newText;
          FFAppState().micUpdated = !FFAppState().micUpdated;
        });

        print('🎤 Live text: ${FFAppState().micText}');
      },
    );
  } else {
    print('❌ Speech recognition initialization failed');
  }

  return '';
}

/// 🔇 Lopeta kuuntelu
Future<String> stopListeningAction() async {
  await _speech.stop();
  FFAppState().update(() {
    FFAppState().isListening = false;
  });

  print('✅ Puhe lopetettu. Lopullinen teksti: ${FFAppState().micText}');
  return FFAppState().micText;
}






