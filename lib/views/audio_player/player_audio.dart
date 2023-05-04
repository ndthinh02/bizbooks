import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ui_flutter/bloc/audio_bloc.dart';
import 'package:ui_flutter/bloc/audio_state.dart';

import '../../models/books.dart';
import '../../ui/color.dart';
import '../../ui/custom_text.dart';

class PlayerAudioScreen extends StatefulWidget {
  final Books books;
  const PlayerAudioScreen({super.key, required this.books});

  @override
  State<PlayerAudioScreen> createState() => _PlayerAudioScreenState();
}

class _PlayerAudioScreenState extends State<PlayerAudioScreen> {
  AudioPlayer? _audioPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _audioPlayer = AudioPlayer();
    _init();
  }

  String urls = '';
  final _playlist = ConcatenatingAudioSource(children: [
    AudioSource.uri(
        Uri.parse(
            'https://firebasestorage.googleapis.com/v0/b/fluttershopapp-e5a1f.appspot.com/o/y2mate.com%20-%20Vietsub%20%20pinyin%20Kh%C3%B4ng%20bi%E1%BA%BFt%20ph%E1%BA%A3i%20l%C3%A0m%20sao%20%E4%B8%8D%E7%9F%A5%E6%89%80%E6%8E%AA%20%20V%C6%B0%C6%A1ng%20T%C4%A9nh%20V%C4%83n%20Kh%C3%B4ng%20M%E1%BA%ADp%20%E7%8E%8B%E9%9D%96%E9%9B%AF%E4%B8%8D%E8%83%96%20%20TikTok.mp3?alt=media&token=1b754215-6971-449c-8710-8a025d4a226a'),
        tag: MediaItem(
            id: '0',
            title: 'Chuong 1',
            artist: 'Day bien',
            artUri: Uri.parse(
                'https://images.pexels.com/photos/16259572/pexels-photo-16259572.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))),
    AudioSource.uri(
        Uri.parse(
            'https://firebasestorage.googleapis.com/v0/b/fluttershopapp-e5a1f.appspot.com/o/y2mate.com%20-%20Vietsub%20%C4%90%C3%A1y%20Bi%E1%BB%83n%20%20Nh%E1%BA%A5t%20Chi%20L%E1%BB%B1u%20Li%C3%AAn.mp3?alt=media&token=a354f42c-69f4-44e0-b600-f1eac4b1379d'),
        tag: MediaItem(
            id: '1',
            title: 'Chuong 2',
            artist: 'Li do ban chua thanh cong',
            artUri: Uri.parse(
                'https://images.pexels.com/photos/16259572/pexels-photo-16259572.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')))
  ]);
  Future<void> _init() async {
    await _audioPlayer!.setLoopMode(LoopMode.all);
    await _audioPlayer!.setAudioSource(_playlist);
  }

  Stream<PositionData> get _positionDataStream => Rx.combineLatest3(
      _audioPlayer!.positionStream,
      _audioPlayer!.bufferedPositionStream,
      _audioPlayer!.durationStream,
      (positon, buffedPositonStream, duration) => PositionData(
          bufferedPosition: buffedPositonStream,
          duration: duration ?? Duration.zero,
          position: positon));
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state) {
        print(state);
        return Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 523,
              decoration: BoxDecoration(
                  // color: Colors.amber,
                  image: DecorationImage(
                      opacity: 0.1,
                      image: AssetImage(widget.books.urlImage),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(14),
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
                                margin:
                                    const EdgeInsets.only(left: 210, top: 40),
                                child: SvgPicture.asset("images/icon_cd.svg")),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(
                                  widget.books.urlImage,
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
                          widget.books.name,
                          style: CustomText.title(15, colorLabalTextFiled),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.books.author,
                          style: CustomText.subText(13, colorGrayScaleLabel),
                        ),
                        Container(
                          height: 10,
                          margin: const EdgeInsets.only(
                              top: 90, left: 0, right: 0, bottom: 0),
                          child: StreamBuilder(
                            stream: _positionDataStream,
                            builder: (context, snapshot) {
                              final positionData = snapshot.data;
                              return ProgressBar(
                                  barHeight: 4,
                                  timeLabelLocation: TimeLabelLocation.above,
                                  timeLabelTextStyle: CustomText.subText(
                                      13, colorLabalTextFiled),
                                  baseBarColor: colorLight,
                                  bufferedBarColor: colorLight,
                                  progressBarColor: colorButton,
                                  onSeek: _audioPlayer!.seek,
                                  thumbColor: colorButton,
                                  buffered: positionData?.bufferedPosition ??
                                      Duration.zero,
                                  progress:
                                      positionData?.position ?? Duration.zero,
                                  total:
                                      positionData?.duration ?? Duration.zero);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Controls(audioPlayer: _audioPlayer!),
            )
          ],
        );
      },
    ));
  }
}

class PositionData {
  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;
  PositionData(
      {required this.bufferedPosition,
      required this.duration,
      required this.position});
}

class Controls extends StatelessWidget {
  final AudioPlayer audioPlayer;
  const Controls({super.key, required this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (!(playing ?? false)) {
          return _row(
            GestureDetector(
                onTap: () {
                  audioPlayer.play();
                },
                child: SvgPicture.asset("images/icon_resume.svg")),
          );
        } else if (processingState != ProcessingState.completed) {
          return _row(
            GestureDetector(
                onTap: () {
                  audioPlayer.pause();
                },
                child: SvgPicture.asset("images/icon_play.svg")),
          );
        }
        return _row(
          SvgPicture.asset("images/icon_resume.svg"),
        );
      },
    );
  }

  Widget _row(Widget widget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              audioPlayer
                  .seek(audioPlayer.position - const Duration(seconds: 30));
            },
            child: SvgPicture.asset("images/icon_replay_30.svg")),
        GestureDetector(
            onTap: () {
              audioPlayer.seekToPrevious();
            },
            child: SvgPicture.asset("images/icon_skip_previous.svg")),
        widget,
        GestureDetector(
            onTap: () {
              audioPlayer.seekToNext();
            },
            child: SvgPicture.asset("images/icon_skip_next.svg")),
        GestureDetector(
            onTap: () {
              audioPlayer
                  .seek(audioPlayer.position + const Duration(seconds: 30));
            },
            child: SvgPicture.asset("images/icon_forward_30.svg")),
      ],
    );
  }
}
