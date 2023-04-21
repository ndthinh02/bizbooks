import 'package:flutter/material.dart';

class CustomText {
  static TextStyle title(double size, Color color) {
    return TextStyle(fontFamily: 'SVNGilroy', fontSize: size, color: color);
  }

  static TextStyle subText(double size, Color color) {
    return TextStyle(
        fontFamily: 'SVNGilroy-Light',
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w700);
  }

  static TextStyle subTextLigth(double size, Color color) {
    return TextStyle(
        fontFamily: 'SVNGilroy-Light',
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400);
  }
}
