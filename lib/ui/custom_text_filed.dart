import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool showPass;
  final String textValidate;

  const CustomTextFiled(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      required this.showPass,
      required this.textValidate});

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(16),
    );

    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: textEditingController,
            validator: (value) {
              if (value!.isEmpty) {
                return value = textValidate;
              }
              return null;
            },
            obscureText: showPass,
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
