import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:hodl/configs/configs.dart';

import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then(
        (value) => Navigator.pushReplacementNamed(context, IntroScreen.routeName));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashBackground,
      body: Center(
        child: Image.asset(AssetsImages.logo),
      ),
    );
  }
}
