import 'package:mobx/mobx.dart';
import 'package:solotravel/modals/meditation/MeditationResponse.dart';
import 'package:solotravel/modals/soundscene/SoundSceneResponse.dart';
import 'package:solotravel/modals/soundscene/data.dart';
import 'package:solotravel/modals/sound.dart';
import 'package:solotravel/network/MyApi.dart';
import 'package:solotravel/network/api.dart';
import 'package:solotravel/utils/log.dart';

part 'MeditationStore.g.dart';

class MeditationStore extends MeditationStoreBase with _$MeditationStore {
  static MeditationStore _instance = new MeditationStore._();

  factory MeditationStore() => _instance;

  MeditationStore._();
}

abstract class MeditationStoreBase with Store {

  @observable
  Sound daily = Sound();

  @observable
  List<Sound> singles = [];

  @observable
  List<Sound> basic = [];

  @observable
  List<Sound> series = [];

  @action
  Future<void> getDataMeditation() async{
    MeditationResponse meditationResponse = await getMeditation();
    if(meditationResponse.responseCode==200){
      daily = meditationResponse.data.Daily;
      singles = meditationResponse.data.Singles;
      basic = meditationResponse.data.Basic;
      series = meditationResponse.data.Series;
    }
  }
}
