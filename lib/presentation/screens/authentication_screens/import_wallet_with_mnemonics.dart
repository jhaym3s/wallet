import 'package:flutter/material.dart';
import 'package:hodl/presentation/widgets/authentication_widgets/import_with_x.dart';

class ImportWithMnemonics extends StatelessWidget {
  static const routeName = "import_with_mnemonics";
  const ImportWithMnemonics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ImportWalletWithX(
      hintText: " your seed phrase",
      isPrivateKeyScreen: false,
      
    );
  }
}
