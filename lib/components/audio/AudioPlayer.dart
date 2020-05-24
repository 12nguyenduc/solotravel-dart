
import 'package:solotravel/utils/log.dart';
import 'package:solotravel/webthread/webthread.dart';
import 'package:uuid/uuid.dart';

abstract class AudioPlayerController {
  void play(String url, {bool loop});
  void pause();
  void resume();
  void seekTo(int seconds);
  void setLoop(bool loop);
  void onEnded(Function callback);
}


class AudioPlayer implements AudioPlayerController{

  AudioPlayer();

  var uuid = Uuid().v4();


  @override
  void play(String url, {bool loop}){
//    WebThread.flutterWebviewPlugin.show();
    WebThread.flutterWebviewPlugin.evalJavascript(
        '''
      (function() {
        document.getElementById("audioContainer").innerHTML = `<video id="audio_$uuid" controls autoPlay="true" ${loop==true?"loop":""}>
        <source src="$url" type="video/mp4">
      </video>`;
      })()
      '''
    );
  }

  @override
  void pause(){
    WebThread.flutterWebviewPlugin.evalJavascript(
        '''
      (function() {
        document.getElementById('audio_$uuid').pause();
      })()
    '''
    );
  }

  @override
  void resume(){
    WebThread.flutterWebviewPlugin.evalJavascript(
        '''
      (function() {
        document.getElementById('audio_$uuid').play();
      })()
    '''
    );
  }

  @override
  void seekTo(int seconds) {
    WebThread.flutterWebviewPlugin.evalJavascript(
        '''
      (function() {
        document.getElementById('audio_$uuid').currentTime = $seconds;
      })()
    '''
    );
  }

  @override
  void setLoop(bool loop) {
    WebThread.flutterWebviewPlugin.evalJavascript(
        '''
      (function() {
        document.getElementById('audio_$uuid').loop = $loop;
      })()
    '''
    );
  }

  @override
  void onEnded(Function callback) {
    WebThread.subject.where((event) => event['$uuid']=='ended').listen((message) {
      myLog('Ended');
      callback();
    });
  }


}