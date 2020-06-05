
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solotravel/modals/sound.dart';
import 'package:solotravel/stores/MeditationStore.dart';
import 'package:solotravel/utils/log.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'Practice.dart';

class MeditationScreen extends StatefulWidget {
  MeditationScreen();

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {


  ScrollController scrollController = new ScrollController();

  double offsetHeader = 0;

  final meditationStore = MeditationStore();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
        setState(() {
          offsetHeader = scrollController.offset>=0?scrollController.offset>50?50:scrollController.offset:0;
        });
    });
    meditationStore.getDataMeditation();
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
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Opacity(
        opacity: offsetHeader/50,
        child:  Text(
          "Meditation",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        )),
      ),
      body: Observer(
    builder: (context) => Container(
          color: Colors.white,
          child: SafeArea(
              child: ListView(
                controller: scrollController,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 16),
                    child: Text(
                      "Meditation",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                  Padding(
                      padding:
                      EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                      child: Text(
                        "A short period each day, follow your\nbreathing and create a space of relaxation.",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )),
          Padding(padding: EdgeInsets.all(16), child: InkWell(
            onTap: ()=>_goPractice(meditationStore.daily),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3), borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Row(children: <Widget>[
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Daily Tide",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      meditationStore.daily.title!=null?meditationStore.daily.title:"",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],)),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: CachedNetworkImage(imageUrl: meditationStore.daily.img!=null?meditationStore.daily.img:'', width: 30, height: 30, fit: BoxFit.cover,),)
              ],

              ),),)),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 36, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Text("Minis",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black87,
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
                    height: (MediaQuery.of(context).size.width - 32 - 8 * 4) / 3,
                    // give it a fixed height constraint
                    // child ListView
                    child: ListView.builder(
                      itemCount: 10,
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: (MediaQuery.of(context).size.width - 32 - 8 * 4) / 4.5,
                          margin: const EdgeInsets.only(left: 16),
                          child: InkWell(
                            onTap: () {},
                            child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Material(
                                        elevation: 3,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(58 / 2)),
                                        child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(58 / 2)),
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
                                          style: TextStyle(color: Color(0xffc2c2c2)),
                                        ))
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 36, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                Text("Singles",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87,
                                        fontSize: 24)),
                                  Padding(padding: EdgeInsets.only(top: 8),
                                  child:Text("Anytime, anywhere",
                                      style: TextStyle(color: Colors.grey, fontSize: 14)))
                        ],)
                              ),
                          InkWell(
                            onTap: () {},
                            child:
                            Text("More",
                                style: TextStyle(
                                    color: Color(0xfffa5857), fontSize: 14)),
                          )
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.count(
                        shrinkWrap: true,
                        childAspectRatio: 1.1,
                        physics: new NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(meditationStore.singles.length, (index) {
                          return InkWell(
                              onTap: ()=>_goPractice(meditationStore.singles[index]),
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
                                          child: CachedNetworkImage(imageUrl: meditationStore.singles[index].img,
                                            width: (MediaQuery.of(context).size.width - 32 - 16) / 2,
                                            height: ((MediaQuery.of(context).size.width - 32 - 16) / 2) * 9 / 16,
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8),
                                          child: Text(meditationStore.singles[index].title,
                                              style: TextStyle(
                                                  color: Color(0xff0f0f0f),
                                                  fontSize: 14))),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 4),
                                          child: Text(meditationStore.singles[index].description,
                                              style: TextStyle(
                                                  color: Color(0xff2c2c2c),
                                                  fontSize: 12))),
                                    ],
                                  )));
                        }),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 36, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text("Basic",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87,
                                          fontSize: 24)),
                                  Padding(padding: EdgeInsets.only(top: 8),
                                      child:Text("Basics of meditation",
                                          style: TextStyle(color: Colors.grey, fontSize: 14)))
                                ],)
                          ),
                          InkWell(
                            onTap: () {},
                            child:
                            Text("More",
                                style: TextStyle(
                                    color: Color(0xfffa5857), fontSize: 14)),
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
                        children: List.generate(meditationStore.basic.length, (index) {
                          return InkWell(
                              onTap: ()=>_goPractice(meditationStore.basic[index]),
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
                                          child: CachedNetworkImage(imageUrl: meditationStore.basic[index].img,
                                            width: (MediaQuery.of(context).size.width - 32 - 16) / 2,
                                            height: ((MediaQuery.of(context).size.width - 32 - 16) / 2) * 9 / 16,
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8),
                                          child: Text(meditationStore.basic[index].title,
                                              style: TextStyle(
                                                  color: Color(0xff0f0f0f),
                                                  fontSize: 14))),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 4),
                                          child: Text(meditationStore.basic[index].description,
                                              style: TextStyle(
                                                  color: Color(0xffc2c2c2),
                                                  fontSize: 12))),
                                    ],
                                  )));
                        }),
                      )),
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
              )))),
    );
  }

}
