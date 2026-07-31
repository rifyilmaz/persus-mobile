import 'package:flutter/material.dart';

import '../../case_file_entry/presentation/case_file_entry_page.dart';
import '../../case_query/presentation/case_query_page.dart';
import '../../hearing_list/presentation/hearing_list_page.dart';
import '../../auth/data/services/mock_auth_service.dart';
import '../../auth/presentation/login_page.dart';
import 'widgets/persus_drawer.dart';
import '../../change_password/presentation/change_password_page.dart';
import '../../profile/presentation/profile_page.dart';

class MainShell extends StatefulWidget {
  final int initialIndex;

  const MainShell({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainShell> createState() => _MainShellState();
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

  void _logout(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const LoginPage(
          authService: MockAuthService(),
        ),
      ),
      (route) => false,
    );
  }

  void _openProfile(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ProfilePage(),
      ),
    );
  }

  void _openChangePassword(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ChangePasswordPage(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: PersusDrawer(
        selectedIndex: _selectedIndex,
        onDashboardSelected: () {
          Navigator.of(context).pop();
        },
        onSelected: (index) {
          Navigator.of(context).pop();

          setState(() {
            _selectedIndex = index;
          });
        },
        onLogout: () => _logout(context),
      ),
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        centerTitle: false,
        actions: [
          PopupMenuButton<String>(
            tooltip: 'Hesap',
            icon: const Icon(Icons.account_circle_outlined),
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
                    Icon(Icons.person_outline),
                    SizedBox(width: 12),
                    Text('Profil'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'password',
                child: Row(
                  children: [
                    Icon(Icons.sync_lock_outlined),
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