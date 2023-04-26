import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool showPass;
  final String? Function(String?) funtionValidator;
  final Function funtionOnchanged;

  // final bool

  const CustomTextFiled({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.showPass,
    required this.funtionValidator,
    required this.funtionOnchanged,
  });

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    );

    var outlineInputBorder2 = OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(width: 1, color: colorTextError));
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 2),
      child: Column(
        children: [
          TextFormField(
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 15 * 4),
            style: CustomText.subText(16, colorLabalTextFiled),
            controller: textEditingController,
            validator: funtionValidator,
            onChanged: (string) {
              funtionOnchanged();
            },
            obscureText: showPass,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                filled: true,
                // enabledBorder: outlineInputBorder2,
                errorBorder: outlineInputBorder2,
                helperText: '',
                errorStyle: CustomText.styleTextError(13, colorTextError),
                fillColor: colorBackgroundTextFiled,
                hintText: hintText,
                hintStyle: CustomText.subText(15, colorTextFiled),
                border: outlineInputBorder),
          )
        ],
      ),
    );
  }
}

class CustomSearch {
  static TextField customSearch(String title, bool readOnly,
      TextEditingController textEditingController, Function function) {
    return TextField(
      controller: textEditingController,
      readOnly: readOnly,
      onChanged: (value) {
        function();
      },
      decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.cancel,
            color: Colors.grey,
          ),
          prefixIcon: SvgPicture.asset(
            "images/icon_search.svg",
            width: 12,
            height: 12,
            fit: BoxFit.scaleDown,
          ),
          filled: true,
          fillColor: colorBackgroundTextFiled,
          hintText: title,
          hintStyle: CustomText.subText(17, Colors.black),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8))),
    );
  }
}
