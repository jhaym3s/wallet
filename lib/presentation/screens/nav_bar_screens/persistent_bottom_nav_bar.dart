import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hodl/presentation/screens/nav_bar_screens/nav_bar_screens.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../configs/configs.dart';

class CustomNavigationBar extends StatefulWidget {
  static const routeName = "custom_nav_bar";
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late PersistentTabController _pageController;

  List<Widget> _children() {
    return [
      const WalletScreen(),
      const DiscoverScreen(),
      const Dapps(),
      const SettingsScreen(),
      const InfoScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 22,
       icon: const Icon(Icons.account_balance_wallet_outlined),
        title: ("Wallet"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 22,
        icon: const Icon(CupertinoIcons.compass_fill),
        title: ("Discover"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 22,
        icon: const Icon(CupertinoIcons.square_grid_2x2_fill),
        title: ("Browser"),
       activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 22,
        icon: const Icon(Icons.settings),
        title: ("Setting"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary:Colors.grey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 22,
        icon: const Icon(CupertinoIcons.info),
        title: ("More"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary:Colors.grey,
      ),
     
    ];
  }

  late List<Map<Object, Object>> pages;

  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pageController = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _pageController,
      screens: _children(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        // borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      
      popActionScreens: PopActionScreensType.once,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarHeight: 55,
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
