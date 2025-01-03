import 'package:flutter/material.dart';


extension SizedBoxExtension on num {
  // Create a SizedBox with a specific width
  SizedBox widthBox() {
    return SizedBox(width: toDouble());
  }

  // Create a SizedBox with a specific height
  SizedBox heightBox() {
    return SizedBox(height: toDouble());
  }

  // Create a SizedBox with both width and height
  SizedBox box() {
    return SizedBox(
      width: toDouble(),
      height: toDouble(),
    );
  }
}