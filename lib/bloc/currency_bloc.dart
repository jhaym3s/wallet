import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hodl/models/coin_geko_api.dart';
import 'package:hodl/models/currency_model.dart';
import 'package:meta/meta.dart';

import '../data/coin_geko_repository.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
   CoinGekoRespository coinGekoRespository;
  CurrencyBloc({required this.coinGekoRespository}) : super(CurrencyInitial()) {
    on<FindCurrencyByIdEvent>(findById);
    on<GetAllCurrrencyEvent>(getAllCurrency);

  }

  FutureOr<void> findById(FindCurrencyByIdEvent event, Emitter<CurrencyState> emit) {
   // CurrencyModel currenctCurrency = CurrencyModel.firstWhere((currency) => currency.coinGeko.first.id == event.id;
  }

  FutureOr<void> getAllCurrency(GetAllCurrrencyEvent event, Emitter<CurrencyState> emit) async{
    emit(CurrencyLoadingState());
    try {
      List<CoinGeko> coinGekoList = await coinGekoRespository.getCoinAsset();
      emit(GetAllCurrencyState(coinGeko: coinGekoList ));
    } catch (_) {
      emit(CurrencyErrorState());
    }
  }
}
