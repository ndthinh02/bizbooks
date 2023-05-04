import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ui_flutter/bloc/audio_event.dart';
import 'package:ui_flutter/bloc/audio_state.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  late AudioPlayer _audioPlayer;
  AudioBloc() : super(AudioState(audioPlayer: AudioPlayer())) {
    on<PlayAudio>((event, emit) {
      emit(AudioState(audioPlayer: _audioPlayer));
    });
  }
}
