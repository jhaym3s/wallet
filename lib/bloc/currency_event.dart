part of 'currency_bloc.dart';

@immutable
abstract class CurrencyEvent extends Equatable{}

class FindCurrencyByIdEvent extends CurrencyEvent{
  final String id;

  FindCurrencyByIdEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class GetAllCurrrencyEvent extends CurrencyEvent{

  @override
  List<Object?> get props => [];
}


