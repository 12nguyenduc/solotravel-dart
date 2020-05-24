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
import 'package:solotravel/webthread/webthread.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'components/audio/AudioPlayer.dart';

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
      home: MyHomePage(
        title: 'Flutter Demo',
      ),
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
    new WebThread();

    Future.delayed(new Duration(seconds: 2), playAudioFirst);
  }

  int selectedPage = 0;

  Future<dynamic> playAudioFirst() {
    _playAudio(pages[0]['audio'], image: pages[0]['image']);
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
      if (controller.page - controller.page.floor() == 0) {
        int page = int.parse('${controller.page.floor()}');
        selectedPage = page;
        _playAudio(pages[page]['audio'], image: pages[page]['image']);
      }
    });
  }

  Future<void> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//      accessToken: googleAuth.accessToken,
//      idToken: googleAuth.idToken,
//    );

//    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print("signed in " + googleUser.email);
  }

  Future<void> _handleSignInTwitter() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        var session = result.session;
        final AuthCredential credential = TwitterAuthProvider.getCredential(
            authToken: session.token, authTokenSecret: session.secret);
        final FirebaseUser user =
            (await _auth.signInWithCredential(credential)).user;
        assert(user.email != null);
        assert(user.displayName != null);
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);

        final FirebaseUser currentUser = await _auth.currentUser();
        assert(user.uid == currentUser.uid);
        setState(() {
          if (user != null) {
            myLog('Successfully signed in with Twitter. ' + user.uid);
          } else {
            myLog('Failed to sign in with Twitter. ');
          }
        });
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
        myLog(result.accessToken.token);
//        final AuthCredential credential = FacebookAuthProvider.getCredential(
//          accessToken: result.accessToken.token,
//        );
//        myLog(credential);
//        await _auth.signInWithCredential(credential);
//        final FirebaseUser user =
//            (await _auth.signInWithCredential(credential)).user;
//        assert(user.email != null);
//        assert(user.displayName != null);
//        assert(!user.isAnonymous);
//        assert(await user.getIdToken() != null);
//
//        final FirebaseUser currentUser = await _auth.currentUser();
//        assert(user.uid == currentUser.uid);
//        setState(() {
//          if (user != null) {
//            myLog('Successfully signed in with Facebook. ' + user.uid);
//          } else {
//            myLog('Failed to sign in with Facebook. ');
//          }
//        });
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

  _callApi() {
    api.callAPI(Method.GET, link: 'https://randomuser.me/api/', params: {
      'phone': '0898572528',
      'password': '123456'
    }).listen((response) {
      myLog(response);
    });
  }

  bool isPlay = false;
  AudioPlayer audioPlayer = new AudioPlayer();

  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  _playAudio(String url, {String image}) {
//    audioPlayer.play(url);
    _assetsAudioPlayer.open(
      Audio(
        url,
        metas: Metas(
          title: "Country",
          artist: "Florent Champigny",
          album: "CountryAlbum",
          image: MetasImage.network(image), //can be MetasImage.network
        ),
      ),
      autoStart: true,
      showNotification: true,
    );
    _assetsAudioPlayer.loop = true;
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  _pauseAudio() {
    audioPlayer.pause();
  }

  _resumeAudio() {
    audioPlayer.resume();
  }

  PageController controller = PageController();

  var pages = [
    {
      'audio': 'assets/audio/1050_daydream.mp3',
      'image': 'http://localhost:8997/i0.jpg'
    },
    {
      'audio': 'assets/audio/1931_deep_cove.mp3',
      'image': 'http://localhost:8997/i1.jpg'
    },
    {
      'audio': 'assets/audio/18331_Bird_night.mp3',
      'image': 'http://localhost:8997/i2.jpg'
    },
    {
      'audio': 'assets/audio/21104_Street_carnival.mp3',
      'image': 'http://localhost:8997/i3.jpg'
    },
    {
      'audio': 'assets/audio/22082_Beach_wave.mp3',
      'image': 'http://localhost:8997/i4.jpg'
    },
    {
      'audio': 'assets/audio/24298_Rain_Bali_Indonesia.mp3',
      'image': 'http://localhost:8997/i5.jpg'
    },
    {'audio': 'assets/audio/cow.mp3', 'image': 'http://localhost:8997/i6.jpg'},
  ];

  _buildPage(BuildContext context, int position) {
    Color color = Colors.black;

    if (position == currentPageValue.floor()) {
      return Container(
        padding: EdgeInsets.all((70 * (currentPageValue - position))),
        decoration: BoxDecoration(color: color),
        child: ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular((currentPageValue - position) * 40)),
            child: Image.network(pages[position]['image'], fit: BoxFit.cover)),
      );
    } else if (position == currentPageValue.floor() + 1) {
      return Container(
          padding: EdgeInsets.all((70 * (position - currentPageValue))),
          decoration: BoxDecoration(color: color),
          child: ClipRRect(
              borderRadius: BorderRadius.all(
                  Radius.circular((position - currentPageValue) * 40)),
              child:
                  Image.network(pages[position]['image'], fit: BoxFit.cover)));
    } else {
      return Container(
        color: color,
        child: Center(
            child: Image.network(pages[position]['image'], fit: BoxFit.cover)),
      );
    }
  }

  double currentPageValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: PageView.builder(
              controller: controller,
              itemBuilder: (context, position) {
                return _buildPage(context, position);
              },
              itemCount: pages.length, // Can be null
            )));
  }
}
