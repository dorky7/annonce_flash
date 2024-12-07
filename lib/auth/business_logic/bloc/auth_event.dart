part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final RegisterRequest request;

  const SignUpEvent({
    required this.request,
  });
}

class CheckAuthStateEvent extends AuthEvent {}
