part of 'currency_bloc.dart';

@immutable
abstract class CurrencyState extends Equatable{}

class CurrencyInitial extends CurrencyState {
  @override
  List<Object?> get props => [];
}

class CurrencyLoading extends CurrencyState {
  @override
  List<Object?> get props => [];
}

class GetAllCurrencyState extends CurrencyState {
  List<CurrencyModel> currencies;

  GetAllCurrencyState({required this.currencies});
  
  @override
  List<Object?> get props => [currencies];
}

