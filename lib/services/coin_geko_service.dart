import 'package:hodl/data/coin_geko_repository.dart';
import 'package:hodl/services/currency_service.dart';

import '../models/coin_geko_api.dart';

abstract class ICoinGekoService {
  void getCurrencies();
  void saveCurrencies();
  List<CoinGeko> getSavedCurrencies();
  void addToSelectedCurrencies(String id);
  void removeFromSelectedCurrecies(String id);
}

class CoinGekoService implements ICoinGekoService {
  final ICurrencyService currencyService;
  final CoinGekoRespository coinGekoRespository;
  CoinGekoService(
      {required this.currencyService, required this.coinGekoRespository});

  List<CoinGeko> _allCurrency = [];
  final String allCurrencyKey = "allCurrency";
  final String selectedCurrencyKey = "selectedKey";

  List<CoinGeko> get allCurrency {
    return [..._allCurrency];
  }

  CoinGeko get bnb {
    return _allCurrency.firstWhere((coin) => coin.id == "");
  }

  @override
  Future getCurrencies() async {
    List<CoinGeko> coinGekoList = await coinGekoRespository.getCoinAsset();
    _allCurrency = coinGekoList;
    print(_allCurrency);
   // return allCoinGekoCurrencies;
  }

  @override
  void saveCurrencies() async {
    await currencyService.saveList(allCurrencyKey, allCurrency);
    print("object");
  }

  @override
  List<CoinGeko> getSavedCurrencies() {
    final sharedprefGekoList = currencyService.getList(allCurrencyKey);
    print(sharedprefGekoList);
    return sharedprefGekoList;
  }

  List<CoinGeko> selectedCurrency = [];


  @override
  void addToSelectedCurrencies(String id) {
    CoinGeko currency =
        _allCurrency.firstWhere((coin) => coin.id == id);
    selectedCurrency.add(currency);
  }

  @override
  void removeFromSelectedCurrecies(String id) {
    CoinGeko currency =
        _allCurrency.firstWhere((coin) => coin.id == id);
        selectedCurrency.remove(currency);
  }

  setToBool(String id){
    CoinGeko currency = _allCurrency.firstWhere((coin) => coin.id == id);
    currency.isAdded == true;
  }

  void saveSelectedCurency()async{
      await currencyService.saveList(selectedCurrencyKey, selectedCurrency);
  }
  
  List<CoinGeko> getSavedSelectedCurrency(){
      return currencyService.getList(selectedCurrencyKey);
  }
}
