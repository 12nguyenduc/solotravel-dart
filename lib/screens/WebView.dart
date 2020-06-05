import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:solotravel/modals/sound.dart';

import 'Practice.dart';

class WebViewScreen extends StatefulWidget {
  String url;
  String title;

  WebViewScreen(this.url, {String title}){
    this.title = title;
  }

  @override
  _WebViewScreenState createState() => _WebViewScreenState(url, title: title);
}

class _WebViewScreenState extends State<WebViewScreen> {
  String url;
  String title;

  _WebViewScreenState(this.url, {String title}) {
    this.title = title;
  }

  @override
  void initState() {
    super.initState();
  }

  _goPractice(Sound sound) {
    Navigator.push(
        context,
        PageRouteBuilder(transitionsBuilder:
            (___, Animation<double> animation, ____, Widget child) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.86, end: 1.0).animate(animation),
              child: child,
            ),
          );
        }, pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return PracticeScreen(sound);
        }));
  }



  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: new AppBar(
        title: Text(title!=null?title: ''),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.white,
        child: const Center(
          child: Text('.....'),
        ),
      ),
    );
  }

}
