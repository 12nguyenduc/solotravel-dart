
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solotravel/modals/soundscene/sounds.dart';
import 'package:solotravel/utils/log.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'Pratice.dart';

class SleepScreen extends StatefulWidget {
  SleepScreen();

  @override
  _SleepScreenState createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {

  List<int> list = [1, 2, 3, 4, 5,1, 2, 3, 4, 5,1, 2, 3, 4, 5,1, 2, 3, 4, 5,1, 2, 3, 4, 5,1, 2, 3, 4, 5,];

  ScrollController scrollController = new ScrollController();

  double offsetHeader = 0;

  int countItems = Random().nextInt(100);

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
        setState(() {
          offsetHeader = scrollController.offset>=0?scrollController.offset>50?50:scrollController.offset:0;
        });
    });
  }

  _goPractice() {
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
          return PracticeScreen(Sound());
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
      body: Container(
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
                      itemCount: 10,
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
                            onTap: _goPractice,
                            child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ClipRRect(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(58 / 2)),
                                        child: Image.asset(
                                          'assets/images/adventure.jpg',
                                          width: 58,
                                          height: 58,
                                          fit: BoxFit.cover,
                                        )),
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
                        children: List.generate(8, (index) {
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
                                          child: Image.asset(
                                            'assets/images/adventure.jpg',
                                            width: (MediaQuery.of(context).size.width - 32 - 16) / 2,
                                            height: ((MediaQuery.of(context).size.width - 32 - 16) / 2) * 9 / 16,
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8),
                                          child: Text("A Trip to Dunhuang",
                                              style: TextStyle(
                                                  color: Color(0xfff0f0f0),
                                                  fontSize: 14))),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 4),
                                          child: Text("20 MIN - SINGLES",
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
                        children: List.generate(4, (index) {
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
                                          child: Image.asset(
                                            'assets/images/adventure.jpg',
                                            width: (MediaQuery.of(context).size.width - 32 - 16) / 2,
                                            height: ((MediaQuery.of(context).size.width - 32 - 16) / 2) * 9 / 16,
                                            fit: BoxFit.cover,
                                          )),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8),
                                          child: Text("A Trip to Dunhuang",
                                              style: TextStyle(
                                                  color: Color(0xfff0f0f0),
                                                  fontSize: 14))),
                                      Padding(
                                          padding:
                                          const EdgeInsets.only(top: 4),
                                          child: Text("20 MIN - SINGLES",
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
              ))),
    );
  }

}
