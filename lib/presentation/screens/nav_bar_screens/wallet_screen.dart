import 'package:flutter/material.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/token_list.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/top_balance.dart';

import '../../../configs/configs.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = "/walletscreen";

  const WalletScreen({Key? key}) : super(key: key);
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
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
        child: Column(
          children: [
            const TopBalance(),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // indicator: BoxDecoration(
                //   borderRadius: BorderRadius.circular(
                //     10.0,
                //   ),
                //   color: Colors.grey.shade900,
                // ),
                labelColor: kBlack,
                indicatorColor: kBlack,
                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold, fontSize: 25),
                unselectedLabelColor: Colors.grey[500],
                tabs: const [
                  Tab(
                    text: 'Tokens',
                  ),
                  Tab(
                    text: "NFT",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                 TokenList(),
                  Center(
                    child: Text(
                      'NFT PAGE',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
