import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/views/bottom/cart_screen.dart';
import 'package:ui_flutter/views/bottom/home/home_screen.dart';
import 'package:ui_flutter/views/bottom/profile_screen.dart';
import 'package:ui_flutter/views/bottom/search_screen.dart';

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
        bottomNavigationBar: BottomNavigationBar(
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
                icon: SvgPicture.asset(
                  "images/icon_home.svg",
                  color: _selectedIndex == 0 ? colorButton : Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                label: "Search ",
                icon: SvgPicture.asset(
                  "images/icon_search.svg",
                  color: _selectedIndex == 1 ? colorButton : Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                label: "Cart",
                icon: SvgPicture.asset(
                  "images/icon_cart.svg",
                  color: _selectedIndex == 2 ? colorButton : Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: SvgPicture.asset(
                  "images/icon_person.svg",
                  color: _selectedIndex == 3 ? colorButton : Colors.black,
                ),
              ),
            ]),
        body: pages.elementAt(_selectedIndex));
  }
}
