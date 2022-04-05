import '../models/coin_geko_api.dart';
import 'coin_geko_client.dart';

class CoinGekoRespository{

  CoinGekoClient? coinGekoClient;

  CoinGekoRespository({required this.coinGekoClient});

  Future<List<CoinGeko>> getCoinAsset() async {
    final response = coinGekoClient!.getCoinAsset();
    return response;
  }
}