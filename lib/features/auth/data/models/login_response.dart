class LoginResponse {
  final bool success;
  final int userId;
  final String username;
  final String fullName;
  final String token;
  final String tokenType;
  final int expiresIn;

  LoginResponse({
    required this.success,
    required this.userId,
    required this.username,
    required this.fullName,
    required this.token,
    required this.tokenType,
    required this.expiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] as bool,
      userId: json['userId'] as int,
      username: json['username'] as String,
      fullName: json['fullName'] as String,
      token: json['token'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: json['expiresIn'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'userId': userId,
      'username': username,
      'fullName': fullName,
      'token': token,
      'tokenType': tokenType,
      'expiresIn': expiresIn,
    };
  }
}