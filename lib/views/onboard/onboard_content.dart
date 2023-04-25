import 'package:flutter/material.dart';
import 'package:ui_flutter/views/login/login_anothter_method.dart';

import '../../ui/color.dart';
import '../../ui/custom_text.dart';

class OnBoardContent extends StatelessWidget {
  final String image, titleButton, skip, title;
  final int index;
  final PageController pageController;
  const OnBoardContent(
      {super.key,
      required this.index,
      required this.image,
      required this.titleButton,
      required this.skip,
      required this.title,
      required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              stops: [0, 0.4],
              end: Alignment.bottomCenter,
              colors: [colorBeginGradient, colorEndGradient]),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              const Spacer(),
              Text(title,
                  textAlign: TextAlign.center,
                  style: CustomText.title(28, Colors.white)),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorButton,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      onPressed: () {
                        if (index == 2) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginAnotherMethodScreen()));
                        } else if (index == 0) {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        } else if (index == 1) {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        }
                      },
                      child: Text(
                        titleButton,
                        textAlign: TextAlign.center,
                        style: CustomText.title(16, Colors.white),
                      ))),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: Text(
                  "Bỏ qua bước này",
                  style: CustomText.textMedium(15, Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
