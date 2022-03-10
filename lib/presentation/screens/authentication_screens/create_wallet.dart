import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hodl/presentation/screens/nav_bar_screens/nav_bar_screens.dart';
import 'package:hodl/presentation/screens/nav_bar_screens/persistent_bottom_nav_bar.dart';
import 'package:hodl/presentation/widgets/copy_button.dart';

import '../../../configs/configs.dart';
import '../../widgets/authentication_widgets/keyphrase_chip.dart';

//final productId = ModalRoute.of(context).settings.arguments as String;

class CreateWallet extends StatefulWidget {
  static const routeName = "/create_wallet";
  const CreateWallet({Key? key}) : super(key: key);

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
   final String word = 'seed sock milk update focus rotate barely fade car face mechanic mercy';

  final bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Write down your Secret Recovery Phrase",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Gap(10),
                Text(
                  "This is your Secret Recovery Phrase. Write it down on a paper and keep it in a safe place.You’ll be asked to re-enter this phrase (in order) on the next step.",
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: SizedBox(
                    child: Center(
                      child: Wrap(
                          children: word.split(" ")
                              .map((label) => Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: KeyPhraseChip(label: label),
                                  ))
                              .toList()),
                    ),
                  ),
                ),
                const Gap(40),
                CopyButton(
                    text: Text("Copy Mnemonics",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: kSecondaryColor)),
                    value: word,
                    radius: 5)
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).popAndPushNamed(
                    //     WalletScreen.routeName,
                    //     arguments: word);
                    Navigator.of(context).popAndPushNamed(
                        CustomNavigationBar.routeName,
                        );
                  },
                  child: Container(
                    width: kScreenWidth(context),
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kPrimaryColor),
                    child: Center(
                        child: Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
