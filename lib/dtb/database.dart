import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../models/books.dart';

final ConcatenatingAudioSource playlist = ConcatenatingAudioSource(children: [
  for (int i = 0; i < mListBooks.length; i++)
    AudioSource.uri(Uri.parse(mListBooks[i].urlAudio),
        tag: MediaItem(
            id: mListBooks[i].id,
            title: mListBooks[i].name,
            artist: mListBooks[i].author,
            artUri: Uri.parse(mListBooks[i].urlImage))),
]);
