part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final UserModel? user;

  const AuthState({this.user});
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  const LoginSuccess({required super.user});
}

final class LoginFailure extends AuthState {
  final String message;
  const LoginFailure({required this.message});
}

final class FistTimeLaunch extends AuthState {}

final class CheckAuthStateFailure extends AuthState {}

final class CheckAuthStateSuccess extends AuthState {
  const CheckAuthStateSuccess({required super.user});
}