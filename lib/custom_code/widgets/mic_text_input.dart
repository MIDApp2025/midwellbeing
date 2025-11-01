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

import 'package:speech_to_text/speech_to_text.dart' as stt;

class MicTextInput extends StatefulWidget {
  final String? hintText;
  final Function(String)? onSend; // callback kun painetaan send
  final Color? micColor;

  const MicTextInput({
    Key? key,
    this.hintText,
    this.onSend,
    this.micColor,
  }) : super(key: key);

  @override
  State<MicTextInput> createState() => _MicTextInputState();
}

class _MicTextInputState extends State<MicTextInput> {
  final TextEditingController _controller = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  Future<void> _toggleListening() async {
    if (_isListening) {
      await _speech.stop();
      setState(() => _isListening = false);
    } else {
      bool available = await _speech.initialize(
        onStatus: (status) => debugPrint('Speech status: $status'),
        onError: (error) => debugPrint('Speech error: $error'),
      );

      if (available) {
        setState(() => _isListening = true);
        await _speech.listen(
          localeId: 'fi_FI', // voit halutessasi vaihtaa 'en_US'
          partialResults: true,
          onResult: (result) {
            setState(() {
              _controller.text = result.recognizedWords;
              _controller.selection = TextSelection.fromPosition(
                TextPosition(offset: _controller.text.length),
              );
            });
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: widget.hintText ?? 'Type or speak...',
              border: const OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: Icon(
            _isListening ? Icons.mic : Icons.mic_none,
            color: _isListening ? (widget.micColor ?? Colors.red) : Colors.grey,
          ),
          onPressed: _toggleListening,
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            if (widget.onSend != null) {
              widget.onSend!(_controller.text);
            }
            _controller.clear();
          },
        ),
      ],
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
