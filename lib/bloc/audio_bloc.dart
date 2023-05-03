import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_flutter/bloc/audio_event.dart';
import 'package:ui_flutter/bloc/audio_state.dart';

class AudioBlocs extends Bloc<AudioEvents, AudioState> {
  bool isPlaying = false;
  bool isPaused = false;
  Duration duration = const Duration();
  Duration position = const Duration();
  final AudioPlayer audioPlayer = AudioPlayer();
  AudioBlocs() : super(AudioInitial()) {
    on<PlayPlayer>((event, emit) {
      emit(PlayPlayerSucces(audioPlayer: audioPlayer));
    });
  }
  void init(String url) {
    audioPlayer.onDurationChanged.listen((event) {
      duration = event;
    });
    audioPlayer.onPositionChanged.listen((event) {
      position = event;
    });
    audioPlayer.setSourceUrl(url);
  }

  void playAudio(String url) {
    if (!isPlaying) {
      audioPlayer.play(UrlSource(url));

      isPlaying = true;
    } else if (isPlaying == true) {
      audioPlayer.pause();

      isPlaying = false;
    }
    print(isPlaying);
  }
}
