import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ui_flutter/views/audio_player/player_audio.dart';

abstract class AudioState extends Equatable {
  const AudioState();
}

class AudioInitial extends AudioState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AudioLoadingState extends AudioState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AudioLoadingSuccess extends AudioState {
  final AudioPlayer audioPlayer;
  final Stream<PositionData> streamPositionData;

  const AudioLoadingSuccess({
    required this.streamPositionData,
    required this.audioPlayer,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
