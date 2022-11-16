import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_firebase_project/data/models/error_response.dart';
import 'package:sample_firebase_project/data/models/response.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit)async {
      // TODO: implement event handler
      if(event is Register){
        var response  = await
      }
      if (event is Login){

      }
    });

  }
}
