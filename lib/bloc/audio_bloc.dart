import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ui_flutter/bloc/audio_event.dart';
import 'package:ui_flutter/bloc/audio_state.dart';
import 'package:ui_flutter/views/audio_player/player_audio.dart';

import '../models/books.dart';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  late AudioPlayer _audioPlayer;
  AudioBloc() : super(AudioInitial()) {
    on<FetchAudio>(_onFetchAudioEvent);
    // on<StopAudio>(_onStopAudioEvent());
  }

  Future<void> _onFetchAudioEvent(
      FetchAudio event, Emitter<AudioState> emit) async {
    _audioPlayer = AudioPlayer();
    int i = event.index;

    final ConcatenatingAudioSource playlist =
        ConcatenatingAudioSource(children: [
      for (i; i < mListBooks.length; i++)
        AudioSource.uri(Uri.parse(mListBooks[i].urlAudio),
            tag: MediaItem(
                id: mListBooks[i].id,
                title: mListBooks[i].name,
                artist: mListBooks[i].author,
                artUri: Uri.parse(mListBooks[i].urlImage))),
    ]);
    Stream<PositionData> positionDataStream = Rx.combineLatest3(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (positon, buffedPositonStream, duration) => PositionData(
            bufferedPosition: buffedPositonStream,
            duration: duration ?? Duration.zero,
            position: positon)).asBroadcastStream();
    await _audioPlayer.setLoopMode(LoopMode.all);
    await _audioPlayer.setAudioSource(playlist);

    emit(AudioLoadingSuccess(
      audioPlayer: _audioPlayer,
      streamPositionData: positionDataStream,
    ));
  }

  // _onStopAudioEvent() {
  //   _audioPlayer!.stop();
  // }
}
