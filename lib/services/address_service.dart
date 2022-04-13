import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:convert/convert.dart';
import 'package:hex/hex.dart';
import 'package:hodl/services/service.dart';
import 'package:web3dart/web3dart.dart';

abstract class IAddressService {
  String generateMnemonic();
  Future<String> getPrivateKey(String mnemonic);
  Future<EthereumAddress> getPublicAddress(String privateKey);
  Future<bool> setupFromMnemonic(String mnemonic);
  Future<bool> setupFromPrivateKey(String privateKey);
  String entropyToMnemonic(String entropyMnemonic);
}

class AddressService implements IAddressService {
  const AddressService(this._configService);

  final IConfigurationService _configService;

  @override
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  @override
  String entropyToMnemonic(String entropyMnemonic) {
    final result = bip39.entropyToMnemonic(entropyMnemonic);
    return result;
  }

  @override
  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeedHex(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(hex.decode(seed),
        masterSecret: 'Bitcoin seed');
    final privateKey = HEX.encode(master.key);
    print('private: $privateKey');
    return privateKey;
  }

  @override
  Future<EthereumAddress> getPublicAddress(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.extractAddress();
    print('address: $address');
    return address;
  }

  String? getPrefMnemonics() {
    final mnemonics = _configService.getMnemonic();
    return mnemonics;
  }

  String? getPrefPrivateKey() {
    final privateKey = _configService.getPrivateKey();
    return privateKey;
  }

  String? getprefEthAddress() {
    final ethAddress = _configService.getEthAddress();
    return ethAddress;
  }

  @override
  Future<bool> setupFromMnemonic(String mnemonic) async {
    final cryptoMnemonic = bip39.mnemonicToEntropy(mnemonic);
    final privateKey = await getPrivateKey(mnemonic);
    final ethAddress = await getPublicAddress(privateKey);
    print(privateKey);
    await _configService.setMnemonic(mnemonic);
    await _configService.setPrivateKey(privateKey);
    await _configService.setEthAddress(ethAddress.toString());
    await _configService.setupDone(true);
    print("Done");
    return true;
  }

  @override
  Future<bool> setupFromPrivateKey(String privateKey) async {
    await _configService.setMnemonic(null);
    await _configService.setupDone(true);
    await _configService.setPrivateKey(privateKey);
    final ethAddress = await getPublicAddress(privateKey);
    await _configService.setEthAddress(ethAddress.toString());
    return true;
  }

  
}
