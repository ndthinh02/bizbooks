import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_flutter/ui/color.dart';

import 'onboard/onboard1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Onboard1Screen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colorBeginGradientSplash, colorEndGradientSplash])),
          child: Center(
            child: SvgPicture.asset('images/logo.svg'),
          )),
    );
  }
}
