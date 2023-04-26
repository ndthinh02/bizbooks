import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/views/bottom/home/all/all_screen.dart';

import 'gift/gift_screen.dart';
import 'lib/libary_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabs = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const UnderlineTabIndicator(
                      borderSide: BorderSide(
                    width: 3,
                    color: colorButton,
                  )),
                  isScrollable: true,
                  labelColor: Colors.black,
                  labelStyle: CustomText.title(24, Colors.black),
                  unselectedLabelColor: colorTextAuthor,
                  unselectedLabelStyle: CustomText.title(24, colorTextAuthor),
                  automaticIndicatorColorAdjustment: false,
                  tabs: const [
                    Tab(
                      text: "Tất cả ",
                    ),
                    Tab(
                      text: "Thư viện",
                    ),
                    Tab(
                      text: "Quà tặng",
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                    children: [AllScreen(), LibraryScreen(), GiftScreen()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
