import 'package:mymusic/pages/screens.dart';
import 'dart:ui' as ui;
import 'package:mymusic/widget/column_builder.dart';

class TopArtist extends StatefulWidget {
  final String image;
  final String name;
  final tag;

  TopArtist({this.image, this.name, this.tag});
  @override
  _TopArtistState createState() => _TopArtistState();
}

class _TopArtistState extends State<TopArtist> {
  double height;
  double width;

  final popularSongsList = [
    {
      'image': 'assets/images/songsCoverPicks/coverImage18.png',
      'song': 'Tu Hi Yaar Mera',
      'lyrics': 'Arijit Singh,Neha Kakkar',
      'plays': '2.5 M',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage19.png',
      'song': 'Tera Yaar Hoon Main',
      'lyrics': 'Arijit Singh',
      'plays': '2.3 M',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage20.png',
      'song': 'Kalank',
      'lyrics': 'Alia Bhatt,Varun Dhawan,Arijit Singh',
      'plays': '2.0 M',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage18.png',
      'song': 'Tu Hi Yaar Mera',
      'lyrics': 'Arijit Singh,Neha Kakkar',
      'plays': '2.5 M',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          topArtist(),
          artistDetails(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Text(
              'Popular Songs',
              style: blackColor15SemiBoldTextStyle,
            ),
          ),
          popularSongList(),
        ],
      ),
    );
  }

  topArtist() {
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
                    Icons.keyboard_arrow_left_rounded,
                    size: 30,
                  ),
                ),
              ),
              widthSpace,
              GradientText(
                text: 'Top Artist',
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

  artistDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fixPadding),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.tag,
              child: Container(
                height: height * 0.24,
                width: width * 0.47,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: AssetImage(
                      widget.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            heightSpace,
            Text(
              widget.name,
              style: blackColor14SemiBoldTextStyle,
            ),
            SizedBox(height: 2.0),
            Text(
              'Artist',
              style: greyColor10MediumTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  popularSongList() {
    return ColumnBuilder(
      itemCount: popularSongsList.length,
      itemBuilder: (context, index) {
        final item = popularSongsList[index];
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
                  tag: popularSongsList[index],
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Hero(
                        tag: popularSongsList[index],
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item['song'],
                              style: blackColor13SemiBoldTextStyle,
                            ),
                            heightSpace,
                            Row(
                              children: [
                                Text(
                                  '(LYRICS)',
                                  style: greyColor10MediumTextStyle,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                                  color: greyColor,
                                  width: 1.0,
                                  height: 10.0,
                                ),
                                Flexible(
                                  child: Text(
                                    item['lyrics'],
                                    overflow: TextOverflow.ellipsis,
                                    style: greyColor10MediumTextStyle,
                                  ),
                                ),
                              ],
                            ),
                            heightSpace,
                            Text(
                              '${item['plays']} plays',
                              style: greyColor10MediumTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
