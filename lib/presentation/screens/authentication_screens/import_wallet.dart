import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../components/intro_elevated_button.dart';
import '../../../configs/constants.dart';
import '../../widgets/onboarding_item.dart';

class ImportWallet extends StatefulWidget {
  static const routeName = "/import_wallet";
  const ImportWallet({Key? key}) : super(key: key);

  @override
  State<ImportWallet> createState() => _ImportWalletState();
}

class _ImportWalletState extends State<ImportWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        child: Column(children: [
          const Expanded(
            child: OnBoardingItem(
              image: AssetsImages.restoreWallet,
              title: "Restore Wallet",
              description:
                  "Restore previous multi-chain, you need to use your secret recovery phrase that was given to you when you first created an account with us.",
            ),
          ),
          const Gap(30),
          CustomElevatedButton(
            onPressed: () {},
            label: 'Import Key-Phrase',
          ),
          const Gap(10),
          SizedBox(
            width: kScreenWidth(context),
            height: 50,
            child: TextButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(ImportWallet.routeName);
                },
                child: const Text("Import with private key"),
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
