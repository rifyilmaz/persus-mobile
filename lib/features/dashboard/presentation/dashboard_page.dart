import 'package:flutter/material.dart';

import '../../auth/data/services/auth_service.dart';
import '../../auth/data/services/auth_session.dart';
import '../../auth/presentation/login_page.dart';

import '../../change_password/presentation/change_password_page.dart';
import '../../profile/presentation/profile_page.dart';

import '../../security/data/models/security_menu.dart';
import '../../security/data/services/security_service.dart';

import '../../shell/presentation/main_shell.dart';
import '../../shell/presentation/widgets/persus_drawer.dart';

import 'dashboard_detail_page.dart';

class DashboardPage extends StatefulWidget {
  final SecurityService securityService;

  final AuthService authService;

  final AuthSession authSession;

  const DashboardPage({
    super.key,
    required this.securityService,
    required this.authService,
    required this.authSession,
  });

  @override
  State<DashboardPage> createState() =>
      _DashboardPageState();
}

class _DashboardPageState
    extends State<DashboardPage> {
  List<SecurityMenu> _menus = [];

  bool _isLoadingMenus = true;

  String? _menuError;

  @override
  void initState() {
    super.initState();

    _loadMenus();
  }

  Future<void> _loadMenus() async {
    if (mounted) {
      setState(() {
        _isLoadingMenus = true;
        _menuError = null;
      });
    }

    try {
      final menus =
          await widget.securityService.getMenus();

      if (!mounted) {
        return;
      }

      setState(() {
        _menus = menus;
        _isLoadingMenus = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _isLoadingMenus = false;
        _menuError = error
            .toString()
            .replaceFirst(
              'Exception: ',
              '',
            );
      });
    }
  }

  void _logout(
    BuildContext context,
  ) {
    widget.authSession.clear();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => LoginPage(
          authService: widget.authService,
          securityService:
              widget.securityService,
          authSession:
              widget.authSession,
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

  void _openDetail(
    BuildContext context,
    DashboardDetailType type,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            DashboardDetailPage(
          type: type,
        ),
      ),
    );
  }

  void _openMainShell(
    BuildContext context,
    int index,
  ) {
    if (index < 0 || index >= 3) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MainShell(
          initialIndex: index,
          securityService:
              widget.securityService,
          authService:
              widget.authService,
          authSession:
              widget.authSession,
          menus: _menus,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final summaryItems = [
      const _DashboardSummaryItem(
        title: 'Gecikmiş Görüşler',
        count: 0,
        icon: Icons.folder_open_outlined,
        type:
            DashboardDetailType.delayedMeetings,
      ),
      const _DashboardSummaryItem(
        title: 'Bekleyen Görüşler',
        count: 0,
        icon: Icons.description_outlined,
        type:
            DashboardDetailType.pendingMeetings,
      ),
      const _DashboardSummaryItem(
        title: 'Duruşma Bilgileri',
        count: 0,
        icon: Icons.event_note_outlined,
        type:
            DashboardDetailType.hearingInfo,
      ),
      const _DashboardSummaryItem(
        title: 'Dosya İstatistik',
        count: 0,
        icon: Icons.analytics_outlined,
        type:
            DashboardDetailType.fileStatistics,
      ),
    ];

    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _DashboardHeader(),
          const SizedBox(height: 20),
          const Text(
            'Ana Sayfa',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            itemCount: summaryItems.length,
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.35,
            ),
            itemBuilder: (context, index) {
              final item =
                  summaryItems[index];

              return _SummaryCard(
                item: item,
                onTap: () => _openDetail(
                  context,
                  item.type,
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          const _AnnouncementsCard(),
          const SizedBox(height: 16),
          const _AgendaCard(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildDrawer(
    BuildContext context,
  ) {
    if (_isLoadingMenus) {
      return const Drawer(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_menuError != null) {
      return Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 48,
                ),
                const SizedBox(height: 16),
                const Text(
                  'Menüler yüklenemedi.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _menuError!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: _loadMenus,
                  icon: const Icon(
                    Icons.refresh,
                  ),
                  label: const Text(
                    'Tekrar Dene',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return PersusDrawer(
      selectedIndex: null,
      menus: _menus,
      onDashboardSelected: () {
        Navigator.of(context).pop();
      },
      onSelected: (index) {
        _openMainShell(
          context,
          index,
        );
      },
      onLogout: () => _logout(context),
    );
  }
}

class _DashboardHeader
    extends StatelessWidget {
  const _DashboardHeader();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context)
          .colorScheme
          .primaryContainer,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              child: Icon(
                Icons.home_work_outlined,
                size: 30,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'PERSUS',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Hukuk dava dosya takip mobil uygulaması',
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Demo Edition',
                    style: TextStyle(
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardSummaryItem {
  final String title;
  final int count;
  final IconData icon;
  final DashboardDetailType type;

  const _DashboardSummaryItem({
    required this.title,
    required this.count,
    required this.icon,
    required this.type,
  });
}

class _SummaryCard
    extends StatelessWidget {
  final _DashboardSummaryItem item;
  final VoidCallback onTap;

  const _SummaryCard({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style:
                        const TextStyle(
                      fontWeight:
                          FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor:
                        colorScheme
                            .primaryContainer,
                    child: Icon(item.icon),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor:
                      colorScheme.secondary,
                  child: Text(
                    item.count.toString(),
                    style:
                        const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnnouncementsCard
    extends StatelessWidget {
  const _AnnouncementsCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 150,
        decoration:
            const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F2742),
              Color(0xFF1E6091),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.campaign_outlined,
                  color: Colors.white,
                  size: 34,
                ),
                SizedBox(height: 12),
                Text(
                  'Duyurular',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Duyuruları buradan takip edebilirsiniz.',
                  textAlign:
                      TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AgendaCard
    extends StatelessWidget {
  const _AgendaCard();

  @override
  Widget build(BuildContext context) {
    final days = List.generate(
      31,
      (index) => index + 1,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                ),
                SizedBox(width: 8),
                Text(
                  'Ajanda',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text('Temmuz 2026'),
              ],
            ),
            const SizedBox(height: 14),
            GridView.builder(
              itemCount: days.length,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
              ),
              itemBuilder: (context, index) {
                final day = days[index];
                final isSelected =
                    day == 28;

                return Container(
                  alignment:
                      Alignment.center,
                  decoration:
                      BoxDecoration(
                    color: isSelected
                        ? Colors.red
                        : Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : null,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}