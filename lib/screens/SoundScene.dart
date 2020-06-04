import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solotravel/modals/soundscene/sounds.dart';
import 'package:solotravel/screens/Pratice.dart';
import 'package:solotravel/stores/SoundScene.dart';
import 'package:solotravel/utils/preference.dart';
import 'package:sticky_headers/sticky_headers.dart';

class SoundSceneScreen extends StatefulWidget {
  SoundSceneScreen();

  @override
  _SoundSceneScreenState createState() => _SoundSceneScreenState();
}

class _SoundSceneScreenState extends State<SoundSceneScreen> {
  int selectedIndex = 0;

  ScrollController scrollController = new ScrollController();

  double offsetHeader = 0;

  final soundSceneStore = SoundSceneStore();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        offsetHeader = scrollController.offset >= 0
            ? scrollController.offset > 50 ? 50 : scrollController.offset
            : 0;
      });
    });
    soundSceneStore.getDataSoundScene();
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
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black87),
            title: Opacity(
                opacity: offsetHeader / 50,
                child: Text(
                  "Sound Scene",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ))),
        body: Container(
            color: Colors.white,
            child: SafeArea(
                child: ListView(
              controller: scrollController,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    "Sound Scene",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16, top: 8, bottom: 16),
                    child: Text(
                      "Live in the accoustic world of nature",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    )),
                StickyHeader(
                  header: Container(
                      color: Colors.white,
                      height: 40,
                      padding: EdgeInsets.only(left: 16, bottom: 8),
                      child: Observer(
                          builder: (context) => ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: soundSceneStore.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                      soundSceneStore.selectCategory(soundSceneStore.data[index]);
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 12, right: 12),
                                      margin: EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                          color: selectedIndex == index
                                              ? Colors.grey[300]
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      child: Center(
                                          child: Text(
                                        soundSceneStore.data[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: selectedIndex == index
                                                ? Colors.black87
                                                : Colors.grey),
                                      )),
                                    ),
                                  );
                                },
                              ))),
                  content: Column(
                    children: <Widget>[
                      Divider(),
                  Observer(
                    builder: (context) => GridView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: soundSceneStore.sounds.length,
                        itemBuilder: (BuildContext context, int index) {
                          Sound item = soundSceneStore.sounds[index];
                          return Container(
                            child:  InkWell(
                              onTap: (){
                                _goPractice(item);
                              },
                              child:Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        child: CachedNetworkImage(
                                          imageUrl:  item.img,
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3 -
                                              32,
                                          height: (MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3 -
                                                  32) *
                                              14 /
                                              9,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(),
                                        ),
                                        (item.type == 1
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.green[600],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                4))),
                                                padding: EdgeInsets.only(
                                                    left: 4,
                                                    right: 4,
                                                    top: 2,
                                                    bottom: 2),
                                                margin: EdgeInsets.only(
                                                    top: 8, right: 24),
                                                child: Text(
                                                  "NEW",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xffcca262),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                4))),
                                                padding: EdgeInsets.only(
                                                    left: 4,
                                                    right: 4,
                                                    top: 2,
                                                    bottom: 2),
                                                margin: EdgeInsets.only(
                                                    top: 8, right: 24),
                                                child: Text(
                                                  "PLUS",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ))
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8, bottom: 8),
                                    child: Text(
                                      item.title,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ))
                              ],
                            ),
                          ));
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 3.0,
                          mainAxisSpacing: 3.0,
                          childAspectRatio: 9 / 14,
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ))));
  }
}
