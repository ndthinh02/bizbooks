import 'package:flutter/material.dart';
import 'package:ui_flutter/models/onboard.dart';
import 'package:ui_flutter/views/onboard/onboard_content.dart';

class Onboard1Screen extends StatefulWidget {
  const Onboard1Screen({super.key});

  @override
  State<Onboard1Screen> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<Onboard1Screen> {
  PageController controller = PageController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 0);
  }
  // int activeIndex = 0;
  // Widget buildImage(int index) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(4),
  //     child: Image.asset(
  //       mlistOnboard[index].image,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: controller,
          itemCount: mlistOnboard.length,
          itemBuilder: (context, index) {
            return OnBoardContent(
              image: mlistOnboard[index].image,
              titleButton: mlistOnboard[index].titleButton,
              skip: mlistOnboard[index].skip,
              title: mlistOnboard[index].title,
              index: index,
              pageController: controller,
            );
          },
        ),
      ),
    );
  }

  // Widget buildIndicator() => AnimatedSmoothIndicator(
  //       onDotClicked: animateToSlide,
  //       effect: const ColorTransitionEffect(
  //           dotHeight: 8,
  //           dotWidth: 8,
  //           activeDotColor: Colors.white,
  //           dotColor: Colors.grey),
  //       activeIndex: activeIndex,
  //       count: mlistOnboard.length,
  //     );

  // void animateToSlide(int index) => controller.animateToPage(index);
}
