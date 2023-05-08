import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:ui_flutter/bloc/audio_bloc.dart';
import 'package:ui_flutter/bloc/audio_event.dart';
import 'package:ui_flutter/bloc/audio_state.dart';

import '../../models/books.dart';
import '../../ui/color.dart';
import '../../ui/custom_text.dart';
import 'control.dart';

class PlayerAudioScreen extends StatefulWidget {
  final Books books;
  final int index;
  const PlayerAudioScreen(
      {super.key, required this.books, required this.index});

  @override
  State<PlayerAudioScreen> createState() => _PlayerAudioScreenState();
}

class _PlayerAudioScreenState extends State<PlayerAudioScreen> {
  late AudioBloc audioBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioBloc = context.read<AudioBloc>();
    audioBloc.add(FetchAudio(index: widget.index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AudioBloc, AudioState>(
        bloc: audioBloc,
        builder: (context, state) {
          if (state is AudioLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AudioLoadingSuccess) {
            return SafeArea(
              child: StreamBuilder<SequenceState?>(
                  stream: state.audioPlayer.sequenceStateStream,
                  builder: (context, snapshot) {
                    final st = snapshot.data;
                    final metaData = st!.currentSource!.tag as MediaItem;

                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 529.h,
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              image: DecorationImage(
                                  opacity: 0.15,
                                  image:
                                      NetworkImage(metaData.artUri.toString()),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(14),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: SvgPicture.asset(
                                            "images/icon_arrow_down.svg",
                                            width: 40,
                                            height: 40,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return showDialogMenu();
                                              },
                                            );
                                          },
                                          child: const Icon(
                                            Icons.more_horiz,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 14.h,
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                left: 210, top: 40),
                                            child: SvgPicture.asset(
                                                "images/icon_cd.svg")),
                                        Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            child: Image.network(
                                              metaData.artUri.toString(),
                                              width: 160.w,
                                              height: 240.h,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 77,
                                    ),
                                    Text(
                                      metaData.title,
                                      style: CustomText.title(
                                          15, colorLabalTextFiled),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      metaData.artist.toString(),
                                      style: CustomText.subText(
                                          13, colorGrayScaleLabel),
                                    ),
                                    Container(
                                      height: 10,
                                      margin: const EdgeInsets.only(
                                          top: 90,
                                          left: 0,
                                          right: 0,
                                          bottom: 0),
                                      child: StreamBuilder(
                                        stream: state.streamPositionData,
                                        builder: (context, snapshot) {
                                          final positionData = snapshot.data;
                                          return ProgressBar(
                                              barHeight: 4,
                                              timeLabelLocation:
                                                  TimeLabelLocation.above,
                                              timeLabelTextStyle:
                                                  CustomText.subText(
                                                      13, colorLabalTextFiled),
                                              baseBarColor: colorLight,
                                              bufferedBarColor: colorLight,
                                              progressBarColor: colorButton,
                                              onSeek: state.audioPlayer.seek,
                                              thumbColor: colorButton,
                                              buffered: positionData
                                                      ?.bufferedPosition ??
                                                  Duration.zero,
                                              progress:
                                                  positionData?.position ??
                                                      Duration.zero,
                                              total: positionData?.duration ??
                                                  Duration.zero);
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
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Controls(audioPlayer: state.audioPlayer),
                        )
                      ],
                    );
                  }),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget showDialogMenu() {
    return Container(
      margin: EdgeInsets.only(top: 83.h),
      child: Dialog(
        alignment: Alignment.topLeft,
        backgroundColor: colorGrayScale,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 327.w,
          height: 248.h,
          decoration: BoxDecoration(
              color: colorGrayScale, borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              _buildItemMenu('icon_add.svg', 'Thêm vào thư viện'),
              _buildItemMenu('icon_download_arrow.svg', 'Tải xuống toàn bộ'),
              _buildItemMenu('icon_car.svg', 'Chế độ lái xe'),
              _buildItemMenu('icon_comment.svg', 'Viết đánh giá'),
              _buildItemMenu('icon_share.svg', 'Chia sẻ'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemMenu(String icon, String title) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 16, 24, 16),
      child: Row(
        children: [
          SvgPicture.asset('images/$icon'),
          const SizedBox(
            width: 15,
          ),
          Text(
            title,
            style: CustomText.subText(16, colorLabalTextFiled),
          )
        ],
      ),
    );
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
