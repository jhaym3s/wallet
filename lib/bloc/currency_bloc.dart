import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hodl/models/coin_geko_api.dart';
import 'package:hodl/services/coin_geko_service.dart';
import 'package:meta/meta.dart';


part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
   //CoinGekoRespository coinGekoRespository;
   CoinGekoService coinGekoService;
  CurrencyBloc({ required this.coinGekoService}) : super(CurrencyInitial()) {
    on<FindCurrencyByIdEvent>(findById);
    on<GetAllSharedPrefCurrencyEvent>(getAllSharedPref);
    on<GetAllCurrenciesAndSave>(getAllCurrency);
    on<GetMainListFromSharedPref>(getMainScreenList);
    on<AddToMainScreenListEvent>(addToMainScreenList);
    on<RemoveFromMainScreenListEvent>(removeFromMainScreenList);




  }

  FutureOr<void> findById(FindCurrencyByIdEvent event, Emitter<CurrencyState> emit) {
   // CurrencyModel currenctCurrency = CurrencyModel.firstWhere((currency) => currency.coinGeko.first.id == event.id;
  }

  FutureOr<void> getAllSharedPref(GetAllSharedPrefCurrencyEvent event, Emitter<CurrencyState> emit) async{
    emit(CurrencyLoadingState());
    try {
      emit(GetAllCurrencyState(coinGeko: coinGekoService.allCoinGekoCurrencies));
    } catch (_) {
      emit(CurrencyErrorState());
    }
  }

  FutureOr<void> getAllCurrency(GetAllCurrenciesAndSave event, Emitter<CurrencyState> emit) async{
      try {
        await coinGekoService.getCoinGekoCurrency();
        coinGekoService.saveAllCurrencyToSharedPreference();
        emit(CurrencyInitial());
      } catch (_) {
        emit(CurrencyErrorState());
      }
  }

  FutureOr<void> getMainScreenList(GetMainListFromSharedPref event, Emitter<CurrencyState> emit) {
    emit(CurrencyLoadingState());
    try {
      emit(GetMainScreenListState(mainScreenList: coinGekoService.getMainScreenListFromSharedPref()));
    } catch (_) {
    }
  }

  FutureOr<void> addToMainScreenList(AddToMainScreenListEvent event, Emitter<CurrencyState> emit) {
    coinGekoService.addToMainScreenList(event.id);
    coinGekoService.saveMainScreenListToSharedPreference();
  }

  FutureOr<void> removeFromMainScreenList(RemoveFromMainScreenListEvent event, Emitter<CurrencyState> emit) {
    coinGekoService.removeFromMainScreen(event.id);
    coinGekoService.saveMainScreenListToSharedPreference();
  }
}
