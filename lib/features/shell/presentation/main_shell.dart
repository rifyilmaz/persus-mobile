import 'package:flutter/material.dart';

import '../../auth/data/services/auth_service.dart';
import '../../auth/data/services/auth_session.dart';

import '../../auth/presentation/login_page.dart';

import '../../case_file_entry/presentation/case_file_entry_page.dart';
import '../../case_query/presentation/case_query_page.dart';
import '../../hearing_list/presentation/hearing_list_page.dart';

import '../../change_password/presentation/change_password_page.dart';
import '../../profile/presentation/profile_page.dart';

import '../../dashboard/data/services/dashboard_service.dart';
import '../../dashboard/presentation/dashboard_page.dart';

import '../../security/data/models/security_menu.dart';
import '../../security/data/services/security_service.dart';

import 'widgets/persus_drawer.dart';

class MainShell extends StatefulWidget {
  final int initialIndex;

  final SecurityService securityService;

  final AuthService authService;

  final AuthSession authSession;

  final DashboardService dashboardService;

  final List<SecurityMenu> menus;

  const MainShell({
    super.key,
    this.initialIndex = 0,
    required this.securityService,
    required this.authService,
    required this.authSession,
    required this.dashboardService,
    required this.menus,
  });

  @override
  State<MainShell> createState() =>
      _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _selectedIndex;

  final List<Widget> _pages = const [
    CaseFileEntryPage(),
    HearingListPage(),
    CaseQueryPage(),
  ];

  final List<String> _titles = const [
    'Dava Dosya Giriş',
    'Duruşma Listesi',
    'Dava Sorgu',
  ];

  @override
  void initState() {
    super.initState();

    _selectedIndex =
        _normalizeIndex(widget.initialIndex);
  }

  int _normalizeIndex(int index) {
    if (index < 0) {
      return 0;
    }

    if (index >= _pages.length) {
      return 0;
    }

    return index;
  }

  void _logout(BuildContext context) {
    widget.authSession.clear();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => LoginPage(
          authService: widget.authService,
          securityService:
              widget.securityService,
          authSession:
              widget.authSession,
          dashboardService:
              widget.dashboardService,
        ),
      ),
      (route) => false,
    );
  }

  void _openProfile(
    BuildContext context,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            const ProfilePage(),
      ),
    );
  }

  void _openChangePassword(
    BuildContext context,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            const ChangePasswordPage(),
      ),
    );
  }

  void _openDashboard(
    BuildContext context,
  ) {
    Navigator.of(context).pop();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => DashboardPage(
            securityService:
                widget.securityService,
            authService:
                widget.authService,
            authSession:
                widget.authSession,
            dashboardService:
                widget.dashboardService,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: PersusDrawer(
        selectedIndex: _selectedIndex,
        menus: widget.menus,

        onDashboardSelected: () {
          _openDashboard(context);
        },

        onSelected: (index) {
          if (index < 0 ||
              index >= _pages.length) {
            return;
          }

          Navigator.of(context).pop();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) {
              return;
            }

            setState(() {
              _selectedIndex = index;
            });
          });
        },

        onLogout: () => _logout(context),
      ),

      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
        ),
        centerTitle: false,
        actions: [
          PopupMenuButton<String>(
            tooltip: 'Hesap',
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
            onSelected: (value) {
              if (value == 'profile') {
                _openProfile(context);
              } else if (value == 'password') {
                _openChangePassword(context);
              } else if (value == 'logout') {
                _logout(context);
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                    ),
                    SizedBox(width: 12),
                    Text('Profil'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'password',
                child: Row(
                  children: [
                    Icon(
                      Icons.sync_lock_outlined,
                    ),
                    SizedBox(width: 12),
                    Text('Şifre Değiştir'),
                  ],
                ),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 12),
                    Text('Çıkış'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      body: _pages[_selectedIndex],
    );
  }
}