import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_button.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/views/login/login.dart';
import 'package:ui_flutter/views/register/register.dart';

class LoginAnotherMethodScreen extends StatelessWidget {
  const LoginAnotherMethodScreen({super.key});

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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomCenter,
                colors: [colorBeginGradient, colorEndGradient]),
          ),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(
                      right: 20, left: 20, bottom: 20, top: 100),
                  child: _buildHeader(context)),
              const SizedBox(
                height: 100,
              ),
              _buildButton(context),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 80, right: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Text(
              "Chưa có tài khoản ?",
              style: CustomText.subText(13, Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterScreen(),
                ));
              },
              child: RichText(
                  text: TextSpan(
                      text: "Đăng ký",
                      style: CustomText.subText(13, colorTextRegister),
                      children: [
                    TextSpan(
                        text: " tài khoản Bizbooks",
                        style: CustomText.subText(13, Colors.white))
                  ])),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Đăng nhập",
              style: CustomText.title(28, Colors.white),
            ),
            Text(
              "và khám phá",
              style: CustomText.title(28, Colors.white),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          )),
          child: Text(
            "Bỏ qua",
            style: CustomText.subText(17, Colors.white),
          ),
        )
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          function: () {},
          title: "Đăng nhập bằng facebook",
          colorButton: colorButton,
          radius: BorderRadius.circular(40),
          sizeText: 15,
          colorText: Colors.white,
          assetImage: 'images/fb.svg',
        ),
        CustomButton(
          function: () {},
          title: "Đăng nhập bằng google",
          colorButton: Colors.white,
          radius: BorderRadius.circular(40),
          sizeText: 15,
          colorText: Colors.black,
          assetImage: 'images/google.svg',
        ),
        CustomButton(
          function: () {},
          title: "Đăng nhập bằng apple",
          colorButton: Colors.white70,
          radius: BorderRadius.circular(40),
          sizeText: 15,
          colorText: Colors.black,
          assetImage: 'images/apple.svg',
        ),
        const SizedBox(
          height: 70,
        ),
        SizedBox(
          width: 303,
          height: 56,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorButton,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: Text(
                "Đăng nhập với Bizbooks",
                textAlign: TextAlign.center,
                style: CustomText.title(15, Colors.white),
              )),
        ),
      ],
    );
  }
}
