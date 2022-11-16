class FireResponse{
  final String? email;
  final String? phone;
  final bool? isActive;
  final String? id;

  FireResponse(
      {
        this.phone,
        this.email,
        this.id,
        this.isActive,});

  factory FireResponse.fromJson(Map<String, dynamic> json) {
    return FireResponse(
        phone: json['phone'],
        email: json['email'],
        id: json['id'],
        isActive: json['isActive'],
    );
  }
}