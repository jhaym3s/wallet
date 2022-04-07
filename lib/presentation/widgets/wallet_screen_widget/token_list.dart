import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodl/components/components.dart';
import 'package:hodl/presentation/screens/index_token_screen.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/token_list_item.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../bloc/currency_bloc.dart';

class TokenList extends StatelessWidget {
  const TokenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyBloc, CurrencyState>(
      builder: (context, state) {
        if (state is CurrencyInitial) {
          context.read<CurrencyBloc>().add(GetMainListFromSharedPref());
        }
        if (state is GetMainScreenListState) {
          return state.mainScreenList.isEmpty
              ? const Center(
                  child: Text("Add your favorite currency"),
                )
              : ListView.builder(
                  //itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TokenListItem(
                        coinGeko: state.mainScreenList[index],
                      ),
                    );
                  },
                );
        }
        return const Loading(actionText: "Default");
      },
    );
  }
}

class token extends StatelessWidget {
  const token({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        pushNewScreenWithRouteSettings(context,
            screen: const IndexTokenScreen(),
            settings: const RouteSettings(
                name: IndexTokenScreen.routeName, arguments: "id"));
        //Navigator.of(context).pushNamed("");
      },
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
      ),
      title: Text(
        "Etheruem",
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "\$400.00",
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
            "18 ETH",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            "\$400.00",
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
