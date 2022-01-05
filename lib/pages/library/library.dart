import 'package:mymusic/pages/screens.dart';
import 'dart:ui' as ui;

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  double height;
  double width;

  final albumsList = [
    {
      'image': 'assets/images/albumsCoverImages/1.png',
      'name': 'Liked Songs',
    },
    {
      'image': 'assets/images/albumsCoverImages/2.png',
      'name': 'Gym',
    },
    {
      'image': 'assets/images/albumsCoverImages/3.png',
      'name': 'Chill',
    },
    {
      'image': 'assets/images/albumsCoverImages/4.png',
      'name': 'Liked Podcasts',
    },
    {
      'image': 'assets/images/albumsCoverImages/5.png',
      'name': 'Party',
    },
    {
      'image': 'assets/images/albumsCoverImages/6.png',
      'name': "BGM's",
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        children: [
          library(),
          albumList(),
        ],
      ),
    );
  }

  library() {
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
                text: 'Library',
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

  albumList() {
    return Container(
      height: height,
      padding: EdgeInsets.only(
        left: fixPadding * 2.0,
        top: fixPadding,
        right: fixPadding * 2.0,
      ),
      child: GridView.builder(
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 4
                  : 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15,
          childAspectRatio: (0.9),
        ),
        itemCount: albumsList.length,
        itemBuilder: (context, index) {
          final item = albumsList[index];
          return Wrap(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tracks()),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage(
                            item['image'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      item['name'],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
