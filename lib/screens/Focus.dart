import 'dart:ui';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FocusScreen extends StatefulWidget {
  FocusScreen();

  @override
  _FocusScreenState createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
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
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Container(
            color: Colors.black.withOpacity(0.3),
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height,
//              child: Text(' '),
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                "Focus",
              ),
            ),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        child: Center(
                            child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.3))),
                          child: Stack(
                            children: <Widget>[
                              CupertinoPicker(
                                backgroundColor: Colors.transparent,
                                diameterRatio: 1.1,
                                magnification: 1,
                                squeeze: 1.45,
                                itemExtent: 50,
                                onSelectedItemChanged: (int index) {
                                  print(index);
                                },
                                children: <Widget>[
                                  ...(listTime.map((t) => Center(
                                          child: Text(
                                        t,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 32),
                                      ))))
                                ],
                              ),
                              Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      '0000',
                                      style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.transparent),
                                    ),
                                    Text('min',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.3),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              )
                            ],
                          )),
                    ))),
                  ),
                  Container(
                      child: Center(
                    child: Container(
                        margin: EdgeInsets.only(top: 48, bottom: 48),
                        child: InkWell(
                          child: Material(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            elevation: 4,
                            child: Container(
                              height: 48,
                              padding:
                                  const EdgeInsets.only(left: 24, right: 24),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.play,
                                    size: 14,
                                    color: Colors.grey[700],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      "START",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                  )),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                    context: context,
                                    backgroundColor: Colors.transparent,
                                    builder: (BuildContext context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.only(
                                                topLeft: Radius
                                                    .circular(20),
                                                topRight: Radius
                                                    .circular(
                                                    20))),
                                          child: SafeArea(
                                              child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 16,
                                                                  bottom: 16),
                                                          child: Center(
                                                            child: Text(
                                                              "Focus Mode",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          )),
                                                      InkWell(
                                                          child: Padding(
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .amber,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(48 /
                                                                              2))),
                                                              child: Center(
                                                                child: Icon(
                                                                  FontAwesomeIcons
                                                                      .clock,
                                                                  size: 24,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                left: 16,
                                                              ),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "Timer Mode",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black87),
                                                                    ),
                                                                    Text(
                                                                      "Set a timer, stay focused",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              13,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                  ]),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                      InkWell(
                                                          child: Padding(
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .deepOrange,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(48 /
                                                                              2))),
                                                              child: Center(
                                                                child: Icon(
                                                                  CommunityMaterialIcons
                                                                      .clock,
                                                                  size: 24,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                left: 16,
                                                              ),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "Work Mode",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black87),
                                                                    ),
                                                                    Text(
                                                                      "Based on Pomodoro Techniques",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              13,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                  ]),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                      InkWell(
                                                          child: Padding(
                                                        padding:
                                                            EdgeInsets.all(16),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Container(
                                                              width: 40,
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .pink,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(48 /
                                                                              2))),
                                                              child: Center(
                                                                child: Icon(
                                                                  CommunityMaterialIcons
                                                                      .infinity,
                                                                  size: 24,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                left: 16,
                                                              ),
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "Infinite Mode",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.black87),
                                                                    ),
                                                                    Text(
                                                                      "Set a count-up timer at anytime",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              13,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                  ]),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                    ],
                                                  ))
                                      );
                                    });
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.clock,
                                    size: 20,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text("Focus Mode",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0x68ffffff))),
                                  )
                                ],
                              ))),
                      Expanded(
                          child: InkWell(
                              child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.tag,
                            size: 20,
                            color: Colors.white.withOpacity(0.6),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text("Focus tag",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0x68ffffff))),
                          )
                        ],
                      ))),
                      Expanded(
                          child: InkWell(
                              child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.divide,
                            size: 20,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text("Sound Scene",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0x68ffffff))),
                          )
                        ],
                      ))),
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}
