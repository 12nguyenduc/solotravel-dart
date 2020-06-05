import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solotravel/modals/sound.dart';
import 'package:solotravel/utils/log.dart';

const String SOUNDS = 'SOUND';
const String USER = 'USER';

void logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}


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
  if(sounds.length==0){
    myLog(await rootBundle.loadString('assets/json/soundDefault.json'));
    List<dynamic> listSound = jsonDecode(await rootBundle.loadString('assets/json/soundDefault.json'));
    for(int i=0; i<listSound.length; i++){
      sounds.add(Sound.fromJsonMap(listSound[i]));
    }
  }
  return sounds;
}

