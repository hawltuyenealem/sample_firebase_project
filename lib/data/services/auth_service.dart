
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sample_firebase_project/data/models/error_response.dart';
import 'package:sample_firebase_project/data/models/login_request.dart';
import 'package:sample_firebase_project/data/models/response.dart';
import 'package:sample_firebase_project/data/models/sign_up_request.dart';

class AuthService {

  Future<Either<ErrorResponse,FireResponse>> login(LoginRequest loginRequest)async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginRequest.email,
        password:loginRequest.password,
      );

      return Right(FireResponse(
          id: credential.user?.uid,
          email: credential.user?.email,
          isActive:credential.user?.isAnonymous,
          phone: credential.user?.phoneNumber,

      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(ErrorResponse(code: 404,message: 'Weak Password'));
        throw Exception('Weak Password');
      } else if (e.code == 'email-already-in-use') {
        return Left(ErrorResponse(code: 404,message: 'email-already-in-use'));
    }
      else {
        return Left(ErrorResponse(code: 404,message: 'Firebase Error occured !!'));
      }
    } catch (e) {
      return Left(ErrorResponse(message: 'Error occured', code: 500));
    }

  }

  Future<Either<ErrorResponse,FireResponse>> signUp(SignUpRequest signUpRequest)async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpRequest.email,
        password:signUpRequest.password,
      );
      return Right(FireResponse(
        id: credential.user?.uid,
        email: credential.user?.email,
        isActive:credential.user?.isAnonymous,
        phone: credential.user?.phoneNumber,

      )
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(ErrorResponse(code: 404,message: 'Weak Password'));
        throw Exception('Weak Password');
      } else if (e.code == 'email-already-in-use') {
        return Left(ErrorResponse(code: 404,message: 'email-already-in-use'));
      }
      else {
        return Left(ErrorResponse(code: 404,message: 'Firebase Error occured !!'));
      }
    } catch (e) {
      return Left(ErrorResponse(message: 'Error occured', code: 500));
    }
  }
  Future<void> signout()async{
    await FirebaseAuth.instance.signOut();
  }

}