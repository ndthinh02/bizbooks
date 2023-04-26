import 'package:flutter/material.dart';

class CustomText {
  static TextStyle title(double size, Color color) {
    return TextStyle(
        fontFamily: 'SVNGilroy',
        fontSize: size,
        color: color,
        letterSpacing: 0.75,
        height: 1.3,
        fontWeight: FontWeight.w800);
  }

  static TextStyle subText(double size, Color color) {
    return TextStyle(
        fontFamily: 'SVNGilroy',
        fontSize: size,
        color: color,
        letterSpacing: 0.75,
        fontWeight: FontWeight.w400);
  }

  static TextStyle styleTextError(double size, Color color) {
    return TextStyle(
        fontFamily: 'SVNGilroy',
        fontSize: size,
        color: color,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w400);
  }

  static TextStyle textMedium(double size, Color color) {
    return TextStyle(
        fontFamily: 'SVNGilroy',
        fontSize: size,
        color: color,
        letterSpacing: 0.75,
        fontWeight: FontWeight.w600);
  }

  static TextStyle subTextLigth(double size, Color color) {
    return TextStyle(
        fontFamily: 'SVNGilroy',
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w500);
  }
}
