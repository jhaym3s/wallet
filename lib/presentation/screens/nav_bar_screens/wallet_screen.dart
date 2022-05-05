import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hodl/components/components.dart';
import 'package:hodl/presentation/widgets/nft_screen.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/successful_walllet_screen.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/token_list.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/top_balance.dart';

import '../../../bloc/wallet_bloc.dart';
import '../../../configs/configs.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = "/walletscreen";

  const WalletScreen({Key? key}) : super(key: key);
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            if (state is DisplayMnemonicsState) {
              context.read<WalletBloc>().add(GetWallaetItem());
            }
            if (state is DisplayWalletItemState) {
              return SuccessfullWalletScreen(
                ethAddress: state.walletAddress,
                currencyList: state.allCurrencies,
              );
            }
            if(state is CredentialLoadingState){
              const Center(child: Loading(actionText: "Loading",));
            }
            if (state is CredentialFailureState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AssetsImages.logo),
                    const Gap(20),
                    Text(
                      "An error occured",
                      style: Theme.of(context).textTheme.bodyText1,
                    )
                  ],
                ),
              );
            }
            return const Center(
              child: Loading(actionText: "Loading"),
            );
          },
        ),
      ),
    );
  }
}

