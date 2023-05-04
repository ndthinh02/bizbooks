import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/views/audio_player/player_audio.dart';
import 'package:ui_flutter/views/bottom/profile_screen.dart';

import '../../models/books.dart';
import '../../ui/color.dart';
import '../../ui/custom_text.dart';

class AudioMainScreen extends StatefulWidget {
  final Books books;
  const AudioMainScreen({super.key, required this.books});

  @override
  State<AudioMainScreen> createState() => _AudioMainScreenState();
}

class _AudioMainScreenState extends State<AudioMainScreen> {
  int _selectedIndex = 0;
  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      PlayerAudioScreen(
        books: widget.books,
      ),
      const ProfileScreen(),
      const ProfileScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: CustomText.subText(13, colorGrayScaleLabel),
        selectedLabelStyle: CustomText.subText(13, colorGrayScaleLabel),
        fixedColor: _selectedIndex == 0
            ? colorButton
            : _selectedIndex == 1
                ? colorButton
                : _selectedIndex == 2
                    ? colorButton
                    : colorButton,
        type: BottomNavigationBarType.fixed,
        onTap: _onTapItem,
        items: [
          BottomNavigationBarItem(
              label: "Mục lục",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "images/icon_playlist.svg",
                  color:
                      _selectedIndex == 0 ? colorButton : colorGrayScaleLabel,
                ),
              )),
          BottomNavigationBarItem(
              label: "Hẹn giờ",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "images/icon_timer.svg",
                  color:
                      _selectedIndex == 1 ? colorButton : colorGrayScaleLabel,
                ),
              )),
          BottomNavigationBarItem(
              label: "Ebook",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "images/icon_read_book.svg",
                  color:
                      _selectedIndex == 2 ? colorButton : colorGrayScaleLabel,
                ),
              )),
          const BottomNavigationBarItem(
              label: "Tốc độ",
              icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("1.5x"),
              )),
        ],
      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}
