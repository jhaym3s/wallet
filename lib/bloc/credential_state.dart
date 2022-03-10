part of 'credential_bloc.dart';

@immutable
abstract class CredentialState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CredentialInitial extends CredentialState {}

class CredentialLoadingState extends CredentialState{}

class CredentialSuccessState extends CredentialState{
  final List<String> mnemonicsList;
  final String privateKey;
  final EthereumAddress address;
  final String mnemonic;

  CredentialSuccessState({
    required this.mnemonicsList,
    required this.address,
    required this.privateKey,
    required this.mnemonic,
  });
   @override
  List<Object?> get props => [mnemonicsList, address, privateKey,mnemonic];
}

class GetPrivateKeyState extends CredentialState{
  final String privateKey;

  GetPrivateKeyState({required this.privateKey});
}

class GetWalletAddressState extends CredentialState{
  final EthereumAddress walletAddress;

  GetWalletAddressState({required this.walletAddress});
}

class CredentialFailureState extends CredentialState{}
