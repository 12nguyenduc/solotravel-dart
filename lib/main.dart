import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui' as ui show TextHeightBehavior;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:interactive_webview/interactive_webview.dart';


void main() {
  runApp(MyApp());
}

class MyText extends Text {
  MyText(
    String data, {
    Key key,
    TextStyle style,
    StrutStyle strutStyle,
    TextAlign textAlign,
    TextDirection textDirection,
    Locale locale,
    bool softWrap,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
    String semanticsLabel,
    TextWidthBasis textWidthBasis,
    ui.TextHeightBehavior textHeightBehavior,
  }) : super(
          data,
          style: (style != null
              ? GoogleFonts.poppins().merge(style)
              : GoogleFonts.poppins()),
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
        );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  final FirebaseAuth _auth = FirebaseAuth.instance;


  GoogleSignInAccount _currentUser;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  var twitterLogin = new TwitterLogin(
    consumerKey: 'bc5ESW8eHcKTp0id7UrPLjF6S',
    consumerSecret: 'XUkGmI0eUuHYMGECdBjclflPEDA75MZ1QBYGx9q9ZmN3lQpdvk',
  );
  final _webView = InteractiveWebView();

  String random = 'ksdfs';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      if (_currentUser != null) {
        print(_currentUser.email);
      }
    });
    _googleSignIn.signInSilently();
    _webViewHandler();

  }

  Future<Null> injectJS(){
    return _webView.evalJavascript("const nativeCommunicator = typeof webkit !== 'undefined' ? webkit.messageHandlers.native : window.native; while(true){ nativeCommunicator.postMessage(''+Math.random()); }");
  }

  _webViewHandler() async {
    _webView.didReceiveMessage.listen((message) {
      print(message.data);
    });

    _webView.stateChanged.listen((state) {
      print("stateChanged ${state.type} ${state.url}");
    });

    _webView.loadHTML("<html></html>", baseUrl: "");
    injectJS();
  }



  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignInTwitter() async {
    final TwitterLoginResult result = await twitterLogin.authorize();

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        var session = result.session;
        print(session.token+' / '+session.secret);
        break;
      case TwitterLoginStatus.cancelledByUser:
        print('user cancel');
        break;
      case TwitterLoginStatus.error:
        print('error');
        break;
    }
  }

  Future<void> _handleSignInFacebook() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        print(result.accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('user cancel');
        break;
      case FacebookLoginStatus.error:
        print('error');
        break;
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: MyText(widget.title, style: TextStyle(fontSize: 14, fontStyle: FontStyle.normal, color: Colors.yellow),),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Web writing best practices: Keep it lean'),
            MyText('Web writing best practices: Keep it lean'),
            RaisedButton(
              child: const Text('Sign in Google'),
              onPressed: _handleSignIn,
            ),
            RaisedButton(
              child: const Text('Sign in Facebook'),
              onPressed: _handleSignInFacebook,
            ),
            RaisedButton(
              child: const Text('Sign in Twitter'),
              onPressed: _handleSignInTwitter,
            ),

          ],
        ),
      ),
    );
  }
}
