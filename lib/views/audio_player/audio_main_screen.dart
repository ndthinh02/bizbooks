import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/views/audio_player/player_audio.dart';
import 'package:ui_flutter/views/bottom/profile_screen.dart';

import '../../models/books.dart';

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
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onTapItem,
        items: [
          BottomNavigationBarItem(
              label: "Mục lục",
              icon: SvgPicture.asset("images/icon_playlist.svg")),
          BottomNavigationBarItem(
              label: "Hẹn giờ",
              icon: SvgPicture.asset("images/icon_timer.svg")),
          BottomNavigationBarItem(
              label: "Ebook",
              icon: SvgPicture.asset(
                "images/icon_book.svg",
                color: Colors.black,
              )),
          const BottomNavigationBarItem(label: "Tốc độ", icon: Text("1.5x")),
        ],
      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}
