import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wireapps/welcomepage.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Column(
          children: [
            Lottie.asset('assets/images/discount.json',width: 150,height: 150),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'W',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.greenAccent,
                ),
                children: [
                  TextSpan(
                    text: 'ir',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: 'e',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: 'App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    text: 's',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        nextScreen: const WelcomePage(),
        splashIconSize: 250,
        backgroundColor: Colors.black,
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      )
    );
  }
}