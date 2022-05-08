class Wallet {
  final int? id;
  final String name;
  final String? keyPhrase;
  final String ethAddress;
  final String privateKey;

  Wallet({this.id, required this.name, required this.ethAddress, required this.keyPhrase, required this.privateKey});

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
        id: json['id'],
        name: json['name'],
         ethAddress: json['ethAddress'], 
         keyPhrase: json['keyPhrase'], 
         privateKey: json['privateKey'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ethAddress':ethAddress,
      'keyPhrase': keyPhrase,
      'privateKey': privateKey,
    };
  }
}