import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hodl/services/address_service.dart';
import 'package:meta/meta.dart';
import 'package:web3dart/web3dart.dart';

part 'credential_event.dart';
part 'credential_state.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  AddressService addressService;
  CredentialBloc({required this.addressService}) : super(CredentialInitial()) {
    on<GetMnemonicsEvent>(getMnemonics);
    on<GetPrivateKeyEvent>(getPrivateKey);
    on<GetEthAddressEvent>(getEthAddress);
  }

  FutureOr<void> getMnemonics(
      GetMnemonicsEvent event, Emitter<CredentialState> emit) async {
    emit(CredentialLoadingState());
    try {
      final mnemonic = addressService.generateMnemonic();

      if (await addressService.setupFromMnemonic(mnemonic)) {
        final prefMnemonics = addressService.getPrefMnemonics();
        emit(GenerateCredentialMnemonicsState(
          mnemonic: mnemonic,
        ));
      }
      ;
    } catch (_) {
      emit(CredentialFailureState());
    }
  }

  FutureOr<void> getPrivateKey(
      GetPrivateKeyEvent event, Emitter<CredentialState> emit) async {
    emit(CredentialLoadingState());
    try {
      final prefPrivateKeys =  addressService.getPrefPrivateKey();
      emit(GetPrivateKeyState(privateKey: prefPrivateKeys));
    } catch (_) {
      emit(CredentialFailureState());
    }
  }

  FutureOr<void> getEthAddress(
      GetEthAddressEvent event, Emitter<CredentialState> emit) async {
    emit(CredentialLoadingState());
    try {
      final prefEthAddress = addressService.getprefEthAddress();
      final ethAddress = await addressService.getPublicAddress(prefEthAddress!);
      emit(GetWalletAddressState(walletAddress: ethAddress));
    } catch (_) {
      emit(CredentialFailureState());
    }
  }
}
