// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ExerciseCard extends StatelessWidget {
  final String emoji;

  // Custom Widget ottaa vastaan MOLEMMAT kieliversiot.
  // Huomaa: title ja text eivät ole enää käytössä, koska ne eivät ole APIssa.
  final String titleFi;
  final String titleEn;
  final String textFi;
  final String textEn;

  // CALLBACK: Ottaa vastaan VAIN ID:n, joka voi olla null
  final Future<dynamic> Function(String? itemId)? onCardTapped;

  final String? id; // ID on valinnainen
  final double width;
  final double height;
  final int currentIndex;
  final int visibleDots;

  // UUSI: Custom Widget tarvitsee tiedon koodista näyttääkseen oikean tekstin.
  final String? currentLanguageCode;

  const ExerciseCard({
    Key? key,
    // Pakolliset syötteet:
    required this.emoji,

    // Nämä KAIKKI ovat nyt vaadittuja, jotta sivu B:n API-data voidaan välittää
    required this.titleFi,
    required this.titleEn,
    required this.textFi,
    required this.textEn,
    required this.width,
    required this.height,
    required this.currentIndex,
    required this.visibleDots,

    // Valinnaiset parametrit:
    this.currentLanguageCode, // Kielen koodi, jota käytetään kääntämiseen
    this.id, // Valinnainen, tarvitaan vain klikattavalla sivulla
    this.onCardTapped, // Valinnainen, tarvitaan vain klikattavalla sivulla
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Valitsee tekstin koodin perusteella
    final String displayTitle = currentLanguageCode == 'fi' ? titleFi : titleEn;
    final String displayText = currentLanguageCode == 'fi' ? textFi : textEn;

    final cardWidth =
        width > 0 ? width : MediaQuery.of(context).size.width * 0.9;
    final cardHeight =
        height > 0 ? height : MediaQuery.of(context).size.height * 0.42;

    return GestureDetector(
      onTap: () {
        if (onCardTapped != null && id != null) {
          onCardTapped!(id);
        }
      },
      child: Container(
        width: cardWidth,
        height: cardHeight,
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E2A38) : Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji.isNotEmpty ? emoji : "🌿",
                style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 14),
            Text(
              // Käytetään nyt displayTitle-muuttujaa
              displayTitle,
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color:
                    isDark ? const Color(0xFFCEE3F6) : const Color(0xFF333333),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              // Käytetään nyt displayText-muuttujaa
              displayText,
              style: TextStyle(
                fontSize: 15,
                color:
                    isDark ? const Color(0xFF94B5D8) : const Color(0xFF777777),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
