import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';

abstract class AudioState extends Equatable {
  const AudioState();
}

class AudioInitial extends AudioState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class PlayPlayerSucces extends AudioState {
  AudioPlayer audioPlayer;
  PlayPlayerSucces({required this.audioPlayer});
  @override
  // TODO: implement props
  List<Object?> get props => [audioPlayer];
}
