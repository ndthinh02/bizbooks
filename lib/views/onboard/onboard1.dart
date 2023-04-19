import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/views/onboard/onboard2.dart';

class Onboard1Screen extends StatefulWidget {
  const Onboard1Screen({super.key});

  @override
  State<Onboard1Screen> createState() => _Onboard1ScreenState();
}

class _Onboard1ScreenState extends State<Onboard1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/onboard1.png"), fit: BoxFit.cover)),
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
              Text("Khám phá", style: CustomText.title(28, Colors.white)),
              Text("thư viện sách nói",
                  style: CustomText.title(28, Colors.white)),
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
                          builder: (context) => const Onboard2Screen(),
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
