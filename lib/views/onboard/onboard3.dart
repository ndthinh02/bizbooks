import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';

import '../login/login_anothter_method.dart';

class Onboard3Screen extends StatefulWidget {
  const Onboard3Screen({super.key});

  @override
  State<Onboard3Screen> createState() => _Onboard1ScreenState();
}

class _Onboard1ScreenState extends State<Onboard3Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/onboard3.png"), fit: BoxFit.cover)),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomCenter,
                colors: [colorBeginGradient, colorEndGradient]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 140,
              ),
              Text("Hàng ngàn cuốn sách",
                  style: CustomText.title(28, Colors.white)),
              Text("trong tầm tay", style: CustomText.title(28, Colors.white)),
              const SizedBox(
                height: 50,
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
                          builder: (context) =>
                              const LoginAnotherMethodScreen(),
                        ));
                      },
                      child: const Text("TIẾP TỤC"))),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 150),
                child: Text(
                  "Bỏ qua bước này",
                  style: CustomText.subText(15, Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
