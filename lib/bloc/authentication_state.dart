part of 'authentication_bloc.dart';

@immutable
abstract class AuthState extends Equatable{}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props =>[];  
}

class DisplayKeyPhrases extends AuthState{
  final String keyPrase;

  DisplayKeyPhrases({required this.keyPrase});
  @override
  List<Object?> get props => [keyPrase];
}

class AuthLoadingState extends AuthState{
  @override
  List<Object?> get props => [];
}

class AuthFailureState extends AuthState{
  @override
  List<Object?> get props => [];
  
}
