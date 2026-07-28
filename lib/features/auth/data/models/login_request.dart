class LoginRequest {
  final String username;
  final String verificationCode;
  final String language;

  LoginRequest({
    required this.username,
    required this.verificationCode,
    required this.language,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'verificationCode': verificationCode,
      'language': language,
    };
  }
}