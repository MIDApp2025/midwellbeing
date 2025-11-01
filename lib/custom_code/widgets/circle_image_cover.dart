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

class CircleImageCover extends StatelessWidget {
  final String? imageUrl;
  final double? size;
  final double? width;
  final double? height;

  const CircleImageCover({
    Key? key,
    this.imageUrl,
    this.size,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = size ?? width ?? 100.0;
    final h = size ?? height ?? 100.0;

    // Jos kuva puuttuu tai on tyhjä
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return ClipOval(
      // 🔑 Tämä pakottaa Flutterin piirtämään koko widgetin uudelleen,
      // aina kun imageUrl muuttuu (esim. kun se tyhjennetään Delete-napin jälkeen).
      key: ValueKey(imageUrl ?? "no_image"),
      child: hasImage
          ? Image.network(
              imageUrl!,
              width: w,
              height: h,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  _buildPlaceholder(w, h),
            )
          : _buildPlaceholder(w, h),
    );
  }

  Widget _buildPlaceholder(double w, double h) {
    return Container(
      width: w,
      height: h,
      color: Colors.grey.shade300,
      child: Icon(
        Icons.person,
        size: w * 0.6,
        color: Colors.grey.shade600,
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
