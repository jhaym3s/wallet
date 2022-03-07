import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/configs/configs.dart';
import 'package:hodl/presentation/widgets/copy_button.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/top_balance.dart';

class WalletScreen extends StatefulWidget {
  static const routeName = "/wallet_screen";
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  

  @override
  void initState() {
    _tabController = TabController(length: tabsLabel.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  List<Tab> tabsLabel = <Tab>[
    const Tab(text: 'Token'),
    const Tab(text: 'NFT'),
  ];
  late TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopBalance(),
              TabBar(
                labelColor: kPrimaryColor,
                indicatorPadding: const EdgeInsets.only(bottom: 0),
                unselectedLabelColor: Colors.grey,
                //indicatorColor: kBlack,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                controller: _tabController,
                isScrollable: true,
                tabs: tabsLabel,
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
