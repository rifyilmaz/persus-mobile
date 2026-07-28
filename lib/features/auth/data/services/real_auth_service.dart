import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/login_request.dart';
import '../models/login_response.dart';
import 'auth_service.dart';

class RealAuthService implements AuthService {
  final String baseUrl;

  const RealAuthService({
    required this.baseUrl,
  });

  @override
  Future<LoginResponse> login({
    required String username,
    required String verificationCode,
    required String language,
  }) async {
    final uri = Uri.parse('$baseUrl/login');

    final request = LoginRequest(
      username: username,
      verificationCode: verificationCode,
      language: language,
    );

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Giriş işlemi başarısız oldu: ${response.statusCode}');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    return LoginResponse.fromJson(data);
  }
}