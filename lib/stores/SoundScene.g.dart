// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SoundScene.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SoundSceneStore on SoundSceneStoreBase, Store {
  final _$dataAtom = Atom(name: 'SoundSceneStoreBase.data');

  @override
  List<Data> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<Data> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$soundsAtom = Atom(name: 'SoundSceneStoreBase.sounds');

  @override
  List<Sound> get sounds {
    _$soundsAtom.reportRead();
    return super.sounds;
  }

  @override
  set sounds(List<Sound> value) {
    _$soundsAtom.reportWrite(value, super.sounds, () {
      super.sounds = value;
    });
  }

  final _$getDataSoundSceneAsyncAction =
      AsyncAction('SoundSceneStoreBase.getDataSoundScene');

  @override
  Future<void> getDataSoundScene() {
    return _$getDataSoundSceneAsyncAction.run(() => super.getDataSoundScene());
  }

  final _$SoundSceneStoreBaseActionController =
      ActionController(name: 'SoundSceneStoreBase');

  @override
  Future<void> selectCategory(Data data) {
    final _$actionInfo = _$SoundSceneStoreBaseActionController.startAction(
        name: 'SoundSceneStoreBase.selectCategory');
    try {
      return super.selectCategory(data);
    } finally {
      _$SoundSceneStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
sounds: ${sounds}
    ''';
  }
}
