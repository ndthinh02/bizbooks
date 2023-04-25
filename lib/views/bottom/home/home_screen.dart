import 'package:flutter/material.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';

import 'all/all_screen.dart';
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
          body: Column(
            children: [
              TabBar(
                splashBorderRadius: BorderRadius.circular(40),
                indicatorWeight: 4,
                labelColor: Colors.black,
                labelStyle: CustomText.title(24, Colors.black),
                indicatorColor: colorButton,
                automaticIndicatorColorAdjustment: false,
                tabs: const [
                  Tab(
                    text: "Tất cả",
                  ),
                  Tab(
                    text: "Thư viện",
                  ),
                  Tab(
                    text: "Quà tặng",
                  ),
                ],
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
