import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_button.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/ui/custom_text_filed.dart';
import 'package:ui_flutter/utils/dialog.dart';
import 'package:ui_flutter/utils/key.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  bool onToogle = false;
  bool isShowPassword = false;
  bool isShowPasswordAgain = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 50),
                    _buildContent(emailController)
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _buildContent(TextEditingController emailController) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 355,
      height: 580,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Form(
              key: keyRegister,
              child: Column(
                children: [
                  CustomTextFiled(
                    hintText: "Email của bạn",
                    textEditingController: emailController,
                    showPass: false,
                    textValidate: 'Email không chính xác',
                  ),
                  CustomTextFiled(
                    hintText: "Họ và tên",
                    textEditingController: fullnameController,
                    showPass: false,
                    textValidate: 'Họ tên không đươc trống',
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
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFiled(
                          showPass: isShowPasswordAgain,
                          hintText: "Nhập lại mật khẩu",
                          textEditingController: repasswordController,
                          textValidate: 'Mật khẩu không được trống !',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowPasswordAgain = !isShowPasswordAgain;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 20, top: 20, left: 10),
                          child: isShowPasswordAgain == true
                              ? SvgPicture.asset("images/icon_eyes.svg")
                              : SvgPicture.asset("images/icon_eyes_off.svg"),
                        ),
                      )
                    ],
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
              colorBorderSide: colorButton,
              function: () {
                if (keyRegister.currentState!.validate()) {
                  CustomBottomSheet.showBottom(context, "Tạo tài khoản",
                      'thành công', 'Tài khoản Bizbooks của bạn là', "");
                }
              },
              title: 'Tạo tài khoản        ',
              colorButton: colorButton,
              radius: BorderRadius.circular(40),
              sizeText: 16,
              colorText: Colors.white,
              assetImage: ""),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {},
            child: RichText(
                text: TextSpan(
                    text: "Đã có tài khoản ?",
                    style: CustomText.subText(
                      13,
                      Colors.black,
                    ),
                    children: [
                  TextSpan(
                      text: " Đăng nhập ",
                      style: CustomText.subText(13, colorTextRegister))
                ])),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.white,
        ),
        const SizedBox(
          height: 34,
        ),
        Text(
          "Tạo tài khoản",
          style: CustomText.title(28, Colors.white),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          "Tạo tài khoản Bizbooks",
          style: CustomText.subText(15, Colors.white),
        ),
      ],
    );
  }
}
