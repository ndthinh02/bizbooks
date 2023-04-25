import 'package:flutter/material.dart';
import 'package:ui_flutter/utils/key.dart';

import '../../../ui/color.dart';
import '../../../ui/custom_button.dart';
import '../../../ui/custom_text.dart';
import '../new_password/new_password.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  bool visibleCode = false;
  bool isCheckCodeHave = true;
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Form(
              key: keyForgetPassword,
              child: Column(
                children: [
                  TextFormField(
                    style: CustomText.subText(16, colorLabalTextFiled),
                    onChanged: (value) {
                      if (keyForgetPassword.currentState!.validate()) {}
                    },
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return value = "Email không hợp lệ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        errorStyle: CustomText.subText(13, colorTextError),
                        fillColor: colorBackgroundTextFiled,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(color: Colors.red)),
                        hintText: "Email đã đăng ký",
                        hintStyle: CustomText.subText(15, Colors.black)),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Visibility(
                      visible: visibleCode,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              style:
                                  CustomText.subText(16, colorLabalTextFiled),
                              maxLength: 6,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  setState(() {
                                    isCheckCodeHave = false;
                                  });
                                } else {
                                  setState(() {
                                    isCheckCodeHave = true;
                                  });
                                }
                                if (keyForgetPassword.currentState!
                                    .validate()) {}
                              },
                              keyboardType: TextInputType.number,
                              controller: codeController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return value = "Mã không được để trống";
                                }
                                if (value.length < 6) {
                                  return value = "Mã không hợp lệ !";
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  errorStyle:
                                      CustomText.subText(13, colorTextError),
                                  fillColor: colorBackgroundTextFiled,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                  hintText: "Mã xác nhận",
                                  hintStyle:
                                      CustomText.subText(15, Colors.black)),
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Gửi lại",
                                style: CustomText.textMedium(15, Colors.white),
                              ))
                        ],
                      )),
                ],
              )),
          const SizedBox(
            height: 14,
          ),
          CustomButton(
            colorBorderSide: isCheckCodeHave ? colorButton : Colors.grey,
            function: () {
              if (keyForgetPassword.currentState!.validate()) {
                setState(() {
                  visibleCode = true;
                });
                if (check) {
                  setState(() {
                    isCheckCodeHave = false;
                    check = false;
                  });
                } else {
                  if (codeController.text.length < 6) {
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NewPasswordScreen()));
                  }
                }
              }
            },
            title: "TIẾP TỤC",
            colorButton: isCheckCodeHave ? colorButton : Colors.grey,
            radius: 40,
            sizeText: 15,
            colorText: Colors.white,
            icon: const SizedBox(),
            marginHorizontal: 10,
            marginVertical: 8,
            isCheckHaveIcon: false,
          )
        ],
      ),
    ));
  }
}
