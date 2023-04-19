import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String assetImage;

  const CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.assetImage,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    );
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: colorBackgroundTextFiled,
                hintText: hintText,
                hintStyle: CustomText.title(15, Colors.grey),
                border: outlineInputBorder),
          )
        ],
      ),
    );
  }
}
