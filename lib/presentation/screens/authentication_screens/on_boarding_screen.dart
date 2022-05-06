import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hodl/bloc/wallet_bloc.dart';
import 'package:hodl/components/intro_elevated_button.dart';
import 'package:hodl/presentation/screens/authentication_screens/authentication_screens.dart';

import '../../../bloc/authentication_bloc.dart';
import '../../../configs/constants.dart';
import '../../widgets/onboarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = "/import_screen";
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _rippleAnimationController;
  late PageController _pageController;
  late Animation<double> _rippleAnimation;
  int currentIndex = 0;
  static const _kDuration = Duration(milliseconds: 1000);
  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: kRippleAnimationDuration,
    );
  }

  void nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  void previousFunction() {
    _pageController.previousPage(duration: _kDuration, curve: _kCurve);
  }

  void skipFunction() {
    _pageController.animateToPage(4, duration: _kDuration, curve: _kCurve);
  }

  void onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    _rippleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        child: Column(children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: onChangedFunction,
              children: const [
                OnBoardingItem(
                  image: AssetsImages.onboarding1,
                  title: "Welcome to HODL",
                  description:
                      "A secure and decentralised place where all your digital asset can be stored",
                ),
                OnBoardingItem(
                  image: AssetsImages.onBoarding2,
                  title: "Monitor your assets",
                  description:
                      "Keep track of all your assets and their market prices in real time using our accurate portfolio tracker",
                ),
                OnBoardingItem(
                  image: AssetsImages.onBoarding3,
                  title: "Seamless Exchamge",
                  description:
                      "Perform Peer-to-peer transactions with anyone and any business securely and quickly",
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Indicator(positionIndex: 0, currentIndex: currentIndex),
              Indicator(positionIndex: 1, currentIndex: currentIndex),
              Indicator(positionIndex: 2, currentIndex: currentIndex)
            ],
          ),
          const Gap(30),
          CustomElevatedButton(
            onPressed: currentIndex != 2
                ? () {
                    nextFunction();
                  }
                : () {
                    context.read<AuthBloc>().add(CreateWalletEvent());
                    
                    Navigator.of(context).pushNamed(CreateWallet.routeName);
                  },
            label: 'Create Wallet',
          ),
          const Gap(10),
          SizedBox(
            width: kScreenWidth(context),
            height: 50,
            child: TextButton(
                onPressed: currentIndex != 2
                    ? () => nextFunction()
                    : () =>
                        Navigator.of(context).pushNamed(ImportWallet.routeName),
                child: const Text("Import Wallet"),
                style: TextButton.styleFrom(primary: kTextColors)),
          ),
          const Gap(10),
        ]),
      )),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex;
  final int currentIndex;
  const Indicator({
    Key? key,
    required this.positionIndex,
    required this.currentIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 12,
        width: positionIndex == currentIndex ? 24 : 12,
        decoration: BoxDecoration(
          // border: Border.all(color: k),
          color: positionIndex == currentIndex
              ? kPrimaryColor
              : Theme.of(context).splashColor,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}