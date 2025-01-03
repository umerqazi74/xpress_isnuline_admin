import 'package:flutter/material.dart';

// Define a TextStyle extension on String
extension TextStyleExtension on String {
  // Bold heading with font size 20 and font family "Lora"
  Text boldHeading() {
    return Text(
      this,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Colors.black,
        fontFamily: 'Inter', 
      ),
    );
  }

  // Black color text style
  Text blackColor() {
    return Text(
      this,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: "Inter"
      ),
    );
  }
    Text greyColor() {
    return Text(
      this,
      style: const TextStyle(
        color: Color(0xff595959),
        fontFamily: "Inter"
      ),
    );
  }

  // White color text style
  Text whiteColor() {
    return Text(
      this,
      style: const TextStyle(
        fontFamily: "Poopins",
        color: Colors.white,
      ),
    );
  }
}