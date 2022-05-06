import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hodl/services/address_service.dart';
import 'package:hodl/services/coin_geko_service.dart';
import 'package:meta/meta.dart';

import '../models/coin_geko_api.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  AddressService addressService;
  CoinGekoService coinGekoService;
  //ContractService contractService;
  WalletBloc({required this.addressService, required this.coinGekoService,})
      : super(WalletInitialState()) {
    on<InitialWalletEvent>(emitInitialState);
    on<GetWallaetItem>(displayWalletItems);
    on<GetCurrencies>(getCurrencies);
    on<SelectCurrency>(addToSelectedItem);
    on<FindCurrencyEvent>(findCurrencyWithId);
  }

  FutureOr<void> emitInitialState(InitialWalletEvent event, Emitter<WalletState> emit) {
    emit(WalletInitialState());
  }
  

  FutureOr<void> displayWalletItems(
      GetWallaetItem event, Emitter<WalletState> emit) async {
    emit(CredentialLoadingState());
    try {
      await coinGekoService.getCurrencies();
      final prefEthAddress = addressService.getprefEthAddress();
      final allCurrency = coinGekoService.allCurrency;
      emit(DisplayWalletItemState(
          walletAddress: prefEthAddress!,
          allCurrencies: allCurrency));
    } catch (_) {
      emit(CredentialFailureState());
    }
  }

  FutureOr<void> getCurrencies(
      GetCurrencies event, Emitter<WalletState> emit) async {
    try {
      await coinGekoService.getCurrencies();
      coinGekoService.saveCurrencies();
      coinGekoService.getSavedCurrencies();
      print("done");
    } catch (_) {
      emit(CredentialFailureState());
    }
  }

  FutureOr<void> addToSelectedItem(
      SelectCurrency event, Emitter<WalletState> emit) {
    coinGekoService.addToSelectedCurrencies(event.id);
  }

  FutureOr<void> findCurrencyWithId(
      FindCurrencyEvent event, Emitter<WalletState> emit) {
    final allCurrencies = coinGekoService.allCurrency;
    final prefEthAddress = addressService.getprefEthAddress();
    print("object");
    emit(DisplaySpecificCurrency(
      currency: allCurrencies.firstWhere((currency) => currency.id == event.id),
      walletAddress: prefEthAddress!,
       ));
  }

  
}
