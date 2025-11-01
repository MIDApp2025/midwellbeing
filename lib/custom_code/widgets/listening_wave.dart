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

import 'dart:async';
import 'dart:math';

class ListeningWave extends StatefulWidget {
  final bool isListening;
  final double height;
  final double width;

  const ListeningWave({
    super.key,
    required this.isListening,
    this.height = 32,
    this.width = 64,
  });

  @override
  State<ListeningWave> createState() => _ListeningWaveState();
}

class _ListeningWaveState extends State<ListeningWave> {
  final Random _rand = Random();
  late List<double> _bars;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _bars = List.generate(8, (_) => _rand.nextDouble());
    if (widget.isListening) _startAnimation();
  }

  @override
  void didUpdateWidget(ListeningWave oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isListening && !oldWidget.isListening) {
      _startAnimation();
    } else if (!widget.isListening && oldWidget.isListening) {
      _stopAnimation();
    }
  }

  void _startAnimation() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 120), (_) {
      if (!mounted) return;
      setState(() {
        _bars = List.generate(8, (_) => _rand.nextDouble());
      });
    });
  }

  void _stopAnimation() {
    _timer?.cancel();
    setState(() {
      _bars = List.filled(8, 0.1);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark
        ? const Color(0xCC94B5D8) // tummempi sävy (#CC94B5D8)
        : const Color(0xFF94B5D8); // pääväri

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _bars.map((value) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 3.2, // ohuempi pylväs
            height: widget.height * (0.2 + 0.8 * value),
            decoration: BoxDecoration(
              color: color.withOpacity(widget.isListening ? 0.95 : 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
