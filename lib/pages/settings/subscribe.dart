import 'package:mymusic/pages/screens.dart';
import 'dart:ui' as ui;

import 'package:mymusic/widget/column_builder.dart';

class Subscribe extends StatefulWidget {
  @override
  _SubscribeState createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  double height;

  final packagesList = [
    {
      'type': 'Starter Pack',
      'month': '3',
      'amount': '8.99',
    },
    {
      'type': 'Standerd Pack',
      'month': '6',
      'amount': '15.99',
    },
    {
      'type': 'Super Saver Pack',
      'month': '12',
      'amount': '25.99',
    },
  ];

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
          subscribe(),
          packages(),
          title(),
          subscriptionDetails(),
        ],
      ),
    );
  }

  subscribe() {
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
                text: 'Subscribe',
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

  packages() {
    return ColumnBuilder(
      itemCount: packagesList.length,
      itemBuilder: (context, index) {
        final item = packagesList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            index == 0 ? fixPadding * 3.0 : 5.0,
            fixPadding * 2.0,
            fixPadding,
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SubscribeSuccess()),
            ),
            child: Container(
              height: height * 0.16,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: fixPadding * 2.0,
                vertical: fixPadding,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: blackColor,
                image: DecorationImage(
                  image: AssetImage('assets/images/card-design.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['type'],
                        style: whiteColor14BoldTextStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${item['month']} MONTHS',
                        style: whiteColor22LightTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '\$ ${item['amount']}',
                        style: whiteColor22LightTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  title() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
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
}
