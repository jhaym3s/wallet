import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/wallet_safe.png"),
              const Gap(20),
              const Text(
                "Secure & Decentralized",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              const Text("Trusted by millions, HODL is a decentralized wallet making the world of web3 accessible to all.",textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}
