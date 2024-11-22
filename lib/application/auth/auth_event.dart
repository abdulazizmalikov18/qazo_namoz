part of 'auth_bloc.dart';

sealed class AuthEvent {}

class LogOutEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;
  final Function(String error) onError;

  LoginEvent({
    required this.password,
    required this.phone,
    required this.onError,
  });
}

class RegisterEvent extends AuthEvent {
  final String phone;
  final String password;
  final Function(String error) onError;
  final VoidCallback onSucces;

  RegisterEvent({
    required this.password,
    required this.phone,
    required this.onError,
    required this.onSucces,
  });
}

class GetMeEvent extends AuthEvent {}
