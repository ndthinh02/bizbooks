import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../ui/color.dart';
import '../ui/custom_button.dart';
import '../ui/custom_text.dart';

class CustomBottomSheet {
  static void showBottom(
      BuildContext context, String title1, title2, subTitle, email) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return SizedBox(
              width: 375,
              height: 430,
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    title1,
                    style: CustomText.title(28, Colors.black),
                  ),
                  Text(
                    title2,
                    style: CustomText.title(28, Colors.black),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SvgPicture.asset("images/icon_check.svg"),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    email,
                    style: CustomText.subText(17, Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    subTitle,
                    style: CustomText.subText(17, Colors.black),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    "thinhpro123",
                    style: CustomText.subText(17, colorButton),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    colorBorderSide: colorButton,
                    function: () => Navigator.of(context).pop(),
                    title: 'Xác nhận',
                    colorButton: colorButton,
                    radius: 40,
                    sizeText: 17,
                    colorText: Colors.white,
                    icon: const SizedBox(),
                    marginHorizontal: 50,
                    marginVertical: 8,
                    isCheckHaveIcon: false,
                  )
                ],
              ));
        });
  }
}
