import 'package:mobx/mobx.dart';
import 'package:solotravel/modals/sleep/SleepResponse.dart';
import 'package:solotravel/modals/soundscene/data.dart';
import 'package:solotravel/modals/sound.dart';
import 'package:solotravel/network/MyApi.dart';
import 'package:solotravel/network/api.dart';
import 'package:solotravel/utils/log.dart';

part 'SleepStore.g.dart';

class SleepStore extends SleepStoreBase with _$SleepStore {
  static SleepStore _instance = new SleepStore._();

  factory SleepStore() => _instance;

  SleepStore._();
}

abstract class SleepStoreBase with Store {

  @observable
  List<Sound> sleepAid = [];

  @observable
  List<Sound> night = [];

  @observable
  List<Sound> daytime = [];

  @action
  Future<void> getDataSleep() async{
    SleepResponse sleepResponse = await getSleep();
    if(sleepResponse.responseCode==200){
      sleepAid = sleepResponse.data.SleepAid;
      night = sleepResponse.data.Night;
      daytime = sleepResponse.data.Daytime;
    }
  }
}
