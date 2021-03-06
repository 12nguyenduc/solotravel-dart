import 'package:mobx/mobx.dart';
import 'package:solotravel/modals/explore/ExploreResponse.dart';
import 'package:solotravel/modals/explore/daily.dart';
import 'package:solotravel/modals/sound.dart';
import 'package:solotravel/network/MyApi.dart';

part 'ExploreStore.g.dart';

class ExploreStore extends ExploreStoreBase with _$ExploreStore {
  static ExploreStore _instance = new ExploreStore._();

  factory ExploreStore() => _instance;

  ExploreStore._();
}

abstract class ExploreStoreBase with Store {

  @observable
  String title = '';

  @observable
  List<Sound> highlight = [];

  @observable
  List<Sound> sound = [];

  @observable
  List<Sound> meditation = [];

  @observable
  List<Sound> sleep = [];

  @observable
  Daily daily = Daily();

  @observable
  List<Sound> blog = [];

  @observable
  List<Sound> minis = [];


  @action
  Future<void> getDataExplore() async{
    ExploreResponse exploreResponse = await getExplore();
    if(exploreResponse.responseCode==200){
      title = exploreResponse.data.title;
      highlight = exploreResponse.data.highlight;
      sound = exploreResponse.data.sound;
      meditation = exploreResponse.data.meditation;
      sleep = exploreResponse.data.sleep;
      minis = exploreResponse.data.minis;
      daily = exploreResponse.data.daily;
      daily.userLike = [...daily.userLike, ...daily.userLike];
      blog = exploreResponse.data.blog;
    }
  }
}
