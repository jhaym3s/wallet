import 'package:hodl/models/coin_geko_api.dart';
import 'package:json_annotation/json_annotation.dart';


part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel {
  final double amountOwned;
  final double currencyWorth;
  final CoinGeko coinGeko;


  CurrencyModel({
    required this.amountOwned,
    required this.currencyWorth,
    required this.coinGeko,
  });

    factory CurrencyModel.fromJson(Map<String, dynamic> json) => _$CurrencyModelFromJson(json);

    Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);



}

// class CyrrencyHandler{

//   final List<CurrencyModel> _currency = [];

//   List<CurrencyModel> get currency {
//     return [..._currency];
//   } 

//   // List<CurrencyModel> get addedCurrencies{
//   //   return _currency.where((currency) => currency.isAdded == true).toList();
//   // }

//   CurrencyModel findById(String id) {
//     return _currency.firstWhere((currency) => currency.coinGeko.id == id);
//   }
// }