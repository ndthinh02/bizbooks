import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final controller = CarouselController();
  final _mListImage = [
    "images/banner3.png",
    "images/banner1.png",
    "images/banner2.png",
  ];
  int activeIndex = 0;
  Widget buildImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.asset(
        _mListImage[index],
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      CarouselSlider.builder(
          carouselController: controller,
          itemCount: _mListImage.length,
          itemBuilder: (context, index, realIndex) {
            return buildImage(index);
          },
          options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index))),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: buildIndicator(),
        ),
      )
    ]);
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: const ColorTransitionEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Colors.white,
            dotColor: Colors.grey),
        activeIndex: activeIndex,
        count: _mListImage.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}
