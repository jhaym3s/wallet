import 'package:web3dart/credentials.dart';

class WalletCredential {
  final String keyPhrases;
  final EthereumAddress walletAddress;
  final String privateKey;


  WalletCredential(
      {
      required this.keyPhrases,
      required this.walletAddress,
      required this.privateKey,
      });
}
