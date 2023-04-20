import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_button.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/ui/custom_text_filed.dart';
import 'package:ui_flutter/utils/key.dart';
import 'package:ui_flutter/views/choose_category/choose_category.dart';

import '../forget_password/forget/forget_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool onToogle = false;
  bool isShowPassword = false;
  String assetImage = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/image_login.png"),
                    fit: BoxFit.cover)),
            child: Container(
              margin: const EdgeInsets.only(left: 24, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 50),
                  Expanded(child: _buildContent(emailController))
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildContent(TextEditingController emailController) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        width: 355,
        height: 522,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            const SizedBox(
              height: 34,
            ),
            Text(
              "Tài khoản Bizbooks",
              style: CustomText.title(28, Colors.black),
            ),
            Form(
                key: keyLogin,
                child: Column(
                  children: [
                    CustomTextFiled(
                      hintText: "Email đăng nhập",
                      textEditingController: emailController,
                      showPass: false,
                      textValidate: 'Email không chính xác',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFiled(
                            showPass: isShowPassword,
                            hintText: "Mật khẩu",
                            textEditingController: passwordController,
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
                            margin: const EdgeInsets.only(
                                right: 20, top: 20, left: 10),
                            child: isShowPassword == true
                                ? SvgPicture.asset("images/icon_eyes.svg")
                                : SvgPicture.asset("images/icon_eyes_off.svg"),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(left: 24, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ghi nhớ đăng nhập",
                    style: CustomText.subText(15, Colors.black),
                  ),
                  SizedBox(
                      width: 64,
                      height: 32,
                      child: Switch(
                          value: onToogle,
                          onChanged: (value) {
                            setState(() {
                              onToogle = value;
                            });
                          })),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ForgetPasswordScreen()));
              },
              child: Text(
                "Quên mật khẩu",
                style: CustomText.title(15, Colors.black),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            CustomButton(
                function: () {
                  if (keyLogin.currentState!.validate()) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const ChooseCategory()));
                  }
                },
                title: 'ĐĂNG NHẬP             ',
                colorButton: colorButton,
                radius: BorderRadius.circular(40),
                sizeText: 16,
                colorText: Colors.white,
                assetImage: "")
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          highlightColor: Colors.white,
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 34,
        ),
        Text(
          "Đăng nhập",
          style: CustomText.title(28, Colors.white),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          "Đăng nhập sử dụng tài khoản Bizbooks",
          style: CustomText.subText(15, Colors.white),
        ),
      ],
    );
  }
}
