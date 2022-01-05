import 'package:mymusic/pages/screens.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  double height;
  DateTime currentBackPressTime;
  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          image(),
          Column(
            children: [
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              title(),
              nameTextField(),
              phoneNumberTextField(),
              emailTextField(),
              passwordTextField(),
              signUpButton(),
              otherSigninOptions(),
              heightSpace,
              heightSpace,
              helpText(),
            ],
          ),
        ],
      ),
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

  title() {
    return GradientText(
      text: 'SIGN UP',
      colors: [
        Color(0xffff7c00),
        Color(0xff290a59),
      ],
      gradientDirection: GradientDirection.ttb,
      style: bold30TextStyle,
    );
  }

  nameTextField() {
    return Container(
      margin: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.2),
            spreadRadius: 1.5,
            blurRadius: 1.5,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.name,
        cursorColor: greyColor,
        style: greyColor14SemiBoldTextStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.person,
            size: 18,
            color: greyColor,
          ),
          hintStyle: greyColor14SemiBoldTextStyle,
          hintText: 'Full Name',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  phoneNumberTextField() {
    return Container(
      margin: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.2),
            spreadRadius: 1.5,
            blurRadius: 1.5,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        cursorColor: greyColor,
        style: greyColor14SemiBoldTextStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.phone_android,
            size: 18,
            color: greyColor,
          ),
          hintStyle: greyColor14SemiBoldTextStyle,
          hintText: 'Phone Number',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  emailTextField() {
    return Container(
      margin: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.2),
            spreadRadius: 1.5,
            blurRadius: 1.5,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        cursorColor: greyColor,
        style: greyColor14SemiBoldTextStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.email,
            size: 18,
            color: greyColor,
          ),
          hintStyle: greyColor14SemiBoldTextStyle,
          hintText: 'Email Address',
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  passwordTextField() {
    return Container(
      margin: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.2),
            spreadRadius: 1.5,
            blurRadius: 1.5,
            offset: Offset(0.0, 2.0),
          ),
        ],
      ),
      child: TextField(
        obscureText: hidePassword,
        cursorColor: greyColor,
        style: greyColor14SemiBoldTextStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(
            Icons.lock_open,
            size: 18,
            color: greyColor,
          ),
          hintStyle: greyColor14SemiBoldTextStyle,
          hintText: 'Password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            icon: hidePassword
                ? Icon(
                    Icons.remove_red_eye_outlined,
                    size: 18,
                    color: greyColor,
                  )
                : Icon(
                    Icons.visibility_off_outlined,
                    size: 18,
                    color: greyColor,
                  ),
          ),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  signUpButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.5,
        fixPadding * 2.0,
        fixPadding * 1.5,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(5.0),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectGenre()),
        ),
        child: Container(
          padding: EdgeInsets.all(fixPadding * 1.5),
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
            'SIGN UP',
            style: whiteColor18BoldTextStyle,
          ),
        ),
      ),
    );
  }

  otherSigninOptions() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
              fixPadding * 2.0, 0.0, fixPadding * 2.0, fixPadding),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: greyColor.withOpacity(0.4),
                  height: 1.0,
                ),
              ),
              widthSpace,
              widthSpace,
              Text(
                'Or sign up with',
                style: greyColor12MediumTextStyle,
              ),
              widthSpace,
              widthSpace,
              Expanded(
                child: Container(
                  color: greyColor.withOpacity(0.4),
                  height: 1.0,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: Color(0xff4267b2),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/icon/facebook-icon.png',
                height: 15.0,
                width: 15.0,
              ),
            ),
            widthSpace,
            Container(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: Color(0xffea4335),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/icon/google-icon.png',
                height: 15.0,
                width: 15.0,
              ),
            ),
            widthSpace,
            Container(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: Color(0xff1da1f2),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/icon/twitter-icon.png',
                height: 15.0,
                width: 15.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  helpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ?",
          style: blackColor13MediumTextStyle,
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          ),
          child: GradientText(
            text: 'sign in',
            colors: [
              Color(0xff290a59),
              Color(0xffff7c00),
            ],
            gradientDirection: GradientDirection.ltr,
            style: semiBold13TextStyle,
          ),
        ),
      ],
    );
  }
}
