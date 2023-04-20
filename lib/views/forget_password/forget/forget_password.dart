import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/views/forget_password/forget/header.dart';

import 'content.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/image_forget_password.png"),
                      fit: BoxFit.cover)),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        end: Alignment.bottomCenter,
                        colors: [colorBeginGradient, colorEndGradient])),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Header(
                          subTitle:
                              'Nhập email mà bạn đã đăng ký tài khoản Bizbooks để lấy lại mật khẩu',
                          title: 'Quên mật khẩu',
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Content(),
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
}
