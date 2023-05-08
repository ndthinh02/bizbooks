import 'package:equatable/equatable.dart';

abstract class AudioEvent extends Equatable {
  const AudioEvent();
}

class FetchAudio extends AudioEvent {
  final int index;
  const FetchAudio({required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StopAudio extends AudioEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
