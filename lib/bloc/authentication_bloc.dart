import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hodl/presentation/widgets/authentication_widgets/import_option_button.dart';
import 'package:meta/meta.dart';

import '../services/address_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AddressService addressService;

  AuthBloc({required this.addressService}) : super(AuthInitial()) {
        on<CreateWalletEvent>(createWallet);
        on<ImportWithKeyPhrase>(importWithKeyPhrase);
        on<ImportWithPrivateKey>(importWithPrivateKey);
  }

  FutureOr<void> createWallet(CreateWalletEvent event, Emitter<AuthState> emit) async{
       emit(AuthLoadingState());
     try {
      final mnemonic = addressService.generateMnemonic();
      await addressService.setupFromMnemonic(mnemonic);
      emit(DisplayKeyPhrases(keyPrase: mnemonic));  
     } catch (_) {
       emit(AuthFailureState());
     }
  }

   FutureOr<void> importWithKeyPhrase(ImportWithKeyPhrase event, Emitter<AuthState> emit)async{
     emit(AuthLoadingState());
     try {
       await addressService.setupFromMnemonic(event.keyPhrase);
     } catch (_) {
       emit(AuthFailureState());
     }
  }

  FutureOr<void> importWithPrivateKey(ImportWithPrivateKey event, Emitter<AuthState> emit) async{
    emit(AuthLoadingState());
     try {
       await addressService.setupFromPrivateKey(event.privateKey);
     } catch (_) {
       emit(AuthFailureState());
     }
  }
}
