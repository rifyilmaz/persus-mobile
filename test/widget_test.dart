import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:persus_mobile/features/auth/data/models/login_response.dart';
import 'package:persus_mobile/features/auth/data/services/auth_service.dart';
import 'package:persus_mobile/features/auth/presentation/login_page.dart';

class FakeAuthService implements AuthService {
  bool loginCalled = false;
  String? receivedUsername;
  String? receivedPassword;

  @override
  Future<LoginResponse> login({
    required String username,
    required String password,
  }) async {
    loginCalled = true;
    receivedUsername = username;
    receivedPassword = password;

    return LoginResponse(
      status: 'OK',
      errorCode: 0,
      errorMsg: '',
      token: 'test-token',
      tokenType: 'Bearer',
      userId: '1',
      username: username,
      fullName: username,
    );
  }
}

void main() {
  testWidgets(
    'Persus giriş ekranında kullanıcı adı, şifre ve giriş butonu gösterilir',
    (tester) async {
      final authService = FakeAuthService();

      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(
            authService: authService,
          ),
        ),
      );

      expect(find.text('PERSUS'), findsOneWidget);
      expect(find.text('Kullanıcı'), findsOneWidget);
      expect(find.text('Şifre'), findsOneWidget);
      expect(find.text('Giriş Yap'), findsOneWidget);

      expect(
        find.text('Ben robot değilim'),
        findsNothing,
      );
    },
  );

  testWidgets(
    'Kullanıcı adı ve şifre girildiğinde login servisi çağrılır',
    (tester) async {
      final authService = FakeAuthService();

      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(
            authService: authService,
          ),
        ),
      );

      final textFields = find.byType(TextField);

      expect(textFields, findsNWidgets(2));

      await tester.enterText(
        textFields.at(0),
        'testuser',
      );

      await tester.enterText(
        textFields.at(1),
        'testpassword',
      );

      await tester.tap(
        find.text('Giriş Yap'),
      );

      await tester.pumpAndSettle();

      expect(authService.loginCalled, isTrue);
      expect(
        authService.receivedUsername,
        'testuser',
      );
      expect(
        authService.receivedPassword,
        'testpassword',
      );
    },
  );

  testWidgets(
    'Kullanıcı adı boş bırakılırsa giriş yapılmaz',
    (tester) async {
      final authService = FakeAuthService();

      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(
            authService: authService,
          ),
        ),
      );

      await tester.enterText(
        find.byType(TextField).at(1),
        'testpassword',
      );

      await tester.tap(
        find.text('Giriş Yap'),
      );

      await tester.pump();

      expect(
        authService.loginCalled,
        isFalse,
      );

      expect(
        find.text('Kullanıcı adı boş bırakılamaz.'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'Şifre boş bırakılırsa giriş yapılmaz',
    (tester) async {
      final authService = FakeAuthService();

      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(
            authService: authService,
          ),
        ),
      );

      await tester.enterText(
        find.byType(TextField).at(0),
        'testuser',
      );

      await tester.tap(
        find.text('Giriş Yap'),
      );

      await tester.pump();

      expect(
        authService.loginCalled,
        isFalse,
      );

      expect(
        find.text('Şifre boş bırakılamaz.'),
        findsOneWidget,
      );
    },
  );
}