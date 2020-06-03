import 'dart:convert';
import 'dart:io';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:local_assets_server/local_assets_server.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solotravel/utils/log.dart';


class WebThread {
  static final WebThread _singleton = WebThread._internal();

  factory WebThread() {
    return _singleton;
  }

  static final flutterWebviewPlugin = new FlutterWebviewPlugin();

  static final subject = BehaviorSubject<Map<String, dynamic>>();

  static final jsChannel = 'WebThread';

  static final Set<JavascriptChannel> jsChannels = [
    JavascriptChannel(
        name: jsChannel,
        onMessageReceived: (JavascriptMessage message) {
          var response = json.decode(message.message);
          subject.add(response);
        }),
  ].toSet();

  _initServer() async {
    final server = new LocalAssetsServer(
      address: InternetAddress.loopbackIPv4,
      assetsBasePath: 'assets/web',
      port: 8997
    );

    final address = await server.serve();
    myLog('http://${address.address}:${server.boundPort}');
    flutterWebviewPlugin.launch('http://${address.address}:${server.boundPort}',
        hidden: true,
        javascriptChannels: jsChannels
    );
  }

  WebThread._internal() {
    _initServer();
  }



}
