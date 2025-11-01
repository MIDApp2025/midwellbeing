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

class TextNoteInputField extends StatefulWidget {
  const TextNoteInputField({
    Key? key,
    required this.width,
    required this.height,
    required this.initialValue,
    required this.onValueChanged,
    this.onSavePressed,
    this.onBackPressed,
  }) : super(key: key);

  final double width;
  final double height;
  final String initialValue;
  final Future Function(String? newValue) onValueChanged;
  final Future Function()? onSavePressed;
  final Future Function()? onBackPressed;

  @override
  _TextNoteInputFieldState createState() => _TextNoteInputFieldState();
}

class _TextNoteInputFieldState extends State<TextNoteInputField> {
  late TextEditingController _controller;
  bool _showSaveButton = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final hasChanged = _controller.text != widget.initialValue;
    if (_showSaveButton != hasChanged) {
      setState(() {
        _showSaveButton = hasChanged;
      });
    }
    widget.onValueChanged(_controller.text);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFinnish = Localizations.localeOf(context).languageCode == 'fi';
    final saveLabel = isFinnish ? 'Valmis' : 'Ready';
    final backLabel = isFinnish ? 'Takaisin' : 'Back';

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? const Color(0xFF222831) : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final dividerColor =
        isDarkMode ? const Color(0x3094B5D8) : Colors.grey.withOpacity(0.2);

    return Container(
      width: widget.width,
      height: widget.height,
      color: backgroundColor,
      child: Column(
        children: [
          // 📌 Kiinteä yläpalkki (ei skrollaa)
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border(
                bottom: BorderSide(
                  color: dividerColor,
                  width: 1,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Takaisin
                TextButton(
                  onPressed: widget.onBackPressed,
                  child: Text(
                    backLabel,
                    style: TextStyle(
                      color: textColor.withOpacity(0.9),
                      fontSize: 16,
                    ),
                  ),
                ),
                // Valmis / Ready näkyy vain jos teksti muuttunut
                if (_showSaveButton)
                  TextButton(
                    onPressed: widget.onSavePressed,
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF94B5D8),
                    ),
                    child: Text(
                      saveLabel,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // 📝 Skrollattava tekstialue
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controller,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    height: 1.4,
                  ),
                  decoration: InputDecoration(
                    hintText: isFinnish
                        ? 'Kirjoita muistiinpano...'
                        : 'Write a note...',
                    hintStyle: TextStyle(
                      color: textColor.withOpacity(0.5),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
