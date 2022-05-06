import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodl/presentation/widgets/create_wallet_success_screen.dart';

import '../../../bloc/authentication_bloc.dart';
import '../../../bloc/wallet_bloc.dart';
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if(state is DisplayKeyPhrases){
          return CreateWalletSuccessScreen(mnmonics: state.keyPrase);
        }
        if(state is AuthLoadingState){
          return const Loading(actionText: "Creating wallet",);
        }
        if(state is AuthFailureState){
          return const  Center(child:Text("Failed"));
        }
        return const  Center(child:Text("Something went wrong"));
      },
    );
  }
}
