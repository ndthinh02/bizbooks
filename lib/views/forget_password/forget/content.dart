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
                              },
                              keyboardType: TextInputType.number,
                              controller: codeController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return value = "Code không hợp lệ !";
                                }

                                return null;
                              },
                              decoration: InputDecoration(
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
                                style: CustomText.subText(15, Colors.white),
                              ))
                        ],
                      )),
                ],
              )),
          const SizedBox(
            height: 14,
          ),
          CustomButton(
              assetImage: '',
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
              title: "TIẾP TỤC                ",
              colorButton: isCheckCodeHave ? colorButton : Colors.grey,
              radius: BorderRadius.circular(40),
              sizeText: 15,
              colorText: Colors.white)
        ],
      ),
    ));
  }
}
