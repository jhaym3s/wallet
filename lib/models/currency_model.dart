
import 'package:hodl/models/coin_geko_api.dart';

class CurrencyModel {
  final double amountOwned;
  final double currencyWorth;
  final CoinGeko coinGeko;


  CurrencyModel({
    required this.amountOwned,
    required this.currencyWorth,
    required this.coinGeko,
  });

}

class CyrrencyHandler{

  final List<CurrencyModel> _currency = [];

  List<CurrencyModel> get currency {
    return [..._currency];
  } 

  // List<CurrencyModel> get addedCurrencies{
  //   return _currency.where((currency) => currency.isAdded == true).toList();
  // }

  CurrencyModel findById(String id) {
    return _currency.firstWhere((currency) => currency.coinGeko.id == id);
  }
}