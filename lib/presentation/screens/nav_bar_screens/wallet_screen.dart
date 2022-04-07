import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodl/components/components.dart';
import 'package:hodl/presentation/widgets/nft_screen.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/successful_walllet_screen.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/token_list.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/top_balance.dart';

import '../../../bloc/credential_bloc.dart';
import '../../../bloc/currency_bloc.dart';
import '../../../configs/configs.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = "/walletscreen";

  const WalletScreen({Key? key}) : super(key: key);
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
   context.read<CurrencyBloc>().add(GetAllCurrenciesAndSave());
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: BlocBuilder<CredentialBloc, CredentialState>(
          builder: (context, state) {
            if (state is GenerateCredentialMnemonicsState) {
              context.read<CredentialBloc>().add(GetPrivateKeyEvent());
            }
            if (state is GetPrivateKeyState) {
              context
                  .read<CredentialBloc>()
                  .add(GetEthAddressEvent(privateKey: state.privateKey!));
            }
            if (state is GetWalletAddressState) {
              return SuccessfullWalletScreen(
                  ethAddress: state.walletAddress.toString());
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

class GetAllSharedPrefCurrencyEvent {
}
