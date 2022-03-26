part of 'credential_bloc.dart';

@immutable
abstract class CredentialEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetMnemonicsEvent extends CredentialEvent{}

class GetPrivateKeyEvent extends CredentialEvent{}

class GetEthAddressEvent extends CredentialEvent{
  final String privateKey;

  GetEthAddressEvent({required this.privateKey});
   @override
  List<Object?> get props => [privateKey];
}








