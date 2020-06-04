// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$soundsAtom = Atom(name: 'HomeStoreBase.sounds');

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

  final _$getSoundFromLocalAsyncAction =
      AsyncAction('HomeStoreBase.getSoundFromLocal');

  @override
  Future<void> getSoundFromLocal() {
    return _$getSoundFromLocalAsyncAction.run(() => super.getSoundFromLocal());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void addSound(Sound sound) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.addSound');
    try {
      return super.addSound(sound);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sounds: ${sounds}
    ''';
  }
}
