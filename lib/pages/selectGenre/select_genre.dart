import 'package:mymusic/pages/screens.dart';

class SelectGenre extends StatefulWidget {
  @override
  _SelectGenreState createState() => _SelectGenreState();
}

class _SelectGenreState extends State<SelectGenre> {
  double height;
  double width;

  final musicList = [
    {
      'image': 'assets/images/songsCoverPicks/coverImage21.png',
      'type': 'HINDI',
      'isSelected': true,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage22.png',
      'type': 'ENGLISH',
      'isSelected': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage17.png',
      'type': 'PUNJABI',
      'isSelected': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage23.png',
      'type': 'POP MUSIC',
      'isSelected': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage24.png',
      'type': 'PODCASTS',
      'isSelected': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage25.png',
      'type': 'TOP HITS',
      'isSelected': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage26.png',
      'type': 'MIX SONGS',
      'isSelected': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage2.png',
      'type': 'PARTY SONGS',
      'isSelected': false,
    },
    {
      'image': 'assets/images/songsCoverPicks/coverImage27.png',
      'type': 'LOVE SONGS',
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          image(),
          title(),
          musicsList(),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  image() {
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
          left: 28.0,
          bottom: 10.0,
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomBar()),
            ),
            child: Text(
              'Skip',
              style: greyColor15RegularTextStyle,
            ),
          ),
        ),
        Positioned(
          right: 20.0,
          bottom: 10.0,
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomBar()),
            ),
            child: Text(
              'Next',
              style: greyColor15RegularTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/music-note.png',
          height: 30.0,
          width: 30.0,
        ),
        heightSpace,
        heightSpace,
        GradientText(
          text: 'Choose Music That Interests You...',
          gradientDirection: GradientDirection.ttb,
          colors: [
            Color(0xffff7c00),
            Color(0xff290a59),
          ],
          style: semiBold18TextStyle,
        ),
      ],
    );
  }

  musicsList() {
    return Container(
      height: height * 0.60,
      width: width,
      padding: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 3.0,
        fixPadding * 2.0,
        0.0,
      ),
      child: GridView.builder(
        itemCount: musicList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 4
                  : 3,
          mainAxisSpacing: 20,
          childAspectRatio: (0.85),
        ),
        itemBuilder: (context, index) {
          final item = musicList[index];
          return InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                item['isSelected'] = !item['isSelected'];
              });
            },
            child: Column(
              children: [
                Container(
                  height: 110.0,
                  width: 110.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: item['isSelected']
                        ? Border.all(color: blackColor.withOpacity(0.5))
                        : Border(),
                    image: DecorationImage(
                      image: AssetImage(item['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: item['isSelected']
                      ? Container(
                          decoration: BoxDecoration(
                            color: blackColor.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.done,
                            color: whiteColor,
                          ),
                        )
                      : Container(),
                ),
                SizedBox(height: 2.0),
                GradientText(
                  text: item['type'],
                  gradientDirection: GradientDirection.ttb,
                  colors: item['isSelected']
                      ? [
                          Color(0xffff7c00),
                          Color(0xff290a59),
                        ]
                      : [
                          blackColor,
                          blackColor,
                        ],
                  style: medium15TextStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
