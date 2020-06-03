import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:solotravel/modals/soundscene/sounds.dart';
import 'package:solotravel/utils/log.dart';

const String SOUNDS = 'SOUND';
const String USER = 'USER';

void logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

//void saveUserInfo(User user) async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  prefs.setString(USER_INFO, jsonEncode(user.toJson()));
//}
//
//Future<User> getUserInfo() async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  String userInfoString = prefs.getString(USER_INFO);
//  if(userInfoString!=null)
//    return User.fromJsonMap(jsonDecode(prefs.getString(USER_INFO)));
//  else
//    return null;
//}

void saveSound(Sound sound) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Sound> sounds = await getSounds();
    bool isContain = false;

    for(int i=0; i<sounds.length; i++){
      if (sounds[i].id == sound.id) {
        isContain = true;
      }
    }
    if(!isContain){
      sounds.add(sound);
      prefs.setString(SOUNDS, jsonEncode(sounds));
    }
  }catch(e){
    myLog(e);
  }
}

Future<List<Sound>> getSounds() async {
  List<Sound> sounds = [];
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String soundString = prefs.getString(SOUNDS);
  if(soundString!=null){
    List<dynamic> listSound = jsonDecode(soundString);
    for(int i=0; i<listSound.length; i++){
      sounds.add(Sound.fromJsonMap(listSound[i]));
    }
  }
  myLog(sounds.length);
  return sounds;
}

