part of 'authentication_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable{}

class CreateWalletEvent extends AuthEvent{
  @override
  List<Object?> get props => [];
}

class ImportWithKeyPhrase extends AuthEvent{
  final String keyPhrase;
  ImportWithKeyPhrase({required this.keyPhrase});
  @override
  List<Object?> get props => [keyPhrase];
}

class ImportWithPrivateKey extends AuthEvent{
  final String privateKey;
  ImportWithPrivateKey({required this.privateKey});
  @override
  List<Object?> get props => [privateKey];
}




