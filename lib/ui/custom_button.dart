import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_flutter/ui/custom_text.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final String title;
  final Color colorButton;
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
      this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 303,
        height: 56,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: colorButton,
                shape: RoundedRectangleBorder(borderRadius: radius)),
            onPressed: () {
              function;
            },
            child: Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
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
                    textAlign: TextAlign.center,
                    style: CustomText.title(sizeText, colorText),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
