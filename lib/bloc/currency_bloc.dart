import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hodl/models/currency_model.dart';
import 'package:meta/meta.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitial()) {
    on<FindCurrencyByIdEvent>(findById);
    on<GetAllCurrrencyEvent>(getAllCurrency);

  }

  FutureOr<void> findById(FindCurrencyByIdEvent event, Emitter<CurrencyState> emit) {
   // CurrencyModel currenctCurrency = CurrencyModel.firstWhere((currency) => currency.coinGeko.first.id == event.id;
  }

  FutureOr<void> getAllCurrency(GetAllCurrrencyEvent event, Emitter<CurrencyState> emit) {
    emit(CurrencyLoading());
    try {
      //emit(GetAllCurrencyState(currencies: currencies));
    } catch (_) {
    }
  }
}
