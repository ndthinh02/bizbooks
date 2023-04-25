import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_flutter/views/audio_player/player_audio_screen.dart';
import 'package:ui_flutter/views/bottom/profile_screen.dart';

class AudioMainScreen extends StatefulWidget {
  const AudioMainScreen({super.key});

  @override
  State<AudioMainScreen> createState() => _AudioMainScreenState();
}

class _AudioMainScreenState extends State<AudioMainScreen> {
  var pages = [
    const PlayerAudioScreen(),
    const ProfileScreen(),
  ];
  int _selectedIndex = 0;
  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  showBottomSheet() {
    Container _buildBottomSheet(BuildContext context) {
      return Container(
        height: 300,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListView(
          children: <Widget>[
            const ListTile(title: Text('Bottom sheet')),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.attach_money),
                labelText: 'Enter an integer',
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save and close'),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
