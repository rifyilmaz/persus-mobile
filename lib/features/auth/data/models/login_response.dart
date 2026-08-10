class LoginResponse {
  final String status;
  final int errorCode;
  final String errorMsg;

  final String token;
  final String tokenType;

  final String userId;
  final String username;
  final String fullName;

  const LoginResponse({
    required this.status,
    required this.errorCode,
    required this.errorMsg,
    required this.token,
    required this.tokenType,
    required this.userId,
    required this.username,
    required this.fullName,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    final result = json['result'];

    final resultMap = result is Map<String, dynamic>
        ? result
        : <String, dynamic>{};

    return LoginResponse(
      status: json['status']?.toString() ?? '',
      errorCode: _parseInt(json['errorCode']),
      errorMsg: json['errorMsg']?.toString() ?? '',

      token: resultMap['token']?.toString() ?? '',
      tokenType: resultMap['tokenType']?.toString() ?? '',

      userId: resultMap['userId']?.toString() ?? '',
      username: resultMap['username']?.toString() ?? '',
      fullName: resultMap['fullName']?.toString() ?? '',
    );
  }

  bool get isSuccess {
    return status == 'OK' &&
        errorCode == 0 &&
        token.isNotEmpty;
  }

  static int _parseInt(dynamic value) {
    if (value is int) {
      return value;
    }

    return int.tryParse(value?.toString() ?? '') ?? -1;
  }
}