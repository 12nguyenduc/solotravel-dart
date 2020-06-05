import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:solotravel/components/LazyListView.dart';
import 'package:solotravel/modals/sound.dart';
import 'package:solotravel/screens/Main.dart';
import 'webthread/webthread.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  MyApp() {
//    WebThread();
    WidgetsFlutterBinding.ensureInitialized();
    FlutterDownloader.initialize(
        debug: true // optional: set false to disable printing logs to console
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  TestScreen();

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  double size = 22;
  List<String> listAvatar = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  List<Widget> avatars(){
    List<Widget> list = [];
    for(int i=0; i<5; i++){
      list.add(
          Container(
              margin: EdgeInsets.only(left: i*size*3/4),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(size / 2))),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(size / 2)),
                child: Image.asset(
                  'assets/images/adventure.jpg',
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                ),
              )
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: SafeArea(
          child: Container(
        child:
        Column(children: <Widget>[
          Stack(
            children: <Widget>[
              ...avatars()
            ],
          ),
          FlatButton(onPressed: () {

          },
          child:
            Text("Add Item"),

          ),
          Container(
              color: Colors.white,
              child:
          ConstrainedBox(
              child:
              Swiper(
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.2,
                autoplay: true,
                outer: true,
                itemBuilder: (c, i) {
                  return Container(
                      width: size,
                      height: size,
                      transform: Matrix4.translationValues(-size*1/4, 0.0, 0.0),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(size / 2))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
                        child: Image.asset(
                          'assets/images/adventure.jpg',
                          width: size,
                          height: size,
                          fit: BoxFit.cover,
                        ),
                      )
                  );
                },
                itemCount: 10,
                itemHeight: size,
                itemWidth: size,
                layout: SwiperLayout.CUSTOM,
                customLayoutOption: CustomLayoutOption(stateCount: 5,startIndex: 0).addTranslate([Offset((-2*3/4+1/4)*size, 0), Offset((-1*3/4+1/4)*size, 0), Offset((-0*3/4+1/4)*size, 0), Offset((1*3/4+1/4)*size, 0), Offset((2*3/4+1/4)*size, 0) ]),
              ),
              constraints:new BoxConstraints.loose(new Size(size*5*3/4+size*1/4, size))
          )),
          ConstrainedBox(
              child:
              Swiper(
                scrollDirection: Axis.horizontal,
                viewportFraction: 0.2,
                autoplay: true,
                outer: true,
                itemBuilder: (c, i) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(size / 2))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(size / 2)),
                        child: Image.asset(
                          'assets/images/adventure.jpg',
                          width: size,
                          height: size,
                          fit: BoxFit.cover,
                        ),
                      )
                  );
                },
                itemCount: 100,
                layout: SwiperLayout.STACK,
                itemWidth: size,
                itemHeight: size,
                scale: 1,
              ),
              constraints:new BoxConstraints.loose(new Size(size*5*3/4, size))
          ),

        ],)


      )),
    );
  }
}

