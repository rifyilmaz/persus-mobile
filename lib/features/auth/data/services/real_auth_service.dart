import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/login_request.dart';
import '../models/login_response.dart';
import 'auth_service.dart';
import 'auth_session.dart';

class RealAuthService implements AuthService {
  final String baseUrl;
  final AuthSession session;

  const RealAuthService({
    required this.baseUrl,
    required this.session,
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
        throw const FormatException();
      }

      data = decoded;
    } catch (_) {
      throw Exception(
        'Sunucudan geçerli bir JSON yanıtı alınamadı.',
      );
    }

    if (response.statusCode < 200 ||
        response.statusCode >= 300) {
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

    if (loginResponse.token.trim().isEmpty) {
      throw Exception(
        'Giriş başarılı ancak sunucudan geçerli bir token alınamadı.',
      );
    }

    session.setToken(loginResponse.token);

    return loginResponse;
  }
}