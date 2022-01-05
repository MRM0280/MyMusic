import 'package:mymusic/pages/screens.dart';
import 'dart:ui' as ui;

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final emailController = TextEditingController(text: 'music@gmail.com');
  final changeEmailController = TextEditingController();
  final passwordController = TextEditingController(text: '1234567890');
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  double _currentSliderValue = 90;

  bool status1 = false;
  bool status2 = false;
  bool status3 = true;
  bool status4 = false;
  bool status5 = true;
  bool status6 = false;
  bool status7 = true;
  bool status8 = false;
  bool status9 = true;
  bool status10 = true;
  bool status11 = false;
  bool status12 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          settings(),
          title('USER ACCOUNT'),
          emailTextField(),
          passwordTextField(),
          divider(),
          banner(),
          title('PLAYBACK'),
          playbackSettings(),
          divider(),
          title('GENERAL'),
          generalSettings(),
          divider(),
          title('CONNECTIONS'),
          connectionSettings(),
          divider(),
          logOut(),
        ],
      ),
    );
  }

  settings() {
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
                text: 'Settings',
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

  title(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: Text(
        title,
        style: blackColor15BoldTextStyle,
      ),
    );
  }

  emailTextField() {
    return Container(
      height: 25.0,
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: EdgeInsets.zero,
      child: TextField(
        readOnly: true,
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        cursorColor: greyColor,
        style: blackColor14MediumTextStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          suffix: InkWell(
            onTap: () => changeEmailDialog(),
            child: Text('EDIT'),
          ),
          suffixStyle: greyColor11SemiBoldTextStyle,
        ),
      ),
    );
  }

  changeEmailDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        changeEmailController.text = emailController.text;
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  children: [
                    Text(
                      'Change Email',
                      style: blackColor18BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: changeEmailController,
                      cursorColor: greyColor,
                      style: blackColor14MediumTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                color: greyColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                'Cancel',
                                style: blackColor13BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                emailController.text =
                                    changeEmailController.text;
                              });
                              Navigator.of(context).pop(emailController.text);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff290a59),
                                    Color(0xffff7c00),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                'Okay',
                                style: whiteColor13BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  passwordTextField() {
    return Container(
      height: 25.0,
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      padding: EdgeInsets.zero,
      child: TextField(
        readOnly: true,
        controller: passwordController,
        cursorColor: greyColor,
        obscureText: true,
        style: blackColor14MediumTextStyle,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(borderSide: BorderSide.none),
          suffix: InkWell(
            onTap: () => changePasswordDialog(),
            child: Text('EDIT'),
          ),
          suffixStyle: greyColor11SemiBoldTextStyle,
        ),
      ),
    );
  }

  banner() {
    return Padding(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Subscribe()),
        ),
        child: Container(
          height: 50.0,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            image: DecorationImage(
              image: AssetImage('assets/images/banner-design.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Text(
            'Upgrade to My Music Premium',
            style: whiteColor18BoldTextStyle,
          ),
        ),
      ),
    );
  }

  changePasswordDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  children: [
                    Text(
                      'Change Your Password',
                      style: blackColor18BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    TextField(
                      obscureText: true,
                      controller: oldPasswordController,
                      cursorColor: greyColor,
                      style: blackColor14MediumTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Old Password',
                        hintStyle: greyColor14SemiBoldTextStyle,
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: newPasswordController,
                      cursorColor: greyColor,
                      style: blackColor14MediumTextStyle,
                      decoration: InputDecoration(
                        hintText: 'New Password',
                        hintStyle: greyColor14SemiBoldTextStyle,
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: confirmPasswordController,
                      cursorColor: greyColor,
                      style: blackColor14MediumTextStyle,
                      decoration: InputDecoration(
                        hintText: 'Confirm New Password',
                        hintStyle: greyColor14SemiBoldTextStyle,
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              oldPasswordController.clear();
                              newPasswordController.clear();
                              confirmPasswordController.clear();
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                color: greyColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                'Cancel',
                                style: blackColor13BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              if (newPasswordController.text ==
                                      confirmPasswordController.text &&
                                  oldPasswordController.text ==
                                      passwordController.text) {
                                setState(() {
                                  passwordController.text =
                                      confirmPasswordController.text;
                                });
                                Navigator.of(context)
                                    .pop(passwordController.text);
                              }
                              oldPasswordController.clear();
                              newPasswordController.clear();
                              confirmPasswordController.clear();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff290a59),
                                    Color(0xffff7c00),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                'Okay',
                                style: whiteColor13BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  playbackSettings() {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(fixPadding * 2.0, 0.0, fixPadding * 2.0, 0.0),
      child: Column(
        children: [
          setting(
            title: 'Sleep Time',
            switchs: Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: greyColor,
                inactiveTrackColor: greyColor,
                inactiveThumbColor: greyColor.withOpacity(0.2),
                value: status1,
                onChanged: (value) {
                  setState(() {
                    status1 = value;
                  });
                },
              ),
            ),
          ),
          setting(
            title: 'Music Quality',
            switchs: Text(
              'HIGH',
              style: greyColor11SemiBoldTextStyle,
            ),
          ),
          heightSpace,
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackShape: RectangularSliderTrackShape(),
              trackHeight: 2.5,
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
          setting(
            title: 'Autoplay',
            switchs: Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: greyColor,
                inactiveTrackColor: greyColor,
                inactiveThumbColor: greyColor.withOpacity(0.2),
                value: status2,
                onChanged: (value) {
                  setState(() {
                    status2 = value;
                  });
                },
              ),
            ),
          ),
          setting(
            title: 'Audio Normalisation',
            switchs: Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: greyColor,
                inactiveTrackColor: greyColor,
                inactiveThumbColor: greyColor.withOpacity(0.2),
                value: status3,
                onChanged: (value) {
                  setState(() {
                    status3 = value;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Smart Volume',
                    style: blackColor14MediumTextStyle,
                  ),
                  Text(
                    'Automatically adjust each track to the  same volume.',
                    style: greyColor10MediumTextStyle,
                  ),
                ],
              ),
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  activeTrackColor: greyColor,
                  inactiveTrackColor: greyColor,
                  inactiveThumbColor: greyColor.withOpacity(0.2),
                  value: status4,
                  onChanged: (value) {
                    setState(() {
                      status4 = value;
                    });
                  },
                ),
              ),
            ],
          ),
          setting(
            title: 'Control Music From Lock Screen',
            switchs: Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: greyColor,
                inactiveTrackColor: greyColor,
                inactiveThumbColor: greyColor.withOpacity(0.2),
                value: status5,
                onChanged: (value) {
                  setState(() {
                    status5 = value;
                  });
                },
              ),
            ),
          ),
          setting(
            title: 'Skip Silence Between Tracks',
            switchs: Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: greyColor,
                inactiveTrackColor: greyColor,
                inactiveThumbColor: greyColor.withOpacity(0.2),
                value: status6,
                onChanged: (value) {
                  setState(() {
                    status6 = value;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Music With Screen Off',
                      style: blackColor14MediumTextStyle,
                    ),
                    Text(
                      'Connect your headphones to listen to music while your screen is off.',
                      style: greyColor10MediumTextStyle,
                    ),
                  ],
                ),
              ),
              Transform.scale(
                scale: 0.7,
                child: Switch(
                  activeTrackColor: greyColor,
                  inactiveTrackColor: greyColor,
                  inactiveThumbColor: greyColor.withOpacity(0.2),
                  value: status7,
                  onChanged: (value) {
                    setState(() {
                      status7 = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  generalSettings() {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(fixPadding * 2.0, 0.0, fixPadding * 2.0, 0.0),
      child: Column(
        children: [
          setting(
            title: 'Dark Mode',
            switchs: Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: greyColor,
                inactiveTrackColor: greyColor,
                inactiveThumbColor: greyColor.withOpacity(0.2),
                value: status8,
                onChanged: (value) {
                  setState(() {
                    status8 = value;
                  });
                },
              ),
            ),
          ),
          setting(
            title: 'Smart Playback When Devices Connect',
            switchs: Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: greyColor,
                inactiveTrackColor: greyColor,
                inactiveThumbColor: greyColor.withOpacity(0.2),
                value: status9,
                onChanged: (value) {
                  setState(() {
                    status9 = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  connectionSettings() {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(fixPadding * 2.0, 0.0, fixPadding * 2.0, 0.0),
      child: Column(
        children: [
          setting(
            title: 'Facebook',
            switchs: Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: greyColor,
                inactiveTrackColor: greyColor,
                inactiveThumbColor: greyColor.withOpacity(0.2),
                value: status10,
                onChanged: (value) {
                  setState(() {
                    status10 = value;
                  });
                },
              ),
            ),
          ),
          setting(
            title: 'Twitter',
            switchs: Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: greyColor,
                inactiveTrackColor: greyColor,
                inactiveThumbColor: greyColor.withOpacity(0.2),
                value: status11,
                onChanged: (value) {
                  setState(() {
                    status11 = value;
                  });
                },
              ),
            ),
          ),
          setting(
            title: 'Instagram',
            switchs: Transform.scale(
              scale: 0.7,
              child: Switch(
                activeTrackColor: greyColor,
                inactiveTrackColor: greyColor,
                inactiveThumbColor: greyColor.withOpacity(0.2),
                value: status12,
                onChanged: (value) {
                  setState(() {
                    status12 = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  setting({String title, Widget switchs}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: blackColor14MediumTextStyle,
        ),
        switchs,
      ],
    );
  }

  logOut() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding,
        fixPadding * 2.0,
        fixPadding * 2.0,
      ),
      child: InkWell(
        onTap: () => logOutDialog(),
        child: Text(
          'Logout',
          style: redColor15MediumTextStyle,
        ),
      ),
    );
  }

  logOutDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Wrap(
            children: [
              Padding(
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  children: [
                    Text(
                      'Are you sure want to Logout?',
                      textAlign: TextAlign.center,
                      style: blackColor18BoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                color: greyColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                'Cancel',
                                style: blackColor13BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff290a59),
                                    Color(0xffff7c00),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                'Logout',
                                style: whiteColor13BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  divider() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      color: greyColor.withOpacity(0.2),
      height: 1.0,
      width: double.infinity,
    );
  }
}
