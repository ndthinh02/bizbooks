import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_flutter/ui/custom_button.dart';
import 'package:ui_flutter/ui/custom_text_filed.dart';
import 'package:ui_flutter/utils/key.dart';

import '../../../ui/color.dart';
import '../../../ui/custom_text.dart';
import '../../../utils/dialog.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordControllerAgain =
      TextEditingController();
  bool isShowPassword = true;
  bool isShowPasswordAgain = true;
  var outlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
    borderRadius: BorderRadius.circular(16),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: keyNewpassword,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFiled(
                    showPass: isShowPassword,
                    hintText: "Mật khẩu",
                    textEditingController: newPasswordController,
                    textValidate: 'Mật khẩu không được trống',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20, top: 20, left: 10),
                    child: isShowPassword == true
                        ? SvgPicture.asset("images/icon_eyes.svg")
                        : SvgPicture.asset("images/icon_eyes_off.svg"),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: TextFormField(
                    controller: newPasswordControllerAgain,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return value = 'Mật khẩu không được trống';
                      }
                      if (value != newPasswordController.text) {
                        return value = "Mật khẩu không trùng khớp";
                      }
                      return null;
                    },
                    obscureText: isShowPasswordAgain,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: colorBackgroundTextFiled,
                        hintText: 'Nhập lại mật khẩu',
                        hintStyle: CustomText.title(15, Colors.grey),
                        border: outlineInputBorder),
                  ),
                )),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isShowPasswordAgain = !isShowPasswordAgain;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20, top: 20, left: 10),
                    child: isShowPasswordAgain == true
                        ? SvgPicture.asset("images/icon_eyes.svg")
                        : SvgPicture.asset("images/icon_eyes_off.svg"),
                  ),
                )
              ],
            ),
            CustomButton(
                assetImage: '',
                function: () {
                  if (keyNewpassword.currentState!.validate()) {
                    CustomBottomSheet.showBottom(
                        context,
                        "Đổi mật khẩu ",
                        "thành công",
                        "Mật khẩu mới của bạn là",
                        "thinhjerry1410@gmail.com");
                  }
                },
                title: "Tạo mật khẩu mới              ",
                colorButton: colorButton,
                radius: BorderRadius.circular(40),
                sizeText: 15,
                colorText: Colors.white)
          ],
        ),
      ),
    );
  }
}
