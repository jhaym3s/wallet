import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/credentials.dart';

abstract class IConfigurationService {
  Future<void> setMnemonic(String? value);
  Future<void> setupDone(bool value);
  Future<void> setPrivateKey(String? value);
  Future<void> setEthAddress(String? value);
  String? getMnemonic();
  String? getPrivateKey();
  String? getEthAddress();
  bool didSetupWallet();
}

class ConfigurationService implements IConfigurationService {
  const ConfigurationService(this._preferences);

  final SharedPreferences _preferences;
  

  @override
  Future<void> setMnemonic(String? value) async {
    await _preferences.setString('mnemonic', value ?? '');
  }

  @override
  Future<void> setPrivateKey(String? value) async {
    await _preferences.setString('privateKey', value ?? '');
  }

  @override
  Future<void> setupDone(bool value) async {
    await _preferences.setBool('didSetupWallet', value);
  }

  @override
  Future<void> setEthAddress(String? value) async {
    await _preferences.setString('ethAddress', value ?? '');
  }

  // gets
  @override
  String? getMnemonic() {
    return _preferences.getString('mnemonic');
  }

  @override
  String? getPrivateKey() {
    return _preferences.getString('privateKey');
  }

  @override
  bool didSetupWallet() {
    return _preferences.getBool('didSetupWallet') ?? false;
  }

  @override
  String? getEthAddress() {
    return _preferences.getString('ethAddress') ?? "";
  }

  
}
