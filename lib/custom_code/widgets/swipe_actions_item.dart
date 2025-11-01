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

import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SwipeActionsItem extends StatefulWidget {
  final String title;
  final Future<void> Function()? onDelete; // 🔹 backend API
  final double? width;
  final double? height;

  const SwipeActionsItem({
    super.key,
    required this.title,
    this.onDelete,
    this.width,
    this.height,
  });

  @override
  State<SwipeActionsItem> createState() => _SwipeActionsItemState();
}

class _SwipeActionsItemState extends State<SwipeActionsItem> {
  double _offset = 0.0;
  final double _actionWidth = 80.0;
  bool _isDeleting = false;
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor =
        isDark ? const Color(0xFF2A2D31) : const Color(0xFFE7E7E7);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _offset = (_offset - details.primaryDelta!).clamp(0.0, _actionWidth);
        });
      },
      onHorizontalDragEnd: (_) {
        setState(() {
          _offset = _offset < _actionWidth / 2 ? 0.0 : _actionWidth;
        });
      },
      child: Stack(
        children: [
          // 🔹 punainen tausta ja roskiskuvake
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                alignment: Alignment.centerRight,
                color: Colors.redAccent,
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  onPressed: () async {
                    if (_isDeleting) return;
                    setState(() => _isDeleting = true);

                    try {
                      // 🔹 1. Poistetaan Firebasesta
                      if (widget.onDelete != null) {
                        await widget.onDelete!();
                      }

                      // 🔹 2. Tyhjennetään AppState, jotta näkymä päivittyy
                      FFAppState().update(() {
                        FFAppState().chat = [];
                        FFAppState().activeSessionIdApp = ''; // 🧠 nollaa aktiivinen keskustelu
                      });

                      // 🔹 3. Tyhjennetään mahdollinen paikallinen tila
                      safeSetState(() {
                        // Tämä varmistaa, että chat-näkymä tyhjenee heti
                      });

                      // 🔹 4. Pieni viive synkronointiin
                      await Future.delayed(const Duration(milliseconds: 250));

                      // 🔹 5. Piilotetaan itse laatikko (animaatio)
                      if (mounted) setState(() => _isVisible = false);

                    } catch (e) {
                      debugPrint("Error during delete: $e");
                    } finally {
                      if (mounted) {
                        setState(() => _isDeleting = false);
                      }
                    }
                  },
                ),
              ),
            ),
          ),

          // 🔹 kortin sisältö
          Transform.translate(
            offset: Offset(-_offset, 0),
            child: Container(
              width: widget.width ?? double.infinity,
              height: widget.height ?? 57,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                maxLines: 1,
                softWrap: false,
                overflow: TextOverflow.ellipsis, // 🔹 katkaisee ilman "..."
                style: TextStyle(
                  fontSize: 15,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
