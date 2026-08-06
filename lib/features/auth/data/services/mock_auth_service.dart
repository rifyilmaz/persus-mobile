import 'dart:convert';

import '../models/login_response.dart';
import 'auth_service.dart';

class MockAuthService implements AuthService {
  const MockAuthService();

  @override
  Future<LoginResponse> login({
    required String username,
    required String language,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    if (username.trim().isEmpty) {
      throw Exception('Kullanıcı alanı boş bırakılamaz.');
    }

    final mockJson = jsonEncode({
      'success': true,
      'userId': 101,
      'username': username,
      'fullName': 'Demo Kullanıcı',
      'token': 'mock-token-123456',
      'tokenType': 'Bearer',
      'expiresIn': 3600,
    });

    final data = jsonDecode(mockJson) as Map<String, dynamic>;

    return LoginResponse.fromJson(data);
  }
}