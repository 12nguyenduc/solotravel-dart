import 'package:mobx/mobx.dart';
import 'package:solotravel/modals/soundscene/SoundSceneResponse.dart';
import 'package:solotravel/modals/soundscene/data.dart';
import 'package:solotravel/modals/soundscene/sounds.dart';
import 'package:solotravel/network/MyApi.dart';
import 'package:solotravel/network/api.dart';
import 'package:solotravel/utils/log.dart';

part 'SoundScene.g.dart';

class SoundSceneStore extends SoundSceneStoreBase with _$SoundSceneStore {
  static SoundSceneStore _instance = new SoundSceneStore._();

  factory SoundSceneStore() => _instance;

  SoundSceneStore._();
}

abstract class SoundSceneStoreBase with Store {
  @observable
   List<Data> data = [];

  @observable
  List<Sound> sounds = [];

  @action
  Future<void> selectCategory(Data data){
    this.sounds = data.sounds;
  }

  @action
  Future<void> getDataSoundScene() async{
    SoundSceneResponse soundSceneResponse = await getSoundScene();
    if(soundSceneResponse.responseCode==200){
      data = soundSceneResponse.data;
      if(data.length>0){
        this.sounds = data[0].sounds;
      }
    }
  }
}
