import 'package:dartz/dartz.dart';
import 'package:sample_firebase_project/data/models/error_response.dart';
import 'package:sample_firebase_project/data/models/login_request.dart';
import 'package:sample_firebase_project/data/models/response.dart';
import 'package:sample_firebase_project/data/models/sign_up_request.dart';
import 'package:sample_firebase_project/data/services/auth_service.dart';

abstract class AuthRepository {
  Future<Either<ErrorResponse, FireResponse>> login({required LoginRequest loginRequest});
  Future<Either<ErrorResponse, FireResponse>> register({required SignUpRequest signUpRequest});
}
class AuthRepositoryImpl extends AuthRepository{
  AuthService authService;
  AuthRepositoryImpl({
    required this.authService
});

  @override
  Future<Either<ErrorResponse, FireResponse>> login({required LoginRequest loginRequest}) async{
    // TODO: implement login
   return await authService.login(loginRequest);
  }

  @override
  Future<Either<ErrorResponse, FireResponse>> register({required SignUpRequest signUpRequest}) async{
    // TODO: implement register
    return await authService.signUp(signUpRequest);
  }

}