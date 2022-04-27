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
      : super(CredentialInitial()) {
    on<GenerateMnmonics>(generateMnemonics);
    on<GetSavedMnemonics>(getPrefMnemonics);
    on<GetWallaetItem>(displayWalletItems);
    on<GetCurrencies>(getCurrencies);
    on<SelectCurrency>(addToSelectedItem);
    on<FindCurrencyEvent>(findCurrencyWithId);
  }

  FutureOr<void> generateMnemonics(
      GenerateMnmonics event, Emitter<WalletState> emit) async {
    try {
      final mnemonic = addressService.generateMnemonic();
      await addressService.setupFromMnemonic(mnemonic);
    } catch (_) {
      emit(CredentialFailureState());
    }
  }

  FutureOr<void> getPrefMnemonics(
      GetSavedMnemonics event, Emitter<WalletState> emit) {
    emit(CredentialLoadingState());
    try {
      final prefMnemonics = addressService.getPrefMnemonics();
      emit(DisplayMnemonicsState(
        mnemonic: prefMnemonics!,
      ));
    } catch (_) {
      emit(CredentialFailureState());
    }
  }

  FutureOr<void> displayWalletItems(
      GetWallaetItem event, Emitter<WalletState> emit) async {
    emit(CredentialLoadingState());
    try {
      await coinGekoService.getCurrencies();
      final prefEthAddress = addressService.getprefEthAddress();
      final selectedCurrency = coinGekoService.selectedCurrency;
      final allCurrency = coinGekoService.allCurrency;
      print("done");
      emit(DisplayWalletItemState(
          walletAddress: prefEthAddress!,
          selectedCurrency: selectedCurrency,
        //  currencyTabbed: allCurrency.firstWhere((element) => element.id == "id"),
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
