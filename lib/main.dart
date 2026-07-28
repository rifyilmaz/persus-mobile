import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/data/services/mock_auth_service.dart';
import 'features/auth/presentation/login_page.dart';

void main() {
  runApp(const PersusApp());
}

class PersusApp extends StatelessWidget {
  const PersusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persus Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginPage(
        authService: MockAuthService(),
      ),
    );
  }
}