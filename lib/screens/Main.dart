
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Explore.dart';
import 'Home.dart';
import 'Profile.dart';

class MainScreen extends StatefulWidget {

  static MainScreen _instance = new MainScreen._();

  factory MainScreen() => _instance;

  MainScreen._();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  static final Widget homeScreen = new HomeScreen();
  static final Widget exploreScreen = new ExploreScreen();
  static final Widget profileScreen = new ProfileScreen();

  List<Widget> widgets =[homeScreen, exploreScreen, profileScreen];

  int selectedIndex = 0;


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar:

        BottomNavigationBar(
            elevation: selectedIndex==0?0:5,
            currentIndex: selectedIndex,
            unselectedItemColor:
            selectedIndex == 0 ? Colors.grey[600] : Color(0xffe7e7e7),
            selectedItemColor:
            selectedIndex == 0 ? Colors.white60 : Colors.grey[600],
            onTap: _onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor:
            selectedIndex == 0 ? Color(0x00000000) : Colors.white,
            // transparent
            type: BottomNavigationBarType.fixed,
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/home.svg", width: 24, height: 24, color: selectedIndex == 0 ?Colors.white: (selectedIndex == 0 ? Colors.grey[600] : Color(0xffe7e7e7)),),
                  title: Text("")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/compass.svg", width: 24, height: 24, color: selectedIndex == 0 ?(selectedIndex == 0 ? Colors.grey[600] : Color(0xffe7e7e7)):(selectedIndex == 1 ? Colors.grey[600] : Color(0xffe7e7e7))),
                  title: Text("")),
              BottomNavigationBarItem(
                  icon: Icon(CommunityMaterialIcons.circle_outline),
                  title: Text("")),
            ]),
        body: widgets[selectedIndex]
    );
  }


}
