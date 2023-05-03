import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_flutter/ui/color.dart';
import 'package:ui_flutter/ui/custom_text.dart';

import '../../models/books.dart';

class PlayerAudioScreen extends StatefulWidget {
  final Books books;
  const PlayerAudioScreen({super.key, required this.books});

  @override
  State<PlayerAudioScreen> createState() => _AudioFileState();
}

class _AudioFileState extends State<PlayerAudioScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool isPlaying = false;
  bool isPaused = false;
  BlocProvider get provider => context.read<BlocProvider>();
  String url =
      "https://s3-alpha-sig.figma.com/img/1bbf/ff1e/e63fbaac99c595080ccfe89e44fa1e8e?Expires=1683504000&Signature=Lz0wA6M0P6uq-HmzKrw-h2T96b7~nOqIIo-hHrLV4xMeNH3qWpcD0ThZ-UMxLnKRv3GIAHmhVZvkn~EhYEB1lQdwD0EWGEziP91CBYKD9~NftHWEHro3LhhyntJOulhRvXlYiL5pms8jrn2bMf6BPjAWC1nJlDyWudFRiO9Q8sYlbW6PvElwVhGje5gymQnxvm12GXf-XW-HGztwDiu4RDbYVQDGBsDZEz33sNtJ-aeKrQVLiDH1iWfVLVuqFwxxaCpPwxh5jlT3f~89och1F3j466878yalMh94yeT0wEO9L7jY-m-NDiTTY~z4~VSLm9XU9M7YJZYnSqKkiXOGhw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });
    // Repository().fetchListAudio();
    audioPlayer.setSourceUrl(widget.books.urlAudio);
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  Widget _btnStart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset("images/icon_replay_30.svg"),
        SvgPicture.asset("images/icon_skip_previous.svg"),
        InkWell(
            onTap: () {
              if (!isPlaying) {
                audioPlayer.play(UrlSource(widget.books.urlAudio));
                setState(() {
                  isPlaying = true;
                });
              } else if (isPlaying == true) {
                audioPlayer.pause();
                setState(() {
                  isPlaying = false;
                });
              }
            },
            child: isPlaying == true
                ? SvgPicture.asset(
                    "images/icon_play.svg",
                    fit: BoxFit.scaleDown,
                  )
                : SvgPicture.asset(
                    "images/icon_resume.svg",
                  )),
        SvgPicture.asset("images/icon_skip_next.svg"),
        SvgPicture.asset("images/icon_forward_30.svg"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // final provider = BlocProvider.of<AudioBlocs>(context, listen: true);

    return SafeArea(
        child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 523,
          decoration: BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                  opacity: 0.1, image: NetworkImage(url), fit: BoxFit.cover)),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
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
                            margin: const EdgeInsets.only(left: 210, top: 40),
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
                      height: 50,
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
                      height: 65,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "0${_position.inMinutes}:${_position.inSeconds % 60 < 10 ? "0${_position.inSeconds % 60}" : _position.inSeconds % 60}",
                            style: CustomText.subText(13, colorLabalTextFiled)),
                        Text(
                            "0${_duration.inMinutes}:${_duration.inSeconds % 60 < 10 ? "0${_duration.inSeconds % 60}" : _duration.inSeconds % 60}",
                            style: CustomText.subText(13, colorLabalTextFiled)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
          // color: Colors.amber,
          child: Center(
              child: SliderTheme(
                  data: const SliderThemeData(
                    trackHeight: 4,
                  ),
                  child: Slider(
                      activeColor: colorButton,
                      min: 0.0,
                      max: _duration.inSeconds.toDouble(),
                      value: _position.inSeconds.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          changeToSecond(value.toInt());
                          value = value;
                        });
                      }))),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: _btnStart(),
        ),
      ],
    ));
  }
}
