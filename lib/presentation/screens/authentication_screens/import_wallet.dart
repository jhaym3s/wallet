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
            onPressed: () {
              // Navigator.of(context).pushNamed(ImportWallet.routeName);
            },
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


