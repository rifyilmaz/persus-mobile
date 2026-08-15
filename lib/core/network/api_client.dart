import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../features/auth/data/services/auth_session.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  final String baseUrl;
  final AuthSession session;

  const ApiClient({
    required this.baseUrl,
    required this.session,
  });

  Future<Map<String, dynamic>> get(String path) async {
    final token = session.token;

    if (token == null || token.isEmpty) {
      throw Exception(
        'Oturum bulunamadı. Lütfen tekrar giriş yapın.',
      );
    }

    final uri = Uri.parse('$baseUrl$path');

    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    final token = session.token;

    if (token == null || token.isEmpty) {
      throw Exception(
        'Oturum bulunamadı. Lütfen tekrar giriş yapın.',
      );
    }

    final uri = Uri.parse('$baseUrl$path');

    final response = await http.post(
      uri,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: body != null ? jsonEncode(body) : null,
    );

    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(
    http.Response response,
  ) {
    Map<String, dynamic> data;

    try {
      final decoded = jsonDecode(response.body);
      debugPrint(
        'API RESPONSE [${response.statusCode}]: ${response.body}',
      );

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
        'API isteği başarısız oldu. '
        'HTTP ${response.statusCode}',
      );
    }

    final status = data['status']?.toString();

    if (status != null &&
        status.isNotEmpty &&
        status.toUpperCase() != 'OK') {
      final errorMessage = data['errorMsg']?.toString();

      throw Exception(
        errorMessage != null && errorMessage.isNotEmpty
            ? errorMessage
            : 'API isteği başarısız oldu.',
      );
    }

    return data;
  }
}