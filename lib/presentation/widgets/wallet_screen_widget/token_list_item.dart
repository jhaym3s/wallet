import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodl/bloc/wallet_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../models/coin_geko_api.dart';
import '../../screens/index_token_screen.dart';

class TokenListItem extends StatelessWidget {
  const TokenListItem({Key? key, required this.currency}) : super(key: key);

  final CoinGeko currency;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context) => IndexTokenScreen(id: currency.id)));
           pushNewScreenWithRouteSettings(
        context,
        settings:  RouteSettings(name: IndexTokenScreen.routeName,arguments: currency.id),
        screen: const IndexTokenScreen(),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
          },
          leading: CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(currency.image!),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            currency.name!,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            currency.currentPrice.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currency.symbol!.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                "\$00.00",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
