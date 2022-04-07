part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent extends Equatable{}

class FindCurrencyByIdEvent extends CurrencyEvent{
  final String id;

  FindCurrencyByIdEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class GetAllCurrenciesAndSave extends CurrencyEvent{
  @override
  List<Object?> get props => []; 
}

class GetAllSharedPrefCurrencyEvent extends CurrencyEvent{
  @override
  List<Object?> get props => [];
}

class GetMainListFromSharedPref extends CurrencyEvent{
  @override
  List<Object?> get props => [];
}

class AddToMainScreenListEvent extends CurrencyEvent{
final String id;

AddToMainScreenListEvent({required this.id});
  @override
  List<Object?> get props => [id];

}

class RemoveFromMainScreenListEvent extends CurrencyEvent{
final String id;

RemoveFromMainScreenListEvent({required this.id});
  @override
  List<Object?> get props => [id];

}




