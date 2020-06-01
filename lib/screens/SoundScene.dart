import 'dart:ui';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SoundSceneScreen extends StatefulWidget {
  SoundSceneScreen();

  @override
  _SoundSceneScreenState createState() => _SoundSceneScreenState();
}

class _SoundSceneScreenState extends State<SoundSceneScreen> {
  List listTime = [
    '05',
    '08',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '55',
    '60',
    '70',
    '80',
    '90',
    '100',
    '110',
    '120',
    '130',
    '140',
    '150',
    '160',
    '170',
    '180'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SafeArea(
              child:
              CustomScrollView(
                slivers: <Widget>[
                  ///First sliver is the App Bar
                  SliverAppBar(
                    ///Properties of app bar
                    backgroundColor: Colors.white,
                    floating: false,
                    pinned: true,
                    expandedHeight: 200.0,

                    ///Properties of the App Bar when it is expanded
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Row(children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 28),
                        child: Text(
                          "Sound Scene",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,),
                        ))
                      ],),
                      background: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.black26,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return new Container(
                          child: Text("$index"),
                          height: 150.0);
                    }
                )
              ),]
            ))
    );
  }
}
