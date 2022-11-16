part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class Register extends AuthEvent{
  @override
  List<Object> get props => [];
}
class Login extends AuthEvent{
  @override
  List<Object> get props => [];
}