
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solotravel/modals/sound.dart';
import 'package:solotravel/stores/SleepStore.dart';
import 'package:solotravel/utils/log.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'Practice.dart';

class SleepScreen extends StatefulWidget {
  SleepScreen();

  @override
  _SleepScreenState createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {

  final sleepStore = SleepStore();

  ScrollController scrollController = new ScrollController();

  double offsetHeader = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
        setState(() {
          offsetHeader = scrollController.offset>=0?scrollController.offset>50?50:scrollController.offset:0;
        });
    });
    sleepStore.getDataSleep();
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
        iconTheme: IconThemeData(color: Colors.white),
        title: Opacity(
        opacity: offsetHeader/50,
        child:  Text(
          "Sleep",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        )),
      ),
      body: Observer(
    builder: (context) => Container(
          color: Colors.black,
          child: SafeArea(
              child: ListView(
                controller: scrollController,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 16),
                    child: Text(
                      "Sleep",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                      padding:
                      EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
                      child: Text(
                        "Sleep tight, enjoy life",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      )),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 36, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: Text("Sleep-aid Sound",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
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
                    height: (MediaQuery.of(context).size.width - 32 - 8 * 4) /
                        3 *
                        4 /
                        3,
                    // give it a fixed height constraint
                    // child ListView
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: sleepStore.sleepAid.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width:
                          (MediaQuery.of(context).size.width - 32 - 8 * 4) /
                              3,
                          margin: const EdgeInsets.only(left: 16),
                          decoration: BoxDecoration(
                              color: Color(0xff1f1f1f),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          child: InkWell(
                            onTap: ()=>_goPractice(sleepStore.sleepAid[index]),
                            child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ClipRRect(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(58 / 2)),
                                        child: CachedNetworkImage(
                                          imageUrl: sleepStore.sleepAid[index].img,
                                          width: 58,
                                          height: 58,
                                          fit: BoxFit.cover,
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                          top: 12,
                                        ),
                                        child: Text(
                                          sleepStore.sleepAid[index].title,
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
                                Text("Night",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 24)),
                                  Padding(padding: EdgeInsets.only(top: 8),
                                  child:Text("Deep into the night",
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
                        children: List.generate(sleepStore.night.length, (index) {
                          return InkWell(
                              onTap: ()=>_goPractice(sleepStore.night[index]),
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
                                          child: CachedNetworkImage(imageUrl :sleepStore.sleepAid[index].img,
                                            width: (MediaQuery.of(context).size.width - 32 - 16) / 2,
                                            height: ((MediaQuery.of(context).size.width - 32 - 16) / 2) * 9 / 16,
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8),
                                          child: Text(sleepStore.sleepAid[index].title,
                                              style: TextStyle(
                                                  color: Color(0xfff0f0f0),
                                                  fontSize: 14))),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 4),
                                          child: Text(sleepStore.sleepAid[index].description,
                                              style: TextStyle(
                                                  color: Color(0xffc2c2c2),
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
                                  Text("Daytime",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 24)),
                                  Padding(padding: EdgeInsets.only(top: 8),
                                      child:Text("After sunrise",
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
                        children: List.generate(sleepStore.daytime.length, (index) {
                          return InkWell(
                              onTap: ()=>_goPractice(sleepStore.daytime[index]),
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
                                          child: CachedNetworkImage(imageUrl: sleepStore.daytime[index].img,
                                            width: (MediaQuery.of(context).size.width - 32 - 16) / 2,
                                            height: ((MediaQuery.of(context).size.width - 32 - 16) / 2) * 9 / 16,
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8),
                                          child: Text(sleepStore.daytime[index].title,
                                              style: TextStyle(
                                                  color: Color(0xfff0f0f0),
                                                  fontSize: 14))),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 4),
                                          child: Text(sleepStore.daytime[index].description,
                                              style: TextStyle(
                                                  color: Color(0xffc2c2c2),
                                                  fontSize: 12))),
                                    ],
                                  )));
                        }),
                      )),
                  Padding(padding: EdgeInsets.all(16), child: InkWell(

                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(color: Color(0xff1f1f1f), borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Row(children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text(
                        "Sleep-aid Breath",
                        style: TextStyle(
                            color: Color(0x60f0f0f0),
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ),
                        Text(
                          "4-7-8 Breath",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        ),
                      ],)
                    ],),),)),
                  Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: Center(
                          child: Text(
                            "Be calm and mindful with Tide",
                            style: TextStyle(
                                color: Color(0x60f0f0f0),
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
              ))),)
    );
  }

}
