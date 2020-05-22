import 'package:flutter/foundation.dart';

void myLog(Object object) {
  if(!kReleaseMode){
    try{
      final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
      pattern.allMatches(object.toString()).forEach((match) => print(match.group(0)));
    }catch(e){}
  }
}