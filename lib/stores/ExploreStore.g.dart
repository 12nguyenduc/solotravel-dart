// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExploreStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExploreStore on ExploreStoreBase, Store {
  final _$titleAtom = Atom(name: 'ExploreStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$highlightAtom = Atom(name: 'ExploreStoreBase.highlight');

  @override
  List<Sound> get highlight {
    _$highlightAtom.reportRead();
    return super.highlight;
  }

  @override
  set highlight(List<Sound> value) {
    _$highlightAtom.reportWrite(value, super.highlight, () {
      super.highlight = value;
    });
  }

  final _$soundAtom = Atom(name: 'ExploreStoreBase.sound');

  @override
  List<Sound> get sound {
    _$soundAtom.reportRead();
    return super.sound;
  }

  @override
  set sound(List<Sound> value) {
    _$soundAtom.reportWrite(value, super.sound, () {
      super.sound = value;
    });
  }

  final _$meditationAtom = Atom(name: 'ExploreStoreBase.meditation');

  @override
  List<Sound> get meditation {
    _$meditationAtom.reportRead();
    return super.meditation;
  }

  @override
  set meditation(List<Sound> value) {
    _$meditationAtom.reportWrite(value, super.meditation, () {
      super.meditation = value;
    });
  }

  final _$sleepAtom = Atom(name: 'ExploreStoreBase.sleep');

  @override
  List<Sound> get sleep {
    _$sleepAtom.reportRead();
    return super.sleep;
  }

  @override
  set sleep(List<Sound> value) {
    _$sleepAtom.reportWrite(value, super.sleep, () {
      super.sleep = value;
    });
  }

  final _$dailyAtom = Atom(name: 'ExploreStoreBase.daily');

  @override
  Daily get daily {
    _$dailyAtom.reportRead();
    return super.daily;
  }

  @override
  set daily(Daily value) {
    _$dailyAtom.reportWrite(value, super.daily, () {
      super.daily = value;
    });
  }

  final _$blogAtom = Atom(name: 'ExploreStoreBase.blog');

  @override
  List<Sound> get blog {
    _$blogAtom.reportRead();
    return super.blog;
  }

  @override
  set blog(List<Sound> value) {
    _$blogAtom.reportWrite(value, super.blog, () {
      super.blog = value;
    });
  }

  final _$minisAtom = Atom(name: 'ExploreStoreBase.minis');

  @override
  List<Sound> get minis {
    _$minisAtom.reportRead();
    return super.minis;
  }

  @override
  set minis(List<Sound> value) {
    _$minisAtom.reportWrite(value, super.minis, () {
      super.minis = value;
    });
  }

  final _$getDataExploreAsyncAction =
      AsyncAction('ExploreStoreBase.getDataExplore');

  @override
  Future<void> getDataExplore() {
    return _$getDataExploreAsyncAction.run(() => super.getDataExplore());
  }

  @override
  String toString() {
    return '''
title: ${title},
highlight: ${highlight},
sound: ${sound},
meditation: ${meditation},
sleep: ${sleep},
daily: ${daily},
blog: ${blog},
minis: ${minis}
    ''';
  }
}
