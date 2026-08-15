import 'package:flutter/material.dart';

import 'core/network/api_client.dart';
import 'core/theme/app_theme.dart';

import 'features/auth/data/services/auth_service.dart';
import 'features/auth/data/services/auth_session.dart';
import 'features/auth/data/services/real_auth_service.dart';
import 'features/auth/presentation/login_page.dart';

import 'features/dashboard/data/services/dashboard_service.dart';
import 'features/dashboard/data/services/real_dashboard_service.dart';

import 'features/security/data/services/real_security_service.dart';
import 'features/security/data/services/security_service.dart';

import 'features/case_query/data/services/case_service.dart';
import 'features/case_query/data/services/real_case_service.dart';

void main() {
  runApp(
    const PersusApp(),
  );
}

class PersusApp extends StatelessWidget {
  const PersusApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const String baseUrl =
        'https://www.persusapp.com.tr/persus-web/api';

    final AuthSession authSession = AuthSession();

    final ApiClient apiClient = ApiClient(
      baseUrl: baseUrl,
      session: authSession,
    );

    final AuthService authService = RealAuthService(
      baseUrl: baseUrl,
      session: authSession,
    );

    final SecurityService securityService = RealSecurityService(
      apiClient: apiClient,
    );

    final DashboardService dashboardService = RealDashboardService(
      apiClient: apiClient,
    );


    final CaseService caseService = RealCaseService(
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
        dashboardService: dashboardService,
        caseService: caseService, 
      ),
    );
  }
}