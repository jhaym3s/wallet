
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/coin_geko_api.dart';

abstract class ICurrencyService {
Future<void> saveList(String key,  value);
List<CoinGeko> getList(key);
  
}

class CurrencyService implements ICurrencyService{
  CurrencyService(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  Future<void> saveList(String key, value) async{
    await _sharedPreferences.setString(key, json.encode(value));
  }

  @override
  List<CoinGeko> getList(key) {
    return json.decode(_sharedPreferences.getString(key)!);
  }


}

class SharedPref {
  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)!);
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}