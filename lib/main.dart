import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodl/configs/configs.dart';
import 'package:hodl/presentation/screens/authentication_screens/authentication_screens.dart';
import 'package:hodl/services/address_service.dart';
import 'package:hodl/services/configuration_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/credential_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(  MyApp(
    addressService:
        AddressService(ConfigurationService(await SharedPreferences.getInstance()),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.addressService}) : super(key: key);
  final AddressService addressService;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CredentialBloc(addressService: addressService),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Hodl',
          theme: AppTheme().lightTheme,
          darkTheme: AppTheme().darkTheme,
          onGenerateRoute: AppRouter.onGenerated,
          home: const SplashScreen()),
    );
  }
}
