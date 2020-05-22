import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui' as ui show TextHeightBehavior;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_native_web/flutter_native_web.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:solotravel/network/api.dart';
import 'package:solotravel/utils/log.dart';


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
  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Api api = new Api();

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

  printText(text){
    print(text);
  }

  _callApi(){
    api.callAPI(Method.GET, link: 'https://randomuser.me/api/', params: {'phone': '0898572528', 'password': '123456'}).listen((response) {
      myLog(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(widget.title, style: TextStyle(fontSize: 14, fontStyle: FontStyle.normal, color: Colors.yellow),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Web writing best practices: Keep it lean'),
            MyText('Web writing best practices: Keep it lean'),
            RaisedButton(
              child: const Text('Call API'),
              onPressed: _callApi,
            ),
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
