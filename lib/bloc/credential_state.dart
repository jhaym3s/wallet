part of 'credential_bloc.dart';

@immutable
abstract class CredentialState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CredentialInitial extends CredentialState {}

class CredentialLoadingState extends CredentialState{}

class GenerateCredentialMnemonicsState extends CredentialState{
  final String? mnemonic;
  GenerateCredentialMnemonicsState({
    required this.mnemonic,
  });
   @override
  List<Object?> get props => [mnemonic];
}

class GetPrivateKeyState extends CredentialState{
  final String? privateKey;

  GetPrivateKeyState({required this.privateKey});
   @override
  List<Object?> get props => [privateKey];
}

class GetWalletAddressState extends CredentialState{
  final EthereumAddress walletAddress;

  GetWalletAddressState({required this.walletAddress});

   @override
  List<Object?> get props => [walletAddress];
}

class CredentialFailureState extends CredentialState{}
