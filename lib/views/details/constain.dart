import 'package:flutter/material.dart';

import '../../ui/color.dart';
import '../../ui/custom_text.dart';

var boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    gradient: const LinearGradient(
        stops: [0, 0.5], colors: [colorGradientBlue, colorGradientPink]));
const edgeInsets = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
var width2 = 327.0;
double widthButton = 121;
double heightButton = 40;
Function? function;
ElevatedButton styleElevatedButton(String title) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: colorTextRegister),
              borderRadius: BorderRadius.circular(24))),
      onPressed: () {},
      child: Text(
        title,
        style: CustomText.title(15, colorTextRegister),
      ));
}

ElevatedButton elevatedButtonIcon(String title, Color clor) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
        backgroundColor: clor,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: clor),
            borderRadius: BorderRadius.circular(24))),
    onPressed: () {},
    icon: const Icon(Icons.play_circle_fill_outlined),
    label: Text(
      title,
      style: CustomText.title(15, Colors.white),
    ),
  );
}

Container container(
    Widget icon,
    String title,
    String textElevatedButton,
    textElevatedButtonIcon,
    double width,
    height,
    heightContainer,
    bool checkIsButton,
    String titleText) {
  return Container(
      width: width2,
      height: heightContainer,
      margin: edgeInsets,
      decoration: boxDecoration,
      child: Container(
        margin: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                icon,
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 240,
                  child: Text(
                    title,
                    maxLines: 3,
                    style: CustomText.title(15, Colors.black),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                checkIsButton == true
                    ? SizedBox(
                        width: widthButton,
                        height: heightButton,
                        child: styleElevatedButton(textElevatedButton),
                      )
                    : Text(
                        titleText,
                        style: CustomText.title(15, colorSuccessDark),
                      ),
                SizedBox(
                  width: width,
                  height: height,
                  child:
                      elevatedButtonIcon(textElevatedButtonIcon, colorButton),
                )
              ],
            )
          ],
        ),
      ));
}
