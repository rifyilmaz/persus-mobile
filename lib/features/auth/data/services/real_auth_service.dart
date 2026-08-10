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
    required String password,
  }) async {
    final uri = Uri.parse('$baseUrl/authenticate');

    final request = LoginRequest(
      username: username,
      password: password,
    );

    final response = await http.post(
      uri,
      headers: const {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    Map<String, dynamic> data;

    try {
      final decoded = jsonDecode(response.body);

      if (decoded is! Map<String, dynamic>) {
        throw const FormatException(
          'Sunucudan beklenmeyen veri formatı döndü.',
        );
      }

      data = decoded;
    } on FormatException {
      throw Exception(
        'Sunucudan geçerli bir JSON yanıtı alınamadı.',
      );
    }

    if (response.statusCode != 200) {
      final errorMessage = data['errorMsg']?.toString();

      if (errorMessage != null && errorMessage.isNotEmpty) {
        throw Exception(errorMessage);
      }

      throw Exception(
        'Giriş işlemi başarısız oldu. '
        'HTTP ${response.statusCode}',
      );
    }

    final loginResponse = LoginResponse.fromJson(data);

    if (!loginResponse.isSuccess) {
      if (loginResponse.errorMsg.isNotEmpty) {
        throw Exception(loginResponse.errorMsg);
      }

      throw Exception(
        'Kullanıcı adı veya şifre hatalı.',
      );
    }

    return loginResponse;
  }
}