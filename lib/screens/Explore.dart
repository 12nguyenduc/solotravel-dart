import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solotravel/modals/sound.dart';
import 'package:solotravel/screens/Sleep.dart';
import 'package:solotravel/screens/SoundScene.dart';
import 'package:solotravel/stores/ExploreStore.dart';

import 'Meditation.dart';
import 'Practice.dart';
import 'WebView.dart';

class ExploreScreen extends StatefulWidget {
  static ExploreScreen _instance = new ExploreScreen._();

  factory ExploreScreen() => _instance;

  ExploreScreen._();

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final exploreStore = ExploreStore();

  double size = 24;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
        .copyWith(statusBarIconBrightness: Brightness.dark));
    exploreStore.getDataExplore();
  }

  _goSoundScene() {
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
          return SoundSceneScreen();
        }));
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

  _goSleep() {
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
          return SleepScreen();
        }));
  }

  _goMeditation() {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                child: ScaleTransition(
                  scale:
                      Tween<double>(begin: 0.86, end: 1.0).animate(animation),
                  child: child,
                ),
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return MeditationScreen();
            }));
  }

  _goBlog(String url) {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                child: ScaleTransition(
                  scale:
                      Tween<double>(begin: 0.86, end: 1.0).animate(animation),
                  child: child,
                ),
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return WebViewScreen(url);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Container(
              color: Colors.white,
              child: SafeArea(
                  child: ListView(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 36, left: 16, right: 16),
                    child: Text(
                      "Explore",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Roboto"),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        exploreStore.title,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff999999),
                            fontFamily: "Roboto"),
                      )),
                  Container(
                      height: (MediaQuery.of(context).size.width - 32) * 9 / 14,
                      margin: const EdgeInsets.only(top: 16, bottom: 16),
                      child: exploreStore.highlight.length > 0
                          ? Swiper(
                              itemCount: exploreStore.highlight.length,
                              autoplay: true,
                              autoplayDelay: 5000,
                              itemBuilder: (BuildContext context, int index) {
                                Sound item = exploreStore.highlight[index];
                                return InkWell(
                                    onTap: () => _goPractice(
                                        exploreStore.highlight[index]),
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomStart,
                                      children: <Widget>[
                                      Container(
                                        width: MediaQuery.of(context).size.width-32,
                                        margin: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                            exploreStore.highlight[index].img,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                        Container(margin: const EdgeInsets.only(bottom: 16, left: 32),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                          Text(item.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)
                                        ],),)
                                    ],));
                              },
                            )
                          : Container()),
                  Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: InkWell(
                            onTap: _goSoundScene,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff2fbf4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(48 / 2))),
                                    child: Center(
                                        child: SvgPicture.asset(
                                      'assets/images/bass.svg',
                                      color: Color(0xff41c776),
                                      semanticsLabel: 'Sound',
                                      width: 20,
                                      height: 20,
                                    ))),
                                Text(
                                  "Sound",
                                  style: TextStyle(color: Color(0xffc2c2c2)),
                                )
                              ],
                            ),
                          )),
                          Expanded(
                              child: InkWell(
                            onTap: _goMeditation,
                            child: Container(
                                margin: const EdgeInsets.all(0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 8),
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            color: Color(0xfff3fbfd),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(48 / 2))),
                                        child: Center(
                                            child: SvgPicture.asset(
                                          'assets/images/meditation.svg',
                                          color: Color(0xff60c8e0),
                                          semanticsLabel: 'Meditation',
                                          width: 20,
                                          height: 20,
                                        ))),
                                    Text(
                                      "Meditation",
                                      style:
                                          TextStyle(color: Color(0xffc2c2c2)),
                                    )
                                  ],
                                )),
                          )),
                          Expanded(
                              child: InkWell(
                            onTap: _goSleep,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff0f1fc),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(48 / 2))),
                                    child: Center(
                                        child: SvgPicture.asset(
                                      'assets/images/sleeping.svg',
                                      color: Color(0xff4050d8),
                                      semanticsLabel: 'Sleep',
                                      width: 20,
                                      height: 20,
                                    ))),
                                Text(
                                  "Sleep",
                                  style: TextStyle(color: Color(0xffc2c2c2)),
                                )
                              ],
                            ),
                          )),
                          Expanded(
                              child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: <Widget>[
                                Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        color: Color(0xfffbf8f4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(48 / 2))),
                                    child: Center(
                                        child: SvgPicture.asset(
                                      'assets/images/premium.svg',
                                      color: Color(0xffd0a75f),
                                      semanticsLabel: 'PLUS',
                                      width: 20,
                                      height: 20,
                                    ))),
                                Text(
                                  "PLUS",
                                  style: TextStyle(color: Color(0xffc2c2c2)),
                                )
                              ],
                            ),
                          )),
                        ],
                      )),
                  InkWell(
                    onTap: _goSoundScene,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                    child: Text("Sound",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff0f0f0f),
                                            fontSize: 24))),
                                Text("More",
                                    style: TextStyle(
                                        color: Color(0xfffa5857),
                                        fontSize: 14)),
                              ],
                            )),
                        Container(
                          height:
                              (MediaQuery.of(context).size.width - 32 - 8 * 4) /
                                  3 *
                                  4 /
                                  3,
                          // give it a fixed height constraint
                          // child ListView
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: exploreStore.sound.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: (MediaQuery.of(context).size.width -
                                        32 -
                                        8 * 4) /
                                    3,
                                margin: const EdgeInsets.only(left: 16),
                                decoration: BoxDecoration(
                                    color: Color(0xfff5f5f5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: InkWell(
                                  onTap: () =>
                                      _goPractice(exploreStore.sound[index]),
                                  child: Center(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(58 / 2)),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                exploreStore.sound[index].img,
                                            width: 58,
                                            height: 58,
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                            top: 12,
                                          ),
                                          child: Text(
                                            exploreStore.sound[index].title,
                                            style: TextStyle(
                                                color: Color(0xffc2c2c2)),
                                          ))
                                    ],
                                  )),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _goMeditation,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                    child: Text("Minis",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff0f0f0f),
                                            fontSize: 24))),
                                InkWell(
                                  onTap: () {},
                                  child: Text("More",
                                      style: TextStyle(
                                          color: Color(0xfffa5857),
                                          fontSize: 14)),
                                )
                              ],
                            )),
                        Container(
                          height:
                              (MediaQuery.of(context).size.width - 32 - 8 * 4) /
                                  3,
                          // give it a fixed height constraint
                          // child ListView
                          child: ListView.builder(
                            itemCount: 10,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: (MediaQuery.of(context).size.width -
                                        32 -
                                        8 * 4) /
                                    4.5,
                                margin: const EdgeInsets.only(left: 16),
                                child: InkWell(
                                  onTap: () {},
                                  child: Center(
                                      child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Material(
                                          elevation: 3,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(58 / 2)),
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(58 / 2)),
                                              child: Image.asset(
                                                'assets/images/adventure.jpg',
                                                width: 58,
                                                height: 58,
                                                fit: BoxFit.cover,
                                              ))),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                            top: 12,
                                          ),
                                          child: Text(
                                            "Galicier",
                                            style: TextStyle(
                                                color: Color(0xffc2c2c2)),
                                          ))
                                    ],
                                  )),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Expanded(
                                    child: Text("Meditation",
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff0f0f0f),
                                            fontSize: 24))),
                                InkWell(
                                  onTap: () {},
                                  child: Text("More",
                                      style: TextStyle(
                                          color: Color(0xfffa5857),
                                          fontSize: 14)),
                                )
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: GridView.count(
                              shrinkWrap: true,
                              childAspectRatio: 1.1,
                              physics: new NeverScrollableScrollPhysics(),
                              // crossAxisCount is the number of columns
                              crossAxisCount: 2,
                              // This creates two columns with two items in each column
                              children: List.generate(
                                  exploreStore.meditation.length, (index) {
                                return InkWell(
                                    onTap: () {},
                                    child: Container(
                                        margin: new EdgeInsets.only(
                                            left: (index % 2 == 0 ? 0 : 8)),
                                        child: Column(
                                          crossAxisAlignment: index % 2 == 0
                                              ? CrossAxisAlignment.start
                                              : CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                                child: CachedNetworkImage(
                                                  imageUrl: exploreStore
                                                      .meditation[index].img,
                                                  width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          32 -
                                                          16) /
                                                      2,
                                                  height:
                                                      ((MediaQuery.of(context)
                                                                      .size
                                                                      .width -
                                                                  32 -
                                                                  16) /
                                                              2) *
                                                          9 /
                                                          16,
                                                  fit: BoxFit.cover,
                                                )),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: Text(
                                                    exploreStore
                                                        .meditation[index]
                                                        .title,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff0f0f0f),
                                                        fontSize: 14))),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4),
                                                child: Text(
                                                    exploreStore
                                                        .meditation[index]
                                                        .description,
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffc2c2c2),
                                                        fontSize: 12))),
                                          ],
                                        )));
                              }),
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _goSleep,
                    child: Container(
                        decoration: BoxDecoration(color: Color(0xff230b39)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 24, bottom: 36, left: 16, right: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                        child: Text("Sleep",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 24))),
                                    InkWell(
                                      onTap: () {},
                                      child: Text("More",
                                          style: TextStyle(
                                              color: Color(0xfffa5857),
                                              fontSize: 14)),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.all(16),
                                child: GridView.count(
                                  shrinkWrap: true,
                                  childAspectRatio: 1.1,
                                  physics: new NeverScrollableScrollPhysics(),
                                  // crossAxisCount is the number of columns
                                  crossAxisCount: 2,
                                  // This creates two columns with two items in each column
                                  children: List.generate(
                                      exploreStore.sleep.length, (index) {
                                    return InkWell(
                                        onTap: () {},
                                        child: Container(
                                            margin: new EdgeInsets.only(
                                                left: (index % 2 == 0 ? 0 : 8)),
                                            child: Column(
                                              crossAxisAlignment: index % 2 == 0
                                                  ? CrossAxisAlignment.start
                                                  : CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: exploreStore
                                                          .sleep[index].img,
                                                      width: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              32 -
                                                              16) /
                                                          2,
                                                      height: ((MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width -
                                                                  32 -
                                                                  16) /
                                                              2) *
                                                          9 /
                                                          16,
                                                      fit: BoxFit.cover,
                                                    )),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8),
                                                    child: Text(
                                                        exploreStore
                                                            .sleep[index].title,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xfff0f0f0),
                                                            fontSize: 14))),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4),
                                                    child: Text(
                                                        exploreStore
                                                            .sleep[index]
                                                            .description,
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffc2c2c2),
                                                            fontSize: 12))),
                                              ],
                                            )));
                                  }),
                                ))
                          ],
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Text("Tide Daily",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0x300f0f0f),
                                      fontSize: 24))),
                          InkWell(
                            onTap: () {},
                            child: Text("More",
                                style: TextStyle(
                                    color: Color(0xfffa5857), fontSize: 14)),
                          )
                        ],
                      )),
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: exploreStore.daily.img != null
                                  ? exploreStore.daily.img
                                  : '',
                              width:
                                  MediaQuery.of(context).size.width - 32 - 32,
                              height:
                                  MediaQuery.of(context).size.width - 32 - 32,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text("28",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700)),
                                  Text("May",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14))
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
                            child: Text(
                              exploreStore.daily.quote != null
                                  ? exploreStore.daily.quote
                                  : '',
                              style: GoogleFonts.cormorant(
                                  color: Color(0xff0f0f0f),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic),
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 16),
                            child: Text(
                              exploreStore.daily.author != null
                                  ? exploreStore.daily.author
                                  : '',
                              style: GoogleFonts.cormorant(
                                  color: Color(0x900f0f0f),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic),
                            )),
                        Divider(
                          height: 1,
                          color: Colors.black,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  child: Row(
                                  children: <Widget>[
                                ConstrainedBox(
                                        child: Swiper(
                                          scrollDirection: Axis.horizontal,
                                          viewportFraction: 0.2,
                                          autoplay: true,
                                          outer: true,
                                          itemBuilder: (c, i) {
                                            return Container(
                                                width: size,
                                                height: size,
                                                transform: Matrix4.translationValues(
                                                    -size * 1 / 4, 0.0, 0.0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.white,
                                                    ),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(size / 2))),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(size / 2)),
                                                  child: CachedNetworkImage(imageUrl: exploreStore.daily.userLike[i],
                                                    width: size,
                                                    height: size,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ));
                                          },
                                          itemCount: 10,
                                          itemHeight: size,
                                          itemWidth: size,
                                          layout: SwiperLayout.CUSTOM,
                                          customLayoutOption:
                                          CustomLayoutOption(stateCount: 7, startIndex: 0)
                                              .addTranslate([
                                            Offset((-4 * 3 / 4 + 1 / 4) * size, 0),
                                            Offset((-2 * 3 / 4 + 1 / 4) * size, 0),
                                            Offset((-1 * 3 / 4 + 1 / 4) * size, 0),
                                            Offset((-0 * 3 / 4 + 1 / 4) * size, 0),
                                            Offset((1 * 3 / 4 + 1 / 4) * size, 0),
                                            Offset((2 * 3 / 4 + 1 / 4) * size, 0),
                                            Offset((4 * 3 / 4 + 1 / 4) * size, 0)
                                          ]),
                                        ),
                                        constraints: new BoxConstraints.loose(
                                            new Size(size * 5 * 3 / 4 + size * 1 / 4, size)))
                                ])
                              ),
                            ),
                            InkWell(
                                child: Container(
                              padding: const EdgeInsets.only(
                                top: 16,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    CommunityMaterialIcons.heart_outline,
                                    color: Colors.black54,
                                    size: 16,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                      ),
                                      child: Text(
                                          '${exploreStore.daily.countLike}',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14)))
                                ],
                              ),
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                  ...List.generate(exploreStore.blog.length, (index) {
                    return Container(
                        margin: const EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 16),
                        child: InkWell(
                            onTap: ()=>_goBlog(exploreStore.blog[index].url),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4))),
                                          child: Text(
                                            exploreStore.blog[index].title,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.red[400]),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, bottom: 4),
                                          child: Text(
                                            exploreStore
                                                .blog[index].description,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500),
                                          ))
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    child: CachedNetworkImage(
                                      imageUrl: exploreStore.blog[index].img,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ))
                              ],
                            )));
                  }),
                  Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: Center(
                          child: Text(
                        "Be calm and mindful with Tide",
                        style: TextStyle(
                            color: Color(0x600f0f0f),
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ))),
                  SvgPicture.asset(
                    "assets/images/wave_bottom.svg",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 323 / 1250,
                    color: Colors.grey,
                  ),
                ],
              )),
            ));
  }
}
