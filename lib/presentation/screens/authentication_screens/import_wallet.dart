import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/presentation/screens/authentication_screens/authentication_screens.dart';
import 'package:hodl/presentation/widgets/authentication_widgets/import_option_button.dart';

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
        child: Column(
          children: const [
            Gap(40),
            ImportOptionButton(buttonText: "Import with Mnemonic", routeName: ImportWithMnemonics.routeName,),
            ImportOptionButton(buttonText: "Import with Private key", routeName: ImportWithPrivateKey.routeName,),
          ],
        ),
      ),
    );
  }
}
