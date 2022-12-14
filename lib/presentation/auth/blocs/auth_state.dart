part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}
class AuthLoading extends AuthState{
  @override
  List<Object> get props => [];
}
class AuthLoaded extends AuthState{
  FireResponse response;
  AuthLoaded({required this.response});
  @override
  List<Object> get props => [];
}
class AuthError extends AuthState{
  ErrorResponse errorResponse;
  AuthError({
    required this.errorResponse
});
  @override
  List<Object> get props => [];
}