import 'package:dio/dio.dart';
import 'package:solotravel/modals/explore/ExploreResponse.dart';
import 'package:solotravel/modals/meditation/MeditationResponse.dart';
import 'package:solotravel/modals/sleep/SleepResponse.dart';
import 'package:solotravel/modals/soundscene/SoundSceneResponse.dart';
import 'package:solotravel/utils/log.dart';

import 'api.dart';

Dio dio = new Dio();

const BASE = 'https://shopcutes.com/api/';

final Api api = new Api();

final String soundScene = BASE+"soundscene.json";
final String meditation = BASE+"meditation.json";
final String sleep = BASE+"sleep.json";
final String explore = BASE+"explore.json";

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

Future<MeditationResponse> getMeditation() async {
  MeditationResponse meditationResponse = MeditationResponse();
  try {
    Response response = await dio.get(meditation);
    myLog(response);
    meditationResponse = MeditationResponse.fromJsonMap(response.data);
    return meditationResponse;
  } catch (e) {
    myLog(e);
    return meditationResponse;
  }
}

Future<SleepResponse> getSleep() async {
  SleepResponse sleepResponse = SleepResponse();
  try {
    Response response = await dio.get(sleep);
    myLog(response);
    sleepResponse = SleepResponse.fromJsonMap(response.data);
    return sleepResponse;
  } catch (e) {
    myLog(e);
    return sleepResponse;
  }
}

Future<ExploreResponse> getExplore() async {
  ExploreResponse exploreResponse = ExploreResponse();
  try {
    Response response = await dio.get(explore);
    myLog(response);
    exploreResponse = ExploreResponse.fromJsonMap(response.data);
    return exploreResponse;
  } catch (e) {
    myLog(e);
    return exploreResponse;
  }
}
