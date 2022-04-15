import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/configs/configs.dart';
import '../../components/copy_button.dart';
import '../../components/intro_elevated_button.dart';
import '../screens/nav_bar_screens/persistent_bottom_nav_bar.dart';
import 'authentication_widgets/keyphrase_chip.dart';


class CreateWalletSuccessScreen extends StatelessWidget {
  const CreateWalletSuccessScreen({Key? key, required this.mnmonics})
      : super(key: key);
  final String mnmonics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: 
         Column(
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
                "These 12 words are the keys to your wallet. Write it down on a piece of paper now. You will be asked to re-enter them again for confirmation and back up in the next step.",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              const Gap(20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: SizedBox(
                  child: Center(
                    child: Wrap(
                        children: mnmonics
                            .split(" ")
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
                  value: mnmonics,
                  radius: 5)
            ],
          ),
        ),
        CustomElevatedButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(
                CustomNavigationBar.routeName,
              );
            },
            label: "Continue")
      ],
    )
    ));
  }
}
