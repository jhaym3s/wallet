import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../models/coin_geko_api.dart';
import '../../screens/index_token_screen.dart';

class TokenListItem extends StatelessWidget {
  const TokenListItem({ Key? key, required this.coinGeko}) : super(key: key);

  final CoinGeko coinGeko;

  @override
  Widget build(BuildContext context) {
     return Column(
       children: [
         ListTile(
          onTap: () {
            pushNewScreenWithRouteSettings(context,
                screen: const IndexTokenScreen(),
                settings:
                    const RouteSettings(name: IndexTokenScreen.routeName, arguments: "id"));
            //Navigator.of(context).pushNamed("");
          },
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
          ),
          title: Text(
            coinGeko.name!,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            coinGeko.currentPrice.toString(),
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
                coinGeko.symbol!,
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