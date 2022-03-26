import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodl/presentation/widgets/create_wallet_success_screen.dart';

import '../../../bloc/credential_bloc.dart';
import '../../../components/loading.dart';

//final productId = ModalRoute.of(context).settings.arguments as String;

class CreateWallet extends StatefulWidget {
  static const routeName = "/create_wallet";
  const CreateWallet({Key? key}) : super(key: key);

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

class _CreateWalletState extends State<CreateWallet> {
  


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CredentialBloc, CredentialState>(
      builder: (context, state) {
        if(state is GenerateCredentialMnemonicsState){
          return CreateWalletSuccessScreen(mnmonics: state.mnemonic!);
        }
        if(state is CredentialLoadingState){
          return const Loading(actionText: "Creating wallet",);
        }
        if(state is CredentialFailureState){
          return const  Center(child:Text("Failed"));
        }
        return const  Center(child:Text("Something went wrong"));
      },
    );
  }
}
