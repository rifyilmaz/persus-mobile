import 'package:flutter/material.dart';

import 'features/auth/data/services/auth_service.dart';
import 'features/auth/data/services/real_auth_service.dart';
import 'features/auth/presentation/login_page.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const PersusApp());
}

class PersusApp extends StatelessWidget {
  const PersusApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = RealAuthService(
      baseUrl: 'https://www.persusapp.com.tr/persus-web/api',
    );

    return MaterialApp(
      title: 'Persus Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: LoginPage(
        authService: authService,
      ),
    );
  }
}