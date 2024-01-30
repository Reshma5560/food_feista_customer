import 'package:flutter/material.dart';

class BoxShadows {
  List<BoxShadow> shadow() {
    return [
      BoxShadow(
        offset: Offset.zero,
        color: Colors.grey.shade400,
        blurStyle: BlurStyle.outer,
        blurRadius: 5,
      ),
    ];
  }
}