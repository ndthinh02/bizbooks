import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ui_flutter/models/audio.dart';
import 'package:ui_flutter/ui/color.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AudioFile({super.key, required this.advancedPlayer});

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration _duration = const Duration();
  Duration _position = const Duration();
  bool isPlaying = false;
  bool isPaused = false;

  final String path =
      "https://firebasestorage.googleapis.com/v0/b/fluttershopapp-e5a1f.appspot.com/o/y2mate.com%20-%20Vietsub%20%C4%90%C3%A1y%20Bi%E1%BB%83n%20%20Nh%E1%BA%A5t%20Chi%20L%E1%BB%B1u%20Li%C3%AAn.mp3?alt=media&token=a354f42c-69f4-44e0-b600-f1eac4b1379d";
  final _dio = Dio();
  Future<List<Audio>?> fetchListAudio() async {
    final respone =
        await _dio.get("https://644a3ce2a8370fb32148662e.mockapi.io/audio");
    var listAudio = respone.data as List;
    print(listAudio);
    return listAudio.map((e) => Audio.fromJson(e)).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.advancedPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    widget.advancedPlayer.onPositionChanged.listen((event) {
      setState(() {
        _position = event;
      });
    });
    Repository().fetchListAudio();
    widget.advancedPlayer.setSourceUrl(path);
  }

  Widget _btnStart() {
    return IconButton(
        onPressed: () {
          if (!isPlaying) {
            widget.advancedPlayer.play(UrlSource(path));
            setState(() {
              isPlaying = true;
            });
          } else if (isPlaying == true) {
            widget.advancedPlayer.pause();
            setState(() {
              isPlaying = false;
            });
          }
        },
        icon: Icon(isPlaying == false ? Icons.play_arrow : Icons.pause));
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
        data: const SliderThemeData(trackHeight: 2),
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
            }));
  }
}
