import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_firebase_project/data/models/error_response.dart';
import 'package:sample_firebase_project/data/models/login_request.dart';
import 'package:sample_firebase_project/data/models/response.dart';
import 'package:sample_firebase_project/data/models/sign_up_request.dart';
import 'package:sample_firebase_project/data/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {

    on<AuthEvent>((event, emit)async {
      // TODO: implement event handler
      if(event is Register){
        var response  = await authRepository.register(signUpRequest: event.signUpRequest);
        response.fold(
                (errorResponse) => emit(AuthError(errorResponse: errorResponse)),
                (response) => emit(AuthLoaded(response: response)),
        );

      }
      if (event is Login){
        var response = await authRepository.login(loginRequest: event.loginRequest);
        response.fold(
                (errorResponse) =>emit(AuthError(errorResponse: errorResponse)) ,
                (response) => emit(AuthLoaded(response: response))
        );
      }
    });

  }
}
