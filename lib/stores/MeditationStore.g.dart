// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MeditationStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MeditationStore on MeditationStoreBase, Store {
  final _$dailyAtom = Atom(name: 'MeditationStoreBase.daily');

  @override
  Sound get daily {
    _$dailyAtom.reportRead();
    return super.daily;
  }

  @override
  set daily(Sound value) {
    _$dailyAtom.reportWrite(value, super.daily, () {
      super.daily = value;
    });
  }

  final _$singlesAtom = Atom(name: 'MeditationStoreBase.singles');

  @override
  List<Sound> get singles {
    _$singlesAtom.reportRead();
    return super.singles;
  }

  @override
  set singles(List<Sound> value) {
    _$singlesAtom.reportWrite(value, super.singles, () {
      super.singles = value;
    });
  }

  final _$basicAtom = Atom(name: 'MeditationStoreBase.basic');

  @override
  List<Sound> get basic {
    _$basicAtom.reportRead();
    return super.basic;
  }

  @override
  set basic(List<Sound> value) {
    _$basicAtom.reportWrite(value, super.basic, () {
      super.basic = value;
    });
  }

  final _$seriesAtom = Atom(name: 'MeditationStoreBase.series');

  @override
  List<Sound> get series {
    _$seriesAtom.reportRead();
    return super.series;
  }

  @override
  set series(List<Sound> value) {
    _$seriesAtom.reportWrite(value, super.series, () {
      super.series = value;
    });
  }

  final _$getDataMeditationAsyncAction =
      AsyncAction('MeditationStoreBase.getDataMeditation');

  @override
  Future<void> getDataMeditation() {
    return _$getDataMeditationAsyncAction.run(() => super.getDataMeditation());
  }

  @override
  String toString() {
    return '''
daily: ${daily},
singles: ${singles},
basic: ${basic},
series: ${series}
    ''';
  }
}
