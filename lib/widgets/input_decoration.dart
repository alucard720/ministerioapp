import 'package:flutter/material.dart';

class Inputdecorations {
  static InputDecoration inputDecoration({
    required String hintext,
    required String labeltext,
    required Icon icon,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent),
      ),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2)),
      hintText: hintext,
      labelText: labeltext,
      prefixIcon: icon,
    );
  }
}
