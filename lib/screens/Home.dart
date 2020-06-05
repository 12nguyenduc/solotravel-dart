import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:solotravel/screens/HomeNap.dart';
import 'package:solotravel/screens/HomeSleep.dart';
import 'package:solotravel/screens/Meditation.dart';
import 'package:solotravel/stores/HomeStore.dart';
import 'package:solotravel/stores/SoundManagerStore.dart';

import 'Breath.dart';
import 'HomeFocus.dart';

class HomeScreen extends StatefulWidget {
  static HomeScreen _instance = new HomeScreen._();

  factory HomeScreen() => _instance;

  HomeScreen._();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  double currentPageValue = 0;
  int selectedIndex = 0;
  int selectedPage = 0;
  bool isPlay = false;
  final homeStore = HomeStore();
  final soundManager = SoundManagerStore();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarIconBrightness: Brightness.light));
    homeStore.getSoundFromLocal();
    playAudioFirst();
  }

  void playAudioFirst() {
    if(homeStore.sounds.length>0){
      _playAudio(homeStore.sounds[0].mp3, image: homeStore.sounds[0].img);
      controller.addListener(() {
        setState(() {
          currentPageValue = controller.page;
        });
        if (controller.page - controller.page.floor() == 0) {
          int page = int.parse('${controller.page.floor()}');
          if (selectedPage != page) {
            selectedPage = page;
            _playAudio(homeStore.sounds[0].mp3, image: homeStore.sounds[0].img);
          }
        }
      });
    }
  }

  _playAudio(String url, {String image}) {
    soundManager.playAudio(url, title: "Tide", artist: "Relax", album: "Meditation", image: image);
  }

  _pauseAudio() {
    soundManager.pauseAudio();
  }

  _resumeAudio() {
    soundManager.resumeAudio();
  }

  togglePlay() {
    if (isPlay)
      _pauseAudio();
    else
      _resumeAudio();
  }

  _buildPage(BuildContext context, int position) {
    Color color = Colors.black;

    if (position == currentPageValue.floor()) {
      return Observer(
          builder: (context) =>InkWell(
          onTap: togglePlay,
          child: Container(
            padding: EdgeInsets.all((70 * (currentPageValue - position))),
            decoration: BoxDecoration(color: color),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular((currentPageValue - position) * 40)),
                    child: CachedNetworkImage(imageUrl:homeStore.sounds[position].img,
                        fit: BoxFit.cover)),
                ...([
                  (!soundManager.isPlay
                      ? Center(
                          child: Icon(
                            FontAwesomeIcons.play,
                            size: 40,
                            color: Color(0xd0ffffff),
                          ),
                        )
                      : Container())
                ]),
              ],
            ),
          )));
    } else if (position == currentPageValue.floor() + 1) {
      return InkWell(
          onTap: togglePlay,
          child: Container(
              padding: EdgeInsets.all((70 * (position - currentPageValue))),
              decoration: BoxDecoration(color: color),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular((position - currentPageValue) * 40)),
                  child: Image.network(homeStore.sounds[position].img,
                      fit: BoxFit.cover))));
    } else {
      return InkWell(
        onTap: togglePlay,
        child: Container(
            color: color,
            child: Center(
                child: Image.network(homeStore.sounds[position].img,
                    fit: BoxFit.cover))),
      );
    }
  }

  _goFocus() {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return  FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.86, end: 1.0).animate(animation),
                    child: child,
                  ),
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return FocusScreen();
            }));
  }

  _goSleep() {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return  FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.86, end: 1.0).animate(animation),
                  child: child,
                ),
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return HomeSleepScreen();
            }));
  }

  _goNap() {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return  FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.86, end: 1.0).animate(animation),
                  child: child,
                ),
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return HomeNapScreen();
            }));
  }


  _goBreath() {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return  FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.86, end: 1.0).animate(animation),
                    child: child,
                  ),
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return BreathScreen();
            }));
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            color: Colors.black,
            child: Observer(
                builder: (context) => PageView.builder(
              controller: controller,
              itemBuilder: (context, position) {
                return _buildPage(context, position);
              },
              itemCount: homeStore.sounds.length, // Can be null
            ))),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Evening",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/images/share.svg',
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    InkWell(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 4, bottom: 4, left: 16, right: 8),
                            child: Lottie.asset(
                              'assets/images/play_music.json',
                              width: 28,
                              height: 28,
                              fit: BoxFit.fill,
                            )))
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: 16, right: MediaQuery.of(context).size.width / 6),
                  child: Text(
                    "We are such stuff as dreams are made on, and our little life is rounded with a sleep",
                    style: TextStyle(fontSize: 16, color: Color(0x99ffffff)),
                  )),
              Expanded(child: Container()),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: _goFocus,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                  color: Color(0x60ffffff),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(56 / 2))),
                              child: Center(
                                  child: Icon(
                                CommunityMaterialIcons.radiobox_marked,
                                size: 28,
                                color: Colors.white,
                              ))),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 8, bottom: 16),
                              child: Text(
                                "Focus",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0x99ffffff)),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: _goSleep,
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                color: Color(0x60ffffff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(56 / 2))),
                            child: Center(
                                child: Icon(
                              CommunityMaterialIcons.weather_night,
                              size: 28,
                              color: Colors.white,
                            ))),
                        Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 16),
                            child: Text(
                              "Sleep",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0x99ffffff)),
                            ))
                      ],
                    ),
                  )),
                  Expanded(
                    child: InkWell(
                      onTap: _goNap,
                      child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                color: Color(0x60ffffff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(56 / 2))),
                            child: Center(
                                child: Icon(
                              CommunityMaterialIcons.circle_outline,
                              size: 28,
                              color: Colors.white,
                            ))),
                        Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 16),
                            child: Text(
                              "Nap",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0x99ffffff)),
                            ))
                      ],
                    ),
                  )),
                  Expanded(
                    child: InkWell(onTap: _goBreath, child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                                color: Color(0x60ffffff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(56 / 2))),
                            child: Center(
                                child: Icon(
                              CommunityMaterialIcons.leaf,
                              size: 28,
                              color: Colors.white,
                            ))),
                        Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 16),
                            child: Text(
                              "Breath",
                              style: TextStyle(
                                  fontSize: 14, color: Color(0x99ffffff)),
                            ))
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
//    soundManager.dispose();
    controller.dispose();
    super.dispose();
  }
}
