import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:hodl/configs/configs.dart';

import '../../../bloc/wallet_bloc.dart';
import '../nav_bar_screens/persistent_bottom_nav_bar.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushReplacementNamed(context, IntroScreen.routeName);
      //  context.read<CredentialBloc>().add(GetCurrencies());
      //            context.read<CredentialBloc>().add(DisplayWalletItem());
      //         Navigator.of(context).popAndPushNamed(
      //           CustomNavigationBar.routeName,
      //         );
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
            Text(kAppName.toUpperCase(), style: Theme.of(context).textTheme.headline2!.copyWith(color: kWhite,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
