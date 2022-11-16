class LoginRequest{
  final String email;
  final String password;
  LoginRequest({required this.email, required this.password});

  toJson(){
    return {
      'email' : email,
      'password':password
    };
  }
}