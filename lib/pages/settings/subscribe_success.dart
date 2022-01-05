import 'package:mymusic/pages/screens.dart';
import 'package:mymusic/widget/column_builder.dart';

class SubscribeSuccess extends StatefulWidget {
  @override
  _SubscribeSuccessState createState() => _SubscribeSuccessState();
}

class _SubscribeSuccessState extends State<SubscribeSuccess> {
  double height;

  final subscriptionDetailsList = [
    {
      'description': 'Download unlimited songs',
    },
    {
      'description': 'View song lyrics while playing song',
    },
    {
      'description': 'Hight quality sound quality',
    },
    {
      'description': 'Add free song play',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          image(),
          logo(),
          SizedBox(height: 40.0),
          Text(
            "You're Subscribed Now",
            textAlign: TextAlign.center,
            style: blackColor22SemiBoldTextStyle,
          ),
          SizedBox(height: 40.0),
          title(),
          subscriptionDetails(),
        ],
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  image() {
    return Container(
      height: height * 0.20,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/corner-design.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  logo() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
        ),
        Positioned(
          right: 150.0,
          top: 107.0,
          child: GradientText(
            text: 'Music',
            textAlign: TextAlign.end,
            colors: [
              Color(0xffff7c00),
              Color(0xff290a59),
            ],
            gradientDirection: GradientDirection.ttb,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Positioned(
          top: 128.0,
          right: 88.0,
          child: GradientText(
            text: ' of you',
            colors: [
              Color(0xffff7c00),
              Color(0xff290a59),
            ],
            gradientDirection: GradientDirection.ttb,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  title() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        0.0,
        fixPadding * 2.0,
        5.0,
      ),
      child: Text(
        'Subscription allows',
        style: blackColor14BoldTextStyle,
      ),
    );
  }

  subscriptionDetails() {
    return ColumnBuilder(
      itemCount: subscriptionDetailsList.length,
      itemBuilder: (context, index) {
        final item = subscriptionDetailsList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            fixPadding,
            fixPadding * 2.0,
            fixPadding,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Color(0xff5b2544),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Icon(
                  Icons.done,
                  color: whiteColor,
                  size: 12,
                ),
              ),
              widthSpace,
              widthSpace,
              Text(
                item['description'],
                style: blackColor13MediumTextStyle,
              ),
            ],
          ),
        );
      },
    );
  }

  bottomBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 2.0,
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentFaild()),
        ),
        child: Container(
          height: 50.0,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff290a59),
                Color(0xffff7c00),
              ],
            ),
          ),
          child: Text(
            'Explore Now',
            style: whiteColor18BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
