import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  PracticeScreen();

  @override
  _PracticeScreenState createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(child: InkWell(
            onTap: (){Navigator.of(context).pop();},
            child:Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(36 / 2))),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,
            ),
          ),
        ))),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/adventure.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(padding: EdgeInsets.all(24),
            child: Text('''Stress hormone levels fell by nearly twice as much in tea drinkers compared with those given a tea-like drink, after all had been put under stress.
            ''', style: TextStyle(fontSize: 16),),)
          ],
        ),
      ),
    );
  }
}
