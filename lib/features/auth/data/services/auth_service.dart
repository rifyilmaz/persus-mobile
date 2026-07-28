import '../models/login_response.dart';

abstract class AuthService {
  Future<LoginResponse> login({
    required String username,
    required String verificationCode,
    required String language,
  });
}