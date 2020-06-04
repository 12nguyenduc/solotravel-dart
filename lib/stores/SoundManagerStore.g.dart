// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SoundManagerStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SoundManagerStore on SoundManagerStoreBase, Store {
  final _$isPlayAtom = Atom(name: 'SoundManagerStoreBase.isPlay');

  @override
  bool get isPlay {
    _$isPlayAtom.reportRead();
    return super.isPlay;
  }

  @override
  set isPlay(bool value) {
    _$isPlayAtom.reportWrite(value, super.isPlay, () {
      super.isPlay = value;
    });
  }

  final _$playAudioAsyncAction = AsyncAction('SoundManagerStoreBase.playAudio');

  @override
  Future<void> playAudio(String url,
      {String image, bool loop, String title, String artist, String album}) {
    return _$playAudioAsyncAction.run(() => super.playAudio(url,
        image: image, loop: loop, title: title, artist: artist, album: album));
  }

  final _$pauseAudioAsyncAction =
      AsyncAction('SoundManagerStoreBase.pauseAudio');

  @override
  Future<void> pauseAudio() {
    return _$pauseAudioAsyncAction.run(() => super.pauseAudio());
  }

  final _$resumeAudioAsyncAction =
      AsyncAction('SoundManagerStoreBase.resumeAudio');

  @override
  Future<void> resumeAudio() {
    return _$resumeAudioAsyncAction.run(() => super.resumeAudio());
  }

  final _$disposeAsyncAction = AsyncAction('SoundManagerStoreBase.dispose');

  @override
  Future<void> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  @override
  String toString() {
    return '''
isPlay: ${isPlay}
    ''';
  }
}
