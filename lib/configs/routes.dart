import 'package:flutter/material.dart';
import 'package:hodl/presentation/screens/nav_bar_screens/persistent_bottom_nav_bar.dart';
import '../presentation/screens/authentication_screens/authentication_screens.dart';
import '../presentation/screens/index_token_screen.dart';
import '../presentation/screens/nav_bar_screens/nav_bar_screens.dart';

class AppRouter{

  static Route onGenerated(RouteSettings settings){
    //print("Route name is ${settings.name}");
    switch (settings.name) {
      case ImportWallet.routeName:
        return MaterialPageRoute(builder: (_)=> const ImportWallet());
        case CreateWallet.routeName:
        return  MaterialPageRoute(builder: (_)=> const CreateWallet());
        case IntroScreen.routeName:
        return  MaterialPageRoute(builder: (_)=> const IntroScreen());
        case WalletScreen.routeName:
        return  MaterialPageRoute(builder: (_)=> const WalletScreen());
        case CustomNavigationBar.routeName:
        return  MaterialPageRoute(builder: (_)=> const CustomNavigationBar());
        case ImportWithPrivateKey.routeName:
        return  MaterialPageRoute(builder: (_)=> const ImportWithPrivateKey());
         case ImportWithMnemonics.routeName:
        return  MaterialPageRoute(builder: (_)=> const ImportWithMnemonics());
         case IndexTokenScreen.routeName:
        return  MaterialPageRoute(builder: (_)=> const IndexTokenScreen());
        // case HomeScreen.routeName:
        // return  MaterialPageRoute(builder: (_)=> const HomeScreen());
       
      default:
      return onError();
    }
  }

  static Route onError() {
    return  MaterialPageRoute(builder: (_) =>  Scaffold(
      body: Center(child: Text("Error Screen", style: Theme.of(_).textTheme.headline1,),),
    ));
  }
}