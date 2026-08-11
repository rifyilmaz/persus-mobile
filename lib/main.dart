import 'package:flutter/material.dart';

import 'core/network/api_client.dart';
import 'core/theme/app_theme.dart';

import 'features/auth/data/services/auth_service.dart';
import 'features/auth/data/services/auth_session.dart';
import 'features/auth/data/services/real_auth_service.dart';
import 'features/auth/presentation/login_page.dart';

import 'features/security/data/services/real_security_service.dart';
import 'features/security/data/services/security_service.dart';

void main() {
  runApp(
    const PersusApp(),
  );
}

class PersusApp
    extends StatelessWidget {
  const PersusApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthSession authSession =
        AuthSession();

    const String baseUrl =
        'https://www.persusapp.com.tr/persus-web/api';

    final AuthService authService =
        RealAuthService(
      baseUrl: baseUrl,
      session: authSession,
    );

    final ApiClient apiClient =
        ApiClient(
      baseUrl: baseUrl,
      session: authSession,
    );

    final SecurityService
        securityService =
        RealSecurityService(
      apiClient: apiClient,
    );

    return MaterialApp(
      title: 'Persus Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: LoginPage(
        authService: authService,
        securityService: securityService,
        authSession: authSession,
      ),
    );
  }
}