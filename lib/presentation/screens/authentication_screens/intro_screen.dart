import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/presentation/screens/authentication_screens/authentication_screens.dart';
import 'package:hodl/presentation/widgets/authentication_widgets/intro_screen_button.dart';

class IntroScreen extends StatelessWidget {
  static const routeName = "intro_screen";
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wallet Setup",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Import an existing wallet or create a new one",
                style: Theme.of(context).textTheme.bodyText2  ,
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              IntroScreenButton(
                  text: "A new wallet will be created to hold assets",
                  title: "Create Wallet",
                  onPressed: () =>
                      Navigator.pushNamed(context, CreateWallet.routeName),
                  color: const Color(0xff248FF2)),
              IntroScreenButton(
                  text: "Import your wallet with your 12 word key phrase",
                  onPressed: () =>
                      Navigator.of(context).pushNamed(ImportWallet.routeName),
                  title: "Import Wallet",
                  color: const Color.fromARGB(255, 212, 212, 212)),
              IntroScreenButton(
                  text: "Connect hardware wallet to secure your assets",
                  title: "Connect Hardware wallet",
                  onPressed: () =>
                      Navigator.of(context).pushNamed(ImportWallet.routeName),
                  color: const Color.fromARGB(255, 212, 212, 212)),
            ],
          ),
        ),
      )),
    );
  }
}
