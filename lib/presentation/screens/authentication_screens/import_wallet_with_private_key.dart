import 'package:flutter/material.dart';
import 'package:hodl/presentation/widgets/authentication_widgets/import_with_x.dart';

class ImportWithPrivateKey extends StatelessWidget {
  static const routeName = "import_with_private_key";
  const ImportWithPrivateKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ImportWalletWithX(
      hintText: " your private key",
      isPrivateKeyScreen: true,
      errorMessage: "Invalid Private Key",
    );
  }
}
