class RegisterResponse {
  final String accessToken;
  final String userId;
  final String message;

  RegisterResponse({
    required this.accessToken,
    required this.userId,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      accessToken: json['token']['access'],
      userId: json['user_id'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': {'access': accessToken},
      'user_id': userId,
      'message': message,
    };
  }
}
