import 'package:mymusic/pages/screens.dart';
import 'package:mymusic/widget/column_builder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height;
  double width;

  final recommendedSongsList = [
    {
      'image': 'assets/images/songsCoverPicks/coverImage1.png',
      'title': 'Morning chill',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage2.png',
      'title': 'Daily Mix',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage3.png',
      'title': 'Top Trending',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage4.png',
      'title': 'Pop Music',
    },
  ];

  final popularSongsList = [
    {
      'image': 'assets/images/songsCoverPicks/coverImage5.png',
      'song': 'Shape of you',
      'artist': 'Ed shreean',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage6.png',
      'song': 'Waka waka',
      'artist': 'Shakira',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage7.png',
      'song': 'Let her go',
      'artist': 'Passenger',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage8.png',
      'song': 'See you again',
      'artist': 'Wiz khalifa',
    },
  ];

  final recentlyPlayedSongsList = [
    {
      'image': 'assets/images/songsCoverPicks/coverImage12.png',
      'song': 'Wathered',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage11.png',
      'song': 'Circles',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage10.png',
      'song': 'Sugar&brownies',
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage9.png',
      'song': 'Pretty girl',
    },
  ];

  final songsList = [
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
  ];

  final topArtistsList = [
    {
      'image': 'assets/images/artist/artist1.png',
      'artist': 'Arijit Singh',
      'songs': '179'
    },
    {
      'image': 'assets/images/artist/artist2.png',
      'artist': 'Justin Biber',
      'songs': '250'
    },
    {
      'image': 'assets/images/artist/artist3.png',
      'artist': 'Lady Gaga',
      'songs': '200'
    },
    {
      'image': 'assets/images/artist/artist1.png',
      'artist': 'Arijit Singh',
      'songs': '179'
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          explore(),
          searchBar(),
          title(title: 'Recommended For You'),
          recommendedList(),
          title(title: 'Popular Song'),
          popularList(),
          title(title: 'Recently Played'),
          recentlyPlayedList(),
          title(title: 'For You'),
          songsLists(),
          heightSpace,
          heightSpace,
          title(title: 'Playlists'),
          playlists(),
          title(title: 'Albums'),
          albumsList(),
          title(title: 'Top Artists'),
          topArtistList(),
        ],
      ),
    );
  }

  explore() {
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
          left: 25.0,
          right: 10.0,
          top: 132.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GradientText(
                text: 'Explore',
                colors: [
                  Color(0xffff7c00),
                  Color(0xff290a59),
                ],
                gradientDirection: GradientDirection.ttb,
                style: semiBold22TextStyle,
              ),
              PopupMenuButton(
                iconSize: 20,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                onSelected: (value) {
                  if (value == 'Tracks')
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Tracks()));
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    height: 30.0,
                    value: 'View By Album Artist',
                    child: Text(
                      'View By Album Artist',
                      style: blackColor12MediumTextStyle,
                    ),
                  ),
                  PopupMenuItem(
                    height: 30.0,
                    value: 'Sound Quality and Effects',
                    child: Text(
                      'Sound Quality and Effects',
                      style: blackColor12MediumTextStyle,
                    ),
                  ),
                  PopupMenuItem(
                    height: 30.0,
                    value: 'Tracks',
                    child: Text(
                      'Tracks',
                      style: blackColor12MediumTextStyle,
                    ),
                  ),
                  PopupMenuItem(
                    height: 30.0,
                    value: 'Contact Us',
                    child: Text(
                      'Contact Us',
                      style: blackColor12MediumTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  searchBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding * 1.5,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Search())),
        child: Container(
          padding: EdgeInsets.only(left: 15.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: TextField(
            enabled: false,
            cursorColor: greyColor,
            style: greyColor16RegularTextStyle,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: 'Search for artist,song or lyrics...',
              hintStyle: greyColor16RegularTextStyle,
              suffixIcon: Icon(
                Icons.search,
                color: greyColor,
              ),
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }

  title({String title}) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(fixPadding * 2.0, 0.0, fixPadding * 2.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: blackColor15BoldTextStyle,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: blackColor,
            size: 15.0,
          ),
        ],
      ),
    );
  }

  recommendedList() {
    return Container(
      height: height * 0.18,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: recommendedSongsList.length,
        itemBuilder: (context, index) {
          final item = recommendedSongsList[index];
          return Container(
            margin: EdgeInsets.fromLTRB(
              index == 0 ? fixPadding * 2.0 : 0.0,
              fixPadding * 1.5,
              index == recommendedSongsList.length - 1
                  ? fixPadding * 2.0
                  : fixPadding,
              fixPadding * 1.5,
            ),
            height: height * 0.14,
            width: width * 0.30,
            child: InkWell(
              borderRadius: BorderRadius.circular(5.0),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tracks()),
              ),
              child: Container(
                height: height * 0.14,
                width: width * 0.30,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: greyColor.withOpacity(0.2),
                      spreadRadius: 1.5,
                      blurRadius: 1.5,
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      item['image'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xffff7c00).withOpacity(0.5),
                        Color(0xff290a59).withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 3.0),
                    child: Text(
                      item['title'],
                      style: whiteColor12TextStyle,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  popularList() {
    return Container(
      height: height * 0.21,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: popularSongsList.length,
        itemBuilder: (context, index) {
          final item = popularSongsList[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? fixPadding * 2.0 : 0.0,
              fixPadding * 1.5,
              index == popularSongsList.length - 1
                  ? fixPadding * 2.0
                  : fixPadding,
              fixPadding * 1.5,
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NowPlaying(
                    tag: popularSongsList[index],
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: popularSongsList[index],
                    child: Container(
                      height: height * 0.12,
                      width: width * 0.26,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: greyColor.withOpacity(0.2),
                            spreadRadius: 1.5,
                            blurRadius: 1.5,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  heightSpace,
                  Text(
                    item['song'],
                    style: blackColor12MediumTextStyle,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    item['artist'],
                    style: greyColor9MediumTextStyle,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  recentlyPlayedList() {
    return Container(
      height: height * 0.19,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: recentlyPlayedSongsList.length,
        itemBuilder: (context, index) {
          final item = recentlyPlayedSongsList[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? fixPadding * 2.0 : 0.0,
              fixPadding * 1.5,
              index == recentlyPlayedSongsList.length - 1
                  ? fixPadding * 2.0
                  : fixPadding,
              fixPadding * 1.5,
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NowPlaying(
                    tag: recentlyPlayedSongsList[index],
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: recentlyPlayedSongsList[index],
                    child: Container(
                      height: height * 0.12,
                      width: width * 0.26,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: greyColor.withOpacity(0.2),
                            spreadRadius: 1.5,
                            blurRadius: 1.5,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  heightSpace,
                  Text(
                    item['song'],
                    style: blackColor12MediumTextStyle,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  songsLists() {
    return ColumnBuilder(
      itemCount: songsList.length,
      itemBuilder: (context, index) {
        final item = songsList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            index == 0 ? fixPadding * 1.5 : 0.0,
            fixPadding * 2.0,
            fixPadding * 0.5,
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
                    item['isFavorite']
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    size: 15,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  playlists() {
    return Padding(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          playSongsLists(
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tracks()),
            ),
            title: 'Recently added',
            images: 'assets/images/songsCoverPicks/coverImage13.png',
          ),
          playSongsLists(
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tracks()),
            ),
            title: 'Most played',
            images: 'assets/images/songsCoverPicks/coverImage13.png',
          ),
          playSongsLists(
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tracks()),
            ),
            title: 'Favourite tracks',
            images: 'assets/images/songsCoverPicks/coverImage13.png',
          ),
        ],
      ),
    );
  }

  albumsList() {
    return Padding(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          playSongsLists(
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tracks()),
            ),
            title: 'Audio',
            images: 'assets/images/audio.png',
          ),
          playSongsLists(
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tracks()),
            ),
            title: 'Download',
            images: 'assets/images/download.png',
          ),
          playSongsLists(
            ontap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tracks()),
            ),
            title: 'Future dust',
            images: 'assets/images/music.png',
          ),
        ],
      ),
    );
  }

  playSongsLists({Function ontap, String title, String images}) {
    return InkWell(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.12,
            width: width * 0.26,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: greyColor.withOpacity(0.2),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                ),
              ],
              image: DecorationImage(
                image: AssetImage(images),
                fit: BoxFit.fill,
              ),
            ),
          ),
          heightSpace,
          Text(
            title,
            style: blackColor12MediumTextStyle,
          ),
        ],
      ),
    );
  }

  topArtistList() {
    return Container(
      height: height * 0.21,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: topArtistsList.length,
        itemBuilder: (context, index) {
          final item = topArtistsList[index];
          return Padding(
            padding: EdgeInsets.fromLTRB(
              index == 0 ? fixPadding * 2.0 : 0.0,
              fixPadding * 1.5,
              index == topArtistsList.length - 1
                  ? fixPadding * 2.0
                  : fixPadding,
              fixPadding * 1.5,
            ),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 300),
                  pageBuilder: (_, __, ___) => TopArtist(
                    tag: topArtistsList[index],
                    image: item['image'],
                    name: item['artist'],
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: topArtistsList[index],
                    child: Container(
                      height: height * 0.12,
                      width: width * 0.26,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: [
                          BoxShadow(
                            color: greyColor.withOpacity(0.2),
                            spreadRadius: 1.5,
                            blurRadius: 1.5,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  heightSpace,
                  Text(
                    item['artist'],
                    style: blackColor12MediumTextStyle,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '${item['songs']} songs',
                    style: greyColor9MediumTextStyle,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
