import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodl/bloc/currency_bloc.dart';
import 'package:hodl/configs/configs.dart';
import 'package:hodl/presentation/screens/authentication_screens/authentication_screens.dart';
import 'package:hodl/services/address_service.dart';
import 'package:hodl/services/coin_geko_service.dart';
import 'package:hodl/services/configuration_service.dart';
import 'package:hodl/services/currency_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'bloc/credential_bloc.dart';
import 'data/coin_geko_client.dart';
import 'data/coin_geko_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final CoinGekoRespository coinGekoRespository = CoinGekoRespository(
      coinGekoClient: CoinGekoClient(httpClient: http.Client()));
  runApp(MyApp(
    addressService: AddressService(
      ConfigurationService(await SharedPreferences.getInstance()),
    ),
    coinGekoService: CoinGekoService(
        currencyService: CurrencyService(await SharedPreferences.getInstance()),
        coinGekoRespository: coinGekoRespository),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp(
      {Key? key,
      required this.addressService,
      required this.coinGekoService})
      : super(key: key);
  final AddressService addressService;
  
  final CoinGekoService coinGekoService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CredentialBloc>(
          create: (BuildContext context) =>
              CredentialBloc(addressService: addressService),
        ),
        BlocProvider<CurrencyBloc>(
          create: (BuildContext context) => CurrencyBloc(
              coinGekoService: coinGekoService),
        ),
      ],
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
