import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hodl/configs/configs.dart';
import 'package:hodl/presentation/widgets/index_currency_header.dart';

import '../../bloc/wallet_bloc.dart';
import '../widgets/wallet_screen_widget/top_icons.dart';

class IndexTokenScreen extends StatefulWidget {
  static const routeName = "index_token_screen";
  const IndexTokenScreen({Key? key, }) : super(key: key);

  @override
  State<IndexTokenScreen> createState() => _IndexTokenScreenState();
}

class _IndexTokenScreenState extends State<IndexTokenScreen> {

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.read<WalletBloc>().add(GetWallaetItem());
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: kWhite,
                )),
            centerTitle: true,
            title: Text(
              id,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: kWhite),
            ),
          ),
          body: BlocBuilder<WalletBloc, WalletState>(
            builder: (context, state) {
              if(state is DisplayWalletItemState){
                context.read<WalletBloc>().add(FindCurrencyEvent(id: id));
              }
              if(state is DisplaySpecificCurrency){
                  return Column(
                children: [
                  IndexCurrencyHeader(currencyPrice: state.currency.currentPrice!,priceChangePercentage24H: state.currency.priceChangePercentage24H!,),
                  Expanded(child: Container()),
                ],
              );
              }
              return const Center(child: Text("Hi"),);
            },
          )),
    );
  }
}
