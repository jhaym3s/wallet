part of 'currency_bloc.dart';

@immutable
abstract class CurrencyState extends Equatable{}

class CurrencyInitial extends CurrencyState {
  @override
  List<Object?> get props => [];
}

class GetAllCurrencyState extends CurrencyState {
  final List<CoinGeko> coinGeko;

  GetAllCurrencyState({required this.coinGeko});
  
  @override
  List<Object?> get props => [coinGeko];
}

class CurrencyLoadingState extends CurrencyState{

  @override
  List<Object?> get props => [];
  
}

class CurrencyErrorState extends CurrencyState{
  @override
  List<Object?> get props => [];
} 

