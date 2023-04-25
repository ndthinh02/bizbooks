import 'package:flutter/material.dart';

class PlayerAudioScreen extends StatelessWidget {
  const PlayerAudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              const Icon(Icons.arrow_drop_down_circle_rounded),
              Container(
                height: 700,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 8 / 100,
                        image: AssetImage("images/image_book.png"),
                        fit: BoxFit.cover)),
              )
            ],
          )
        ],
      ),
    ));
  }
}
