import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/views/bottom/cart_screen.dart';
import 'package:ui_flutter/views/bottom/home/home_screen.dart';
import 'package:ui_flutter/views/bottom/profile_screen.dart';
import 'package:ui_flutter/views/bottom/search_screen.dart';

import '../../ui/custom_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List pages = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            unselectedLabelStyle: CustomText.subText(13, colorGrayScaleLabel),
            selectedLabelStyle: CustomText.subText(13, colorGrayScaleLabel),
            fixedColor: _selectedIndex == 0
                ? colorButton
                : _selectedIndex == 1
                    ? colorButton
                    : _selectedIndex == 2
                        ? colorButton
                        : colorButton,
            onTap: _onTappedItem,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "images/icon_home.svg",
                    color:
                        _selectedIndex == 0 ? colorButton : colorGrayScaleLabel,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Tìm kiếm",
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "images/icon_search.svg",
                    color:
                        _selectedIndex == 1 ? colorButton : colorGrayScaleLabel,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Giỏ hàng",
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "images/icon_cart.svg",
                    color:
                        _selectedIndex == 2 ? colorButton : colorGrayScaleLabel,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "Cá nhân",
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "images/icon_person.svg",
                    color:
                        _selectedIndex == 3 ? colorButton : colorGrayScaleLabel,
                  ),
                ),
              ),
            ]),
        body: pages.elementAt(_selectedIndex));
  }
}
