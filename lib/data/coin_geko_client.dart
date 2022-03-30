import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/coin_geko_api.dart';


class CoinGekoClient {
  static const _baseUrl =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false';

  http.Client httpClient;
  CoinGekoClient({required this.httpClient});

  Future<List<CoinGeko>> getCoinAsset() async {
    final url = Uri.parse(_baseUrl);
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('error getting coin cap assets');
    }
    return coinGekoFromJson(response.body);
  }
}
