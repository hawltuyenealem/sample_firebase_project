
class ErrorResponse {
  String message ;
  int code;

  ErrorResponse({
    required this.message,
    required this.code,
});
  factory ErrorResponse.fromJson(Map<String,dynamic> json){
    return ErrorResponse(message: json['message'] as String, code: json['code'] as int);
  }
}