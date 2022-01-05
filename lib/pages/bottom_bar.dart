import 'dart:io';
import 'package:mymusic/pages/screens.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  DateTime currentBackPressTime;
  bool play = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 105.0,
        child: BottomAppBar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NowPlaying(
                      tag: '1',
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Hero(
                            tag: '1',
                            child: Container(
                              height: 50.0,
                              width: 55.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/songsCoverPicks/coverImage16.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          widthSpace,
                          widthSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dunya',
                                style: blackColor15SemiBoldTextStyle,
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'Mahir Skekh',
                                style: greyColor11MediumTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: greyColor.withOpacity(0.5),
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_left_outlined,
                              color: blackColor,
                              size: 30,
                            ),
                          ),
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          InkWell(
                            onTap: () {
                              setState(() {
                                play = !play;
                              });
                            },
                            child: Container(
                              height: 38.0,
                              width: 38.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: greyColor.withOpacity(0.5),
                                    spreadRadius: 1.0,
                                    blurRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Icon(
                                play ? Icons.play_arrow : Icons.pause_rounded,
                                color: blackColor,
                                size: 30,
                              ),
                            ),
                          ),
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          Container(
                            height: 30.0,
                            width: 30.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: greyColor.withOpacity(0.5),
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.arrow_right_sharp,
                              color: blackColor,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: greyColor.withOpacity(0.2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                      offset: Offset(0.0, -1.0),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    getBottomBarItemTile(0, Icons.audiotrack),
                    getBottomBarItemTile(1, Icons.local_fire_department),
                    getBottomBarItemTile(2, Icons.library_music),
                    getBottomBarItemTile(3, Icons.settings),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
        child: (currentIndex == 0)
            ? Home()
            : (currentIndex == 1)
                ? Trending()
                : (currentIndex == 2)
                    ? Library()
                    : Settings(),
      ),
    );
  }

  getBottomBarItemTile(int index, icon) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: fixPadding),
        child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: (currentIndex == index)
                ? [
                    Color(0xffff7c00),
                    Color(0xff290a59),
                  ]
                : [
                    blackColor,
                    blackColor,
                  ],
          ).createShader(bounds),
          child: Icon(
            icon,
            size: 35,
          ),
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
