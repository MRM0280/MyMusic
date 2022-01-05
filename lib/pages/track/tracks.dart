import 'package:mymusic/pages/screens.dart';
import 'dart:ui' as ui;

import 'package:mymusic/widget/column_builder.dart';

class Tracks extends StatefulWidget {
  @override
  _TracksState createState() => _TracksState();
}

class _TracksState extends State<Tracks> {
  double height;
  String selected = 'Name';
  bool play = false;

  final songsList = [
    {
      'song': 'Leave Me Lonely',
      'artist': 'Ariana Grande',
    },
    {
      'song': 'There’s Nothing Holdin’ Me Back',
      'artist': 'Shawn Mendes',
    },
    {
      'song': 'Yeh Dosti  Hum Nahi Todenge',
      'artist': 'Kishore Kumar And RD Barman',
    },
    {
      'song': 'Bhanware Ki Gunjan',
      'artist': 'Kishore Kumar',
    },
    {
      'song': 'Dangerous Woman',
      'artist': 'Ariana Grande',
    },
    {
      'song': 'Party Rock Anthem',
      'artist': 'GoonRock',
    },
    {
      'song': 'What Makes You Beautiful',
      'artist': 'One Direction',
    },
    {
      'song': 'Neele Neele Ambar Par ',
      'artist': 'Kishore Kumar',
    },
    {
      'song': 'Rim Jhim Gire Sawan ',
      'artist': 'Hasrat Jaipuri',
    },
    {
      'song': 'Aate Jaate Khoobsurat Awara Sad....',
      'artist': 'Kishore Kumar',
    },
    {
      'song': 'Leave Me Lonely',
      'artist': 'Ariana Grande',
    },
    {
      'song': 'There’s Nothing Holdin’ Me Back',
      'artist': 'Shawn Mendes',
    },
    {
      'song': 'Dangerous Woman',
      'artist': 'Ariana Grande',
    },
    {
      'song': 'Aate Jaate Khoobsurat Awara Sad....',
      'artist': 'Kishore Kumar',
    },
    {
      'song': 'Party Rock Anthem',
      'artist': 'GoonRock',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          tracks(),
          menu(),
          songList(),
        ],
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  tracks() {
    return Stack(
      children: [
        Container(
          height: height * 0.20,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/corner-design.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          right: 20.0,
          bottom: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return ui.Gradient.linear(
                        Offset(4.0, 11.0),
                        Offset(4.0, 20.0),
                        [
                          Color(0xffff7c00),
                          Color(0xff290a59),
                        ],
                      );
                    },
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                  widthSpace,
                  GradientText(
                    text: 'Tracks',
                    colors: [
                      Color(0xffff7c00),
                      Color(0xff290a59),
                    ],
                    gradientDirection: GradientDirection.ttb,
                    style: semiBold22TextStyle,
                  ),
                ],
              ),
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Search()),
                ),
                child: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  menu() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PopupMenuButton(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                height: 30.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected = 'Name';
                            });
                            Navigator.pop(context);
                          },
                          child: GradientText(
                            text: 'Name',
                            colors: selected == 'Name'
                                ? [
                                    Color(0xffff7c00),
                                    Color(0xff290a59),
                                  ]
                                : [
                                    blackColor,
                                    blackColor,
                                  ],
                            gradientDirection: GradientDirection.ttb,
                            style: medium12TextStyle,
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        ShaderMask(
                          blendMode: BlendMode.srcATop,
                          shaderCallback: (Rect bounds) => LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffff7c00),
                              Color(0xff290a59),
                            ],
                          ).createShader(bounds),
                          child: selected == 'Name'
                              ? Icon(
                                  Icons.done,
                                  size: 15,
                                )
                              : Text(''),
                        ),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected = 'Date Added';
                            });
                            Navigator.pop(context);
                          },
                          child: GradientText(
                            text: 'Date Added',
                            colors: selected == 'Date Added'
                                ? [
                                    Color(0xffff7c00),
                                    Color(0xff290a59),
                                  ]
                                : [
                                    blackColor,
                                    blackColor,
                                  ],
                            gradientDirection: GradientDirection.ttb,
                            style: medium12TextStyle,
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        ShaderMask(
                          blendMode: BlendMode.srcATop,
                          shaderCallback: (Rect bounds) => LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffff7c00),
                              Color(0xff290a59),
                            ],
                          ).createShader(bounds),
                          child: selected == 'Date Added'
                              ? Icon(
                                  Icons.done,
                                  size: 15,
                                )
                              : Text(''),
                        ),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected = 'Artist';
                            });
                            Navigator.pop(context);
                          },
                          child: GradientText(
                            text: 'Artist',
                            colors: selected == 'Artist'
                                ? [
                                    Color(0xffff7c00),
                                    Color(0xff290a59),
                                  ]
                                : [
                                    blackColor,
                                    blackColor,
                                  ],
                            gradientDirection: GradientDirection.ttb,
                            style: medium12TextStyle,
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        ShaderMask(
                          blendMode: BlendMode.srcATop,
                          shaderCallback: (Rect bounds) => LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffff7c00),
                              Color(0xff290a59),
                            ],
                          ).createShader(bounds),
                          child: selected == 'Artist'
                              ? Icon(
                                  Icons.done,
                                  size: 15,
                                )
                              : Text(''),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
            child: Icon(
              Icons.menu,
              size: 18,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.shuffle,
                size: 18,
              ),
              widthSpace,
              widthSpace,
              Icon(
                Icons.play_circle_rounded,
                size: 18,
              ),
            ],
          ),
        ],
      ),
    );
  }

  songList() {
    return ColumnBuilder(
      itemCount: songsList.length,
      itemBuilder: (context, index) {
        final item = songsList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0.0,
            fixPadding * 2.0,
            fixPadding,
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NowPlaying(
                  tag: songsList[index],
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: songsList[index],
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xffff7c00),
                              Color(0xff290a59),
                            ],
                          ),
                        ),
                        child: Icon(
                          Icons.audiotrack,
                          color: whiteColor,
                        ),
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['song'],
                          style: blackColor13MediumTextStyle,
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          item['artist'],
                          style: greyColor10MediumTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                PopupMenuButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      height: 30.0,
                      value: 'Share',
                      child: Text(
                        'Share',
                        style: blackColor12MediumTextStyle,
                      ),
                    ),
                    PopupMenuItem(
                      height: 30.0,
                      value: 'Track Details',
                      child: Text(
                        'Track Details',
                        style: blackColor12MediumTextStyle,
                      ),
                    ),
                    PopupMenuItem(
                      height: 30.0,
                      value: 'Add to Playlist',
                      child: Text(
                        'Add to Playlist',
                        style: blackColor12MediumTextStyle,
                      ),
                    ),
                    PopupMenuItem(
                      height: 30.0,
                      value: 'Album',
                      child: Text(
                        'Album',
                        style: blackColor12MediumTextStyle,
                      ),
                    ),
                    PopupMenuItem(
                      height: 30.0,
                      value: 'Artist',
                      child: Text(
                        'Artist',
                        style: blackColor12MediumTextStyle,
                      ),
                    ),
                    PopupMenuItem(
                      height: 30.0,
                      value: 'Set as',
                      child: Text(
                        'Set as',
                        style: blackColor12MediumTextStyle,
                      ),
                    ),
                  ],
                  child: Icon(
                    Icons.more_vert,
                    color: greyColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bottomBar() {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NowPlaying(
            tag: 'tracks',
          ),
        ),
      ),
      child: Container(
        height: 50.0,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'tracks',
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
