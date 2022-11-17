part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class Register extends AuthEvent{
  SignUpRequest signUpRequest;
  Register({
    required this.signUpRequest
});
  @override
  List<Object> get props => [];
}
class Login extends AuthEvent{
  LoginRequest loginRequest;
  Login({
    required this.loginRequest
});
  @override
  List<Object> get props => [];
}