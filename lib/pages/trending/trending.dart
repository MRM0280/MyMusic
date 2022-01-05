import 'package:mymusic/pages/screens.dart';
import 'dart:ui' as ui;

import 'package:mymusic/widget/column_builder.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  double height;
  double width;
  String isSelected = 'all';

  final trendingSongsList = [
    {
      'image': 'assets/images/songsCoverPicks/coverImage5.png',
      'song': 'Shape Of You',
      'artist': 'Ed Shreean',
      'hastag': '1',
      'plays': '2.5 M',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage6.png',
      'song': 'Waka Waka',
      'artist': 'Shakira',
      'hastag': '2',
      'plays': '2.2 M',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage7.png',
      'song': 'Let Her Go',
      'artist': 'Passenger',
      'hastag': '3',
      'plays': '2.0 M',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage8.png',
      'song': 'See You Again',
      'artist': 'Wiz Khalifa',
      'hastag': '4',
      'plays': '1.5 M',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage9.png',
      'song': 'Pretty Girl',
      'artist': 'Maggie lindemann',
      'hastag': '5',
      'plays': '1.0 M',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          trending(),
          menu(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Text(
              'Top Trending 2020',
              style: blackColor15SemiBoldTextStyle,
            ),
          ),
          trendingList(),
        ],
      ),
    );
  }

  trending() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
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
                    Offset(4.0, 8.0),
                    Offset(4.0, 20.0),
                    [
                      Color(0xffff7c00),
                      Color(0xff290a59),
                    ],
                  );
                },
                child: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 30,
                ),
              ),
              widthSpace,
              GradientText(
                text: 'Trending',
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

  menu() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isSelected = 'all';
                });
              },
              child: Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: isSelected == 'all'
                      ? LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff290a59),
                            Color(0xffff7c00),
                          ],
                        )
                      : LinearGradient(
                          colors: [
                            greyColor.withOpacity(0.2),
                            greyColor.withOpacity(0.2),
                          ],
                        ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  'ALL',
                  style: TextStyle(
                    color: isSelected == 'all' ? whiteColor : greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isSelected = 'hip-pop';
                });
              },
              child: Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: isSelected == 'hip-pop'
                      ? LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff290a59),
                            Color(0xffff7c00),
                          ],
                        )
                      : LinearGradient(
                          colors: [
                            greyColor.withOpacity(0.2),
                            greyColor.withOpacity(0.2),
                          ],
                        ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  'HIP-HOP',
                  style: TextStyle(
                    color: isSelected == 'hip-pop' ? whiteColor : greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  isSelected = 'podcasts';
                });
              },
              child: Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: isSelected == 'podcasts'
                      ? LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff290a59),
                            Color(0xffff7c00),
                          ],
                        )
                      : LinearGradient(
                          colors: [
                            greyColor.withOpacity(0.2),
                            greyColor.withOpacity(0.2),
                          ],
                        ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  'PODCASTS',
                  style: TextStyle(
                    color: isSelected == 'podcasts' ? whiteColor : greyColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  trendingList() {
    return ColumnBuilder(
      itemCount: trendingSongsList.length,
      itemBuilder: (context, index) {
        final item = trendingSongsList[index];
        return Padding(
          padding: index == 0
              ? EdgeInsets.all(fixPadding * 2.0)
              : EdgeInsets.fromLTRB(
                  fixPadding * 2.0, 0.0, fixPadding * 2.0, fixPadding * 2.0),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NowPlaying(
                  tag: trendingSongsList[index],
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: trendingSongsList[index],
                      child: Container(
                        height: height * 0.12,
                        width: width * 0.23,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: AssetImage(item['image']),
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
                        Container(
                          padding: EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xffff7c00),
                                Color(0xff290a59),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            '#${item['hastag']}',
                            style: whiteColor8MediumTextStyle,
                          ),
                        ),
                        heightSpace,
                        Text(
                          item['song'],
                          style: blackColor13SemiBoldTextStyle,
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          item['artist'],
                          style: greyColor11MediumTextStyle,
                        ),
                        heightSpace,
                        heightSpace,
                        Row(
                          children: [
                            Icon(
                              Icons.play_circle_rounded,
                              color: blackColor,
                              size: 12,
                            ),
                            widthSpace,
                            Text(
                              '${item['plays']} plays',
                              style: greyColor8MediumTextStyle,
                            ),
                          ],
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
}
