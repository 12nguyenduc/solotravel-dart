import 'package:dio/dio.dart';
import 'package:solotravel/modals/soundscene/SoundSceneResponse.dart';
import 'package:solotravel/utils/log.dart';

import 'api.dart';

Dio dio = new Dio();

const BASE = 'https://shopcutes.com/api/';

final Api api = new Api();

final String soundScene = BASE+"soundscene.json";

Future<SoundSceneResponse> getSoundScene() async {
  SoundSceneResponse sceneResponse = new SoundSceneResponse();
  try {
    Response response = await dio.get(soundScene);
    myLog(response);
    sceneResponse = SoundSceneResponse.fromJsonMap(response.data);
    return sceneResponse;
  } catch (e) {
    myLog(e);
    return sceneResponse;
  }
}
