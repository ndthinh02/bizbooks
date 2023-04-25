import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/custom_text.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final String title;
  final Color colorButton;
  final Color colorBorderSide;
  final double radius, marginVertical, marginHorizontal;
  final double sizeText;
  final Color colorText;
  final Widget icon;
  final bool isCheckHaveIcon;

  const CustomButton(
      {super.key,
      required this.isCheckHaveIcon,
      required this.icon,
      required this.function,
      required this.title,
      required this.colorButton,
      required this.radius,
      required this.sizeText,
      required this.colorText,
      required this.colorBorderSide,
      required this.marginHorizontal,
      required this.marginVertical});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal, vertical: marginVertical),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                side: BorderSide(width: 1, color: colorBorderSide),
                backgroundColor: colorButton,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius))),
            onPressed: () {
              function();
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: isCheckHaveIcon == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          icon,
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: CustomText.title(sizeText, colorText),
                          )
                        ],
                      )
                    : Text(
                        title,
                        textAlign: TextAlign.center,
                        style: CustomText.title(sizeText, colorText),
                      )),
          ),
        ),
      ),
    );
  }
}
