import 'package:hodl/data/coin_geko_repository.dart';
import 'package:hodl/services/currency_service.dart';

import '../models/coin_geko_api.dart';

abstract class ICoinGekoService {
  void getCoinGekoCurrency();
  void saveAllCurrencyToSharedPreference();
  List<CoinGeko> getAllCurrencyFromSharedPreference();
  void addToMainScreenList(String id);
  void removeFromMainScreen(String id);
}

class CoinGekoService implements ICoinGekoService {
  final ICurrencyService currencyService;
  final CoinGekoRespository coinGekoRespository;
  CoinGekoService(
      {required this.currencyService, required this.coinGekoRespository});

  List<CoinGeko> _allCoinGekoCurrencies = [];

  List<CoinGeko> get allCoinGekoCurrencies {
    return [..._allCoinGekoCurrencies];
  }

  @override
  Future getCoinGekoCurrency() async {
    List<CoinGeko> coinGekoList = await coinGekoRespository.getCoinAsset();
    _allCoinGekoCurrencies = coinGekoList;
   // return allCoinGekoCurrencies;
  }

  @override
  void saveAllCurrencyToSharedPreference() async {
    await currencyService.saveList("coinGeko", _allCoinGekoCurrencies);
  }

  @override
  List<CoinGeko> getAllCurrencyFromSharedPreference() {
    final sharedprefGekoList = currencyService.getList("coinGeko");
    return sharedprefGekoList;
  }

  List<CoinGeko> mainScreenList = [];


  @override
  void addToMainScreenList(String id) {
    CoinGeko currency =
        _allCoinGekoCurrencies.firstWhere((coin) => coin.id == id);
    mainScreenList.add(currency);
  }

  @override
  void removeFromMainScreen(String id) {
    CoinGeko currency =
        _allCoinGekoCurrencies.firstWhere((coin) => coin.id == id);
        mainScreenList.remove(currency);
  }

  setToBool(String id){
    CoinGeko currency = _allCoinGekoCurrencies.firstWhere((coin) => coin.id == id);
    currency.isAdded == true;
  }

  void saveMainScreenListToSharedPreference()async{
      await currencyService.saveList("mainScreenList", mainScreenList);
  }
  
  List<CoinGeko> getMainScreenListFromSharedPref(){
      return currencyService.getList("mainScreenList");
  }
}
