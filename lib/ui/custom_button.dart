import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_flutter/ui/custom_text.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final String title;
  final Color colorButton;
  final Color colorBorderSide;
  final BorderRadius radius;
  final double sizeText;
  final Color colorText;
  final String icon;

  const CustomButton({
    super.key,
    required this.icon,
    required this.function,
    required this.title,
    required this.colorButton,
    required this.radius,
    required this.sizeText,
    required this.colorText,
    required this.colorBorderSide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 1, color: colorBorderSide),
                backgroundColor: colorButton,
                shape: RoundedRectangleBorder(borderRadius: radius)),
            onPressed: () {
              function();
            },
            icon: Container(child: SvgPicture.asset(icon)),
            label: Text(
              title,
              style: CustomText.title(sizeText, colorText),
            ),
          ),
        ),
      ),
    );
  }
}
