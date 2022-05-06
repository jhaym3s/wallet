import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodl/components/components.dart';
import 'package:hodl/presentation/screens/index_token_screen.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/token_list_item.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../bloc/wallet_bloc.dart';


class TokenList extends StatelessWidget {
  const TokenList({Key? key,
   required this.selectedCurrencyList
   }) : super(key: key);
  final List selectedCurrencyList;

  @override
  Widget build(BuildContext context) {
    return 
        selectedCurrencyList.isEmpty
              ? const Center(
                  child: Text("Add your favorite currency"),
                )
              : 
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return  Padding(
                      padding:  const EdgeInsets.only(top: 10.0),
                      child: TokenListItem(
                        currency: selectedCurrencyList[index],
                      ),
                    );
                  },
                );
  }
}

