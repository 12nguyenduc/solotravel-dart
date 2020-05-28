import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  static ProfileScreen _instance = new ProfileScreen._();

  factory ProfileScreen() => _instance;

  ProfileScreen._();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
            padding:
                const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 4),
                        child: Text(
                          "Nguyen Van Duc",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.black87),
                        ),
                      ),
                      Text(
                        "Joined Tide for 27 days",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 68,
                  width: 68,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(68 / 2))),
                  child: Center(
                    child: Icon(CommunityMaterialIcons.account,
                        size: 40, color: Colors.grey),
                  ),
                )
              ],
            )),
        Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Color(0xff4a4953),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Join",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffcca262)),
                              ),
                              Text(
                                " TIDE",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xffcca262)),
                              ),
                              Text(
                                " Plus",
                                style: GoogleFonts.rougeScript(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200,
                                    color: Color(0xffcca262)),
                              ),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text("30-Days Free Trial for New",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ))),
                        ],
                      ))),
              InkWell(
                child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 1, color: Color(0xffcca262))),
                    child: Text(
                      "Join",
                      style: TextStyle(fontSize: 12, color: Color(0xffcca262)),
                    )),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      CommunityMaterialIcons.bell,
                      color: Color(0xffd7d8e0),
                      size: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Reminder",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff939393)),
                        )),
                  ],
                ),
              )),
              Expanded(
                  child: InkWell(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      CommunityMaterialIcons.calendar_heart,
                      color: Color(0xffd7d8e0),
                      size: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Favorite",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff939393)),
                        )),
                  ],
                ),
              )),
              Expanded(
                  child: InkWell(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      CommunityMaterialIcons.clock,
                      color: Color(0xffd7d8e0),
                      size: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Recent",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff939393)),
                        )),
                  ],
                ),
              )),
              Expanded(
                  child: InkWell(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      CommunityMaterialIcons.chat,
                      color: Color(0xffd7d8e0),
                      size: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Message",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff939393)),
                        )),
                  ],
                ),
              )),
              Expanded(
                  child: InkWell(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      CommunityMaterialIcons.settings,
                      color: Color(0xffd7d8e0),
                      size: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Settings",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff939393)),
                        )),
                  ],
                ),
              )),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Color(0xfff2f2f7)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "TODAY",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  )),
                  InkWell(
                      child: Text(
                    "All",
                    style: TextStyle(fontSize: 16, color: Colors.red[300]),
                  ))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    InkWell(
                        child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: Colors.deepOrangeAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4))),
                                          child: Center(
                                              child: Icon(
                                            CommunityMaterialIcons
                                                .radiobox_marked,
                                            size: 14,
                                            color: Colors.white,
                                          ))),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            "Focus",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xffbfbfbf),
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ),
                                Icon(CommunityMaterialIcons.chevron_right,
                                    size: 16, color: Color(0xffbfbfbf))
                              ],
                            ))),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "100",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 4, left: 4),
                            child: Text(
                              "min",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffbfbfbf),
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    InkWell(
                        child: Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              color: Colors.deepPurple,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4))),
                                          child: Center(
                                              child: Icon(
                                            CommunityMaterialIcons
                                                .weather_night,
                                            size: 14,
                                            color: Colors.white,
                                          ))),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            "Sleep",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xffbfbfbf),
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ),
                                Icon(CommunityMaterialIcons.chevron_right,
                                    size: 16, color: Color(0xffbfbfbf))
                              ],
                            ))),
                    Divider(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "100",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 4, left: 4),
                            child: Text(
                              "min",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffbfbfbf),
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(bottom: 16, right: 8,),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.white),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                            child: Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(bottom: 48),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: Colors.lightBlue,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4))),
                                            child: Center(
                                                child: Icon(
                                              CommunityMaterialIcons.google_circles_communities,
                                              size: 14,
                                              color: Colors.white,
                                            ))),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                              "Meditation",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xffbfbfbf),
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "100",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 4, left: 4),
                                          child: Text(
                                            "min",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xffbfbfbf),
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  )),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 6, left: 4),
                                      child: Icon(
                                          CommunityMaterialIcons.chevron_right,
                                          size: 16,
                                          color: Color(0xffbfbfbf)))
                                ],
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  )),
                  Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16, left: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.white),
                        child: Column(
                          children: <Widget>[
                            InkWell(
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(bottom: 48),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                        padding: const EdgeInsets.all(4),
                                                        decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(4))),
                                                        child: Center(
                                                            child: Icon(
                                                              CommunityMaterialIcons
                                                                  .leaf,
                                                              size: 14,
                                                              color: Colors.white,
                                                            ))),
                                                    Padding(
                                                        padding:
                                                        const EdgeInsets.only(left: 8),
                                                        child: Text(
                                                          "Breath",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Color(0xffbfbfbf),
                                                              fontWeight: FontWeight.bold),
                                                        ))
                                                  ],
                                                ),
                                              )),
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(
                                                    "100",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: Colors.black87,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  Padding(
                                                      padding: const EdgeInsets.only(
                                                          bottom: 4, left: 4),
                                                      child: Text(
                                                        "min",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(0xffbfbfbf),
                                                            fontWeight: FontWeight.bold),
                                                      )),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 6, left: 4),
                                              child: Icon(
                                                  CommunityMaterialIcons.chevron_right,
                                                  size: 16,
                                                  color: Color(0xffbfbfbf)))
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
