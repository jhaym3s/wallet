import 'package:flutter/material.dart';
import 'package:hodl/presentation/screens/authentication_screens/intro_screen.dart';

import '../presentation/screens/authentication_screens/authentication_screens.dart';

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
        // case ChangePassword.routeName:
        // return  MaterialPageRoute(builder: (_)=> const ChangePassword());
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