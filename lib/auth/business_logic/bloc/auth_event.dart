part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
 
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent{
  final String username;
  final String password;

  const LoginEvent({
    required this.username,
    required this.password,
  });
}

class CheckAuthStateEvent extends AuthEvent{}

