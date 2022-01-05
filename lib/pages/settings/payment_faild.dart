import 'package:mymusic/pages/screens.dart';

class PaymentFaild extends StatefulWidget {
  @override
  _PaymentFaildState createState() => _PaymentFaildState();
}

class _PaymentFaildState extends State<PaymentFaild> {
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          image(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Container(
            height: height * 0.16,
            width: width * 0.25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/payment-fail.png'),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Oops!!',
            textAlign: TextAlign.center,
            style: blackColor22SemiBoldTextStyle,
          ),
          heightSpace,
          Text(
            'Payment Faild',
            textAlign: TextAlign.center,
            style: blackColor14SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Something Went Wrong\nPlease Try Again',
            textAlign: TextAlign.center,
            style: blackColor12MediumTextStyle,
          ),
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

  bottomBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 2.0,
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomBar()),
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
            'Try Again',
            style: whiteColor18BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
