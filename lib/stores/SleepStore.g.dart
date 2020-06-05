// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SleepStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SleepStore on SleepStoreBase, Store {
  final _$sleepAidAtom = Atom(name: 'SleepStoreBase.sleepAid');

  @override
  List<Sound> get sleepAid {
    _$sleepAidAtom.reportRead();
    return super.sleepAid;
  }

  @override
  set sleepAid(List<Sound> value) {
    _$sleepAidAtom.reportWrite(value, super.sleepAid, () {
      super.sleepAid = value;
    });
  }

  final _$nightAtom = Atom(name: 'SleepStoreBase.night');

  @override
  List<Sound> get night {
    _$nightAtom.reportRead();
    return super.night;
  }

  @override
  set night(List<Sound> value) {
    _$nightAtom.reportWrite(value, super.night, () {
      super.night = value;
    });
  }

  final _$daytimeAtom = Atom(name: 'SleepStoreBase.daytime');

  @override
  List<Sound> get daytime {
    _$daytimeAtom.reportRead();
    return super.daytime;
  }

  @override
  set daytime(List<Sound> value) {
    _$daytimeAtom.reportWrite(value, super.daytime, () {
      super.daytime = value;
    });
  }

  final _$getDataSleepAsyncAction = AsyncAction('SleepStoreBase.getDataSleep');

  @override
  Future<void> getDataSleep() {
    return _$getDataSleepAsyncAction.run(() => super.getDataSleep());
  }

  @override
  String toString() {
    return '''
sleepAid: ${sleepAid},
night: ${night},
daytime: ${daytime}
    ''';
  }
}
