import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:hodl/configs/configs.dart';

import '../../../bloc/wallet_bloc.dart';
import '../../../services/configuration_service.dart';
import '../nav_bar_screens/persistent_bottom_nav_bar.dart';
import '../nav_bar_screens/wallet_screen.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required this.configurationService})
      : super(key: key);
  final ConfigurationService configurationService;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      widget.configurationService.didSetupWallet()
          ? Navigator.pushReplacementNamed(context, WalletScreen.routeName)
          : Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
     
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSplashBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetsImages.logo),
            Text(
              kAppName.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: kWhite, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}