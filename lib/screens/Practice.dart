import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:solotravel/modals/sound.dart';

class PracticeScreen extends StatefulWidget {
  Sound sound;
  PracticeScreen(this.sound);

  @override
  _PracticeScreenState createState() => _PracticeScreenState(this.sound);
}

class _PracticeScreenState extends State<PracticeScreen> {
  double size = 18;
  Sound sound;


  _PracticeScreenState(this.sound);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
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
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: sound.img!=null?sound.img:'',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: ConstrainedBox(
                      child: Swiper(
                        scrollDirection: Axis.horizontal,
                        viewportFraction: 0.2,
                        autoplay: true,
                        outer: true,
                        itemBuilder: (c, i) {
                          return Container(
                              width: size,
                              height: size,
                              transform: Matrix4.translationValues(
                                  -size * 1 / 4, 0.0, 0.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(size / 2))),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(size / 2)),
                                child: Image.asset(
                                  'assets/images/adventure.jpg',
                                  width: size,
                                  height: size,
                                  fit: BoxFit.cover,
                                ),
                              ));
                        },
                        itemCount: 10,
                        itemHeight: size,
                        itemWidth: size,
                        layout: SwiperLayout.CUSTOM,
                        customLayoutOption:
                        CustomLayoutOption(stateCount: 7, startIndex: 0)
                            .addTranslate([
                          Offset((-4 * 3 / 4 + 1 / 4) * size, 0),
                          Offset((-2 * 3 / 4 + 1 / 4) * size, 0),
                          Offset((-1 * 3 / 4 + 1 / 4) * size, 0),
                          Offset((-0 * 3 / 4 + 1 / 4) * size, 0),
                          Offset((1 * 3 / 4 + 1 / 4) * size, 0),
                          Offset((2 * 3 / 4 + 1 / 4) * size, 0),
                          Offset((4 * 3 / 4 + 1 / 4) * size, 0)
                        ]),
                      ),
                      constraints: new BoxConstraints.loose(
                          new Size(size * 5 * 3 / 4 + size * 1 / 4, size)))
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                '''Stress hormone levels fell by nearly twice as much in tea drinkers compared with those given a tea-like drink, after all had been put under stress.
            ''',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
