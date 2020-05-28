import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:solotravel/utils/log.dart';
import 'package:solotravel/webthread/webthread.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
  }

  Future<void> _handleSignInGoogle() async {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _handleSignInFacebook,
              child: Text('Login Facebook'),
            ),
            RaisedButton(
              onPressed: _handleSignInGoogle,
              child: Text('Login Google'),
            ),
            RaisedButton(
              onPressed: _handleSignInTwitter,
              child: Text('Login Twitter'),
            ),
          ],
        ),
      ),
    );
  }

}