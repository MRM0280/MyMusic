import 'dart:async';
import 'dart:io';

import 'package:mymusic/pages/screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignIn()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => exit(0),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffff7c00),
                Color(0xff290a59),
              ],
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                width: double.infinity,
                height: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/white-logo.png'),
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Music',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.0,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: ' of you',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
