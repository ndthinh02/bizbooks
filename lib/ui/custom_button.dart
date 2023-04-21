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
  String? assetImage;
  CustomButton(
      {super.key,
      required this.function,
      required this.title,
      required this.colorButton,
      required this.radius,
      required this.sizeText,
      required this.colorText,
      required this.colorBorderSide,
      this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Center(
        child: SizedBox(
          width: 303,
          height: 56,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 1, color: colorBorderSide),
                  backgroundColor: colorButton,
                  shape: RoundedRectangleBorder(borderRadius: radius)),
              onPressed: () {
                function();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    assetImage!,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  InkWell(
                    child: Text(
                      title,
                      style: CustomText.title(sizeText, colorText),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
