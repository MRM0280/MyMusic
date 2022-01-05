import 'package:mymusic/pages/screens.dart';
import 'dart:ui' as ui;

import 'package:mymusic/widget/column_builder.dart';

class NowPlaying extends StatefulWidget {
  final tag;
  NowPlaying({this.tag});
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  double height;
  double width;
  double _currentSliderValue = 55;
  bool play = false;
  bool favorite = true;

  final nextsongsList = [
    {
      'image': 'assets/images/songsCoverPicks/coverImage14.png',
      'song': "Don't call me up",
      'artist': 'Mabel',
      'isFavorite': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage15.png',
      'song': 'Sugar and brownies',
      'artist': 'Dharia',
      'isFavorite': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage9.png',
      'song': 'Pretty girl',
      'artist': 'Maggie Lindemann',
      'isFavorite': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage5.png',
      'song': 'Shape of you',
      'artist': 'Ed Shreean',
      'isFavorite': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage5.png',
      'song': 'Shape of you',
      'artist': 'Ed Shreean',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          nowPlaying(),
          songDetails(),
          Padding(
            padding: EdgeInsets.only(
              left: fixPadding * 2.0,
              right: fixPadding * 2.0,
            ),
            child: Text(
              'Next on the list',
              style: blackColor15BoldTextStyle,
            ),
          ),
          nextSongsList(),
        ],
      ),
    );
  }

  nowPlaying() {
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
          bottom: 0.0,
          child: Row(
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
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
              ),
              widthSpace,
              GradientText(
                text: 'Now Playing',
                colors: [
                  Color(0xffff7c00),
                  Color(0xff290a59),
                ],
                gradientDirection: GradientDirection.ttb,
                style: semiBold22TextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }

  songDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixPadding),
      child: Column(
        children: [
          Hero(
            tag: widget.tag,
            child: Container(
              height: height * 0.28,
              width: width * 0.47,
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/songsCoverPicks/coverImage17.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Kamado Tanjiro no Uta',
            style: blackColor14SemiBoldTextStyle,
          ),
          SizedBox(height: 2.0),
          Text(
            'Nami Nakagowa',
            style: greyColor9MediumTextStyle,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              fixPadding * 2.0,
              fixPadding * 2.0,
              0.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2:20',
                  style: greyColor9MediumTextStyle,
                ),
                Text(
                  '3:58',
                  style: greyColor9MediumTextStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              fixPadding * 1.5,
              0.0,
              fixPadding * 1.5,
              fixPadding * 2.0,
            ),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 2.5,
                thumbColor: Colors.yellow,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 7.0),
              ),
              child: Slider(
                min: 0,
                max: 100,
                activeColor: Color(0xff290a59),
                inactiveColor: Color(0xffff7c00),
                value: _currentSliderValue,
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.replay_10),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              Container(
                height: 28.0,
                width: 28.0,
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
                  size: 28,
                ),
              ),
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
                  height: 36.0,
                  width: 36.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffff7c00),
                        Color(0xff290a59),
                      ],
                    ),
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
                    color: whiteColor,
                    size: 30,
                  ),
                ),
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              Container(
                height: 28.0,
                width: 28.0,
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
                  size: 28,
                ),
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              Icon(Icons.replay_10),
            ],
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.repeat_rounded,
                size: 20,
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return ui.Gradient.linear(
                    Offset(4.0, 1.0),
                    Offset(4.0, 15.0),
                    [
                      Color(0xffff7c00),
                      Color(0xff290a59),
                    ],
                  );
                },
                child: InkWell(
                  onTap: () {
                    setState(() {
                      favorite = !favorite;
                    });
                  },
                  child: Icon(
                    favorite ? Icons.favorite : Icons.favorite_border,
                    size: 18,
                  ),
                ),
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              Icon(
                Icons.shuffle,
                size: 20.0,
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          Icon(
            Icons.keyboard_arrow_up,
            size: 20,
          ),
          Text(
            'LYRICS',
            style: greyColor9MediumTextStyle,
          ),
        ],
      ),
    );
  }

  nextSongsList() {
    return ColumnBuilder(
      itemCount: nextsongsList.length,
      itemBuilder: (context, index) {
        final item = nextsongsList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            index == 0 ? fixPadding * 1.5 : 0.0,
            fixPadding * 2.0,
            fixPadding * 0.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
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
                        style: blackColor12MediumTextStyle,
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        item['artist'],
                        style: greyColor9MediumTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    item['isFavorite'] = !item['isFavorite'];
                  });
                },
                child: Icon(
                  item['isFavorite'] ? Icons.favorite : Icons.favorite_outline,
                  size: 15,
                  color: greyColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
