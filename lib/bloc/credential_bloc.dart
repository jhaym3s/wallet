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
      final privateKey = await addressService.getPrivateKey(mnemonic);
      final ethAddress = await addressService.getPublicAddress(privateKey);
      CredentialSuccessState(
        mnemonic: mnemonic,
        address: ethAddress,
        mnemonicsList: mnemonic.split(' '),
        privateKey: privateKey,
      );
    } catch (_) {
      emit(CredentialFailureState());
    }
  }

  FutureOr<void> getPrivateKey(GetPrivateKeyEvent event, Emitter<CredentialState> emit) async {
    emit(CredentialLoadingState());
    try {
      final privateKey = await addressService.getPrivateKey(event.mnemonics);
      emit(GetPrivateKeyState(privateKey: privateKey));
    } catch (_) {
       emit(CredentialFailureState());
    }
  }

  FutureOr<void> getEthAddress(GetEthAddressEvent event, Emitter<CredentialState> emit) async {
    emit(CredentialLoadingState());
    try {
      final ethAddress = await addressService.getPublicAddress(event.privateKey);
      emit(GetWalletAddressState(walletAddress: ethAddress));
    } catch (_) {
      emit(CredentialFailureState());
    }
  }
}
