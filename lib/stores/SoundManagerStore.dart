import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:mobx/mobx.dart';

part 'SoundManagerStore.g.dart';

final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();


class SoundManagerStore extends SoundManagerStoreBase with _$SoundManagerStore{
  static SoundManagerStore _instance = new SoundManagerStore._();

  factory SoundManagerStore() => _instance;

  SoundManagerStore._();
  }

abstract class SoundManagerStoreBase with Store {

  @observable
  bool isPlay = false;

  @action
  Future<void> playAudio(String url, {String image, bool loop, String title, String artist, String album}) async{
    _assetsAudioPlayer.open(
        Audio.network(
          url,
          metas: Metas(
            title: title!=null?title:"Tide",
            artist: artist!=null?artist:"Relax",
            album: album!=null?album:"Meditation",
            image: MetasImage.network(image), //can be MetasImage.network
          ),
        ),
        autoStart: true,
        showNotification: true,
        notificationSettings: NotificationSettings(
          prevEnabled: false, //disable the previous button
          nextEnabled: false,
          //and have a custom next action (will disable the default action)
//          customNextAction: (player) {
//            print("next");
//
//          }
        )
    );
    if(loop==true){
      _assetsAudioPlayer.loop = true;
    }
    isPlay = true;
  }

  @action
  Future<void> pauseAudio() async{
    _assetsAudioPlayer.pause();
    isPlay = false;
  }

  @action
  Future<void> resumeAudio() async{
    _assetsAudioPlayer.play();
    isPlay = true;
  }

  @action
  Future<void> dispose() async{
    _assetsAudioPlayer.dispose();
    isPlay = false;
  }

}
