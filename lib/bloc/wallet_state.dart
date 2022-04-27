part of 'wallet_bloc.dart';

@immutable
abstract class WalletState extends Equatable {}

class CredentialInitial extends WalletState {
  @override
  List<Object?> get props => [];
}

class CredentialLoadingState extends WalletState {
  @override
  List<Object?> get props => [];
}

class DisplayMnemonicsState extends WalletState {
  final String mnemonic;
  DisplayMnemonicsState({
    required this.mnemonic,
  });
  @override
  List<Object?> get props => [mnemonic];
}

class DisplayWalletItemState extends WalletState {
  final String  walletAddress;
  final List<CoinGeko> allCurrencies;
  final List<CoinGeko> selectedCurrency;
  //final EtherAmount currencyBalance;

  DisplayWalletItemState({
    required this.walletAddress,
    required this.selectedCurrency,
    required this.allCurrencies,
    //required this.currencyBalance,
  });
  @override
  List<Object?> get props => [walletAddress, selectedCurrency, allCurrencies,];
}


class DisplaySpecificCurrency extends WalletState {
  final CoinGeko currency;
  final String walletAddress;
  //final EtherAmount balance;

  DisplaySpecificCurrency({required this.currency, required this.walletAddress});
  @override
  List<Object?> get props => [currency,walletAddress];
}

class CredentialFailureState extends WalletState {
  
@override
  List<Object?> get props => [];
}
