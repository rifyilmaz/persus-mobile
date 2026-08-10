import '../models/login_response.dart';
import 'auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    await Future<void>.delayed(
      const Duration(milliseconds: 500),
    );

    if (username.isEmpty || password.isEmpty) {
      throw Exception(
        'Kullanıcı adı ve şifre boş bırakılamaz.',
      );
    }

    return LoginResponse(
      status: 'OK',
      errorCode: 0,
      errorMsg: '',
      token: 'mock-token',
      tokenType: 'Bearer',
      userId: '1',
      username: username,
      fullName: username,
    );
  }
}