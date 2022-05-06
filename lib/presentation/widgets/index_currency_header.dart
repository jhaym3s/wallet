import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hodl/presentation/screens/transactions/receive.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/top_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../bloc/wallet_bloc.dart';
import '../../components/loading.dart';
import '../../configs/constants.dart';
import '../../models/coin_geko_api.dart';
import '../screens/transactions/send.dart';
import 'modal_sheet_child.dart';

class IndexCurrencyHeader extends StatelessWidget {
  const IndexCurrencyHeader({
    Key? key,
    required this.currency,
  }) : super(key: key);

  final CoinGeko currency;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("\$${currency.currentPrice.toString()}",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: kPrimaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            const Gap(9),
            Text("${currency.priceChangePercentage24H!.toStringAsFixed(2)}%",
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: currency.priceChangePercentage24H! < 0
                        ? Colors.red
                        : Colors.green,
                    fontSize: 22))
          ],
        ),
        const Gap(10),
        CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(currency.image!),
          backgroundColor: Colors.transparent,
        ),
        const Gap(10),
        Text("Amount owned",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor)),
        Text("~Dollar Equivalent",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 20, color: kPrimaryColor)),
        const Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopIconsAndLabel(
              images: AssetsImages.sendWhite,
              label: "Send",
              backGroundColor: kPrimaryColor,
              onTap: () {
                pushNewScreenWithRouteSettings(
                  context,
                  settings: RouteSettings(
                      name: SendScreen.routeName, arguments: currency.id),
                  screen: const SendScreen(),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
              },
            ),
            const Gap(40),
            TopIconsAndLabel(
              images: AssetsImages.recieveWhite,
              label: "Recieve",
              backGroundColor: kPrimaryColor,
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: true,
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                      heightFactor: 0.6,
                      child: BlocBuilder<WalletBloc, WalletState>(
                        builder: (context, state) {
                          if (state is DisplaySpecificCurrency) {
                            return ReceiveScreen(
                              address: state.walletAddress,
                            );
                          }
                          if (state is CredentialFailureState) {
                            return Column(
                              children: [
                                Image.asset(AssetsImages.logo),
                                const Gap(20),
                                Text(
                                  "An error occured",
                                  style: Theme.of(context).textTheme.bodyText1,
                                )
                              ],
                            );
                          }
                          if (state is CredentialLoadingState) {
                            return const Loading(actionText: "Loading");
                          }
                          return const Loading(actionText: "Default");
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        const Divider(
          color: kPrimaryColor,
        )
      ],
    );
  }
}
