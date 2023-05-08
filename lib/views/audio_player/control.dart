import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';

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
