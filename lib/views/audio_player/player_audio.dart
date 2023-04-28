import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';
import 'package:ui_flutter/views/audio_player/audio_file.dart';

import '../../models/books.dart';

class PlayerAudioScreen extends StatefulWidget {
  final Books books;
  const PlayerAudioScreen({super.key, required this.books});

  @override
  State<PlayerAudioScreen> createState() => _AudioFileState();
}

class _AudioFileState extends State<PlayerAudioScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  String url =
      "https://s3-alpha-sig.figma.com/img/1bbf/ff1e/e63fbaac99c595080ccfe89e44fa1e8e?Expires=1683504000&Signature=Lz0wA6M0P6uq-HmzKrw-h2T96b7~nOqIIo-hHrLV4xMeNH3qWpcD0ThZ-UMxLnKRv3GIAHmhVZvkn~EhYEB1lQdwD0EWGEziP91CBYKD9~NftHWEHro3LhhyntJOulhRvXlYiL5pms8jrn2bMf6BPjAWC1nJlDyWudFRiO9Q8sYlbW6PvElwVhGje5gymQnxvm12GXf-XW-HGztwDiu4RDbYVQDGBsDZEz33sNtJ-aeKrQVLiDH1iWfVLVuqFwxxaCpPwxh5jlT3f~89och1F3j466878yalMh94yeT0wEO9L7jY-m-NDiTTY~z4~VSLm9XU9M7YJZYnSqKkiXOGhw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: 519,
          decoration: BoxDecoration(
              color: const Color(0xFFFCFCFC),
              image: DecorationImage(
                  opacity: 0.1, image: NetworkImage(url), fit: BoxFit.cover)),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "images/icon_arrow_down.svg",
                              width: 40,
                              height: 40,
                            ),
                            const Icon(
                              Icons.more_horiz,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Stack(
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.only(left: 210, top: 40),
                                child: SvgPicture.asset("images/icon_cd.svg")),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  url,
                                  width: 140,
                                  height: 220,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Text(
                          'Chương 02: Lý do khiến bạn chưa thành công',
                          style: CustomText.title(15, colorLabalTextFiled),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Phần 01: Thành công đến trong tay',
                          style: CustomText.subText(13, colorGrayScaleLabel),
                        ),
                        const SizedBox(
                          height: 42,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AudioFile(advancedPlayer: audioPlayer)
            ],
          ),
        )),
      ],
    ));
  }
}
