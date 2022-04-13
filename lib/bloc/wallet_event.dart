part of 'wallet_bloc.dart';

@immutable
abstract class WalletEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GenerateMnmonics extends WalletEvent{}

class GetSavedMnemonics extends WalletEvent{}


class GetWallaetItem extends WalletEvent{
   @override
  List<Object?> get props => [];
}

class GetCurrencies extends WalletEvent{
  @override
  List<Object?> get props => []; 
}

class FindCurrencyEvent extends WalletEvent{
  final String id;

  FindCurrencyEvent({required this.id});

   @override
  List<Object?> get props => [id];
}

class SelectCurrency extends WalletEvent{
  final String id;

  SelectCurrency({required this.id});
}









