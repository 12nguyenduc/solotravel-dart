import 'package:mobx/mobx.dart';
import 'package:solotravel/modals/soundscene/SoundSceneResponse.dart';
import 'package:solotravel/modals/soundscene/data.dart';
import 'package:solotravel/modals/sound.dart';
import 'package:solotravel/network/MyApi.dart';
import 'package:solotravel/network/api.dart';
import 'package:solotravel/utils/log.dart';
import 'package:solotravel/utils/preference.dart';

part 'HomeStore.g.dart';


class HomeStore extends HomeStoreBase with _$HomeStore{
  static HomeStore _instance = new HomeStore._();

  factory HomeStore() => _instance;

  HomeStore._();
}

abstract class HomeStoreBase with Store {

  @observable
  List<Sound> sounds = [];

  @action
  void addSound(Sound sound){
    this.sounds.add(sound);
  }

  @action
  Future<void> getSoundFromLocal() async{
    this.sounds = await getSounds();
  }
}
