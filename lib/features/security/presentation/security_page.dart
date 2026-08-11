import 'package:flutter/material.dart';

import '../data/models/security_item.dart';
import '../data/models/security_menu.dart';
import '../data/services/security_service.dart';

class SecurityPage extends StatefulWidget {
  final SecurityService securityService;

  const SecurityPage({
    super.key,
    required this.securityService,
  });

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool _isLoading = true;

  String? _errorMessage;

  List<SecurityItem> _servers = [];
  List<SecurityItem> _roles = [];
  List<SecurityItem> _organizations = [];
  List<SecurityMenu> _menus = [];

  @override
  void initState() {
    super.initState();
    _loadSecurityData();
  }

  Future<void> _loadSecurityData() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
    }

    try {
      final serversFuture = widget.securityService.getServers();
      final rolesFuture = widget.securityService.getRoles();
      final organizationsFuture =
          widget.securityService.getOrganizations();
      final menusFuture = widget.securityService.getMenus();

      final results = await Future.wait<dynamic>([
        serversFuture,
        rolesFuture,
        organizationsFuture,
        menusFuture,
      ]);

      if (!mounted) {
        return;
      }

      setState(() {
        _servers = results[0] as List<SecurityItem>;
        _roles = results[1] as List<SecurityItem>;
        _organizations = results[2] as List<SecurityItem>;
        _menus = results[3] as List<SecurityMenu>;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _errorMessage = error
            .toString()
            .replaceFirst('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
        actions: [
          IconButton(
            tooltip: 'Yenile',
            onPressed: _isLoading ? null : _loadSecurityData,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 48,
              ),
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _loadSecurityData,
                icon: const Icon(Icons.refresh),
                label: const Text('Tekrar Dene'),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadSecurityData,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection(
            title: 'Sunucular',
            icon: Icons.dns_outlined,
            children: _servers
                .map(
                  (item) => ListTile(
                    leading: const Icon(
                      Icons.cloud_outlined,
                    ),
                    title: Text(item.label),
                    subtitle: Text(
                      item.value?.toString() ?? '',
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 16),

          _buildSection(
            title: 'Roller',
            icon: Icons.admin_panel_settings_outlined,
            children: _roles
                .map(
                  (item) => ListTile(
                    leading: const Icon(
                      Icons.security_outlined,
                    ),
                    title: Text(item.label),
                    subtitle: Text(
                      'ID: ${item.value}',
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 16),

          _buildSection(
            title: 'Kurumlar',
            icon: Icons.business_outlined,
            children: _organizations
                .map(
                  (item) => ListTile(
                    leading: const Icon(
                      Icons.account_balance_outlined,
                    ),
                    title: Text(item.label),
                    subtitle: Text(
                      'ID: ${item.value}',
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 16),

          _buildMenusSection(),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        children: children.isEmpty
            ? [
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Kayıt bulunamadı.'),
                ),
              ]
            : children,
      ),
    );
  }

  Widget _buildMenusSection() {
    return Card(
      child: ExpansionTile(
        initiallyExpanded: true,
        leading: const Icon(
          Icons.menu_open,
        ),
        title: const Text(
          'Menüler',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        children: _menus.isEmpty
            ? [
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Menü bulunamadı.'),
                ),
              ]
            : _menus
                .map(
                  _buildMenuItem,
                )
                .toList(),
      ),
    );
  }

  Widget _buildMenuItem(
    SecurityMenu menu,
  ) {
    if (menu.hasChildren) {
      return ExpansionTile(
        leading: const Icon(
          Icons.folder_outlined,
        ),
        title: Text(
          menu.baslik.isNotEmpty
              ? menu.baslik
              : menu.adi,
        ),
        subtitle: menu.aciklama.isNotEmpty
            ? Text(menu.aciklama)
            : null,
        children: menu.childs
            .map(
              _buildMenuItem,
            )
            .toList(),
      );
    }

    return ListTile(
      leading: const Icon(
        Icons.chevron_right,
      ),
      title: Text(
        menu.baslik.isNotEmpty
            ? menu.baslik
            : menu.adi,
      ),
      subtitle: menu.url != null && menu.url!.isNotEmpty
          ? Text(menu.url!)
          : null,
    );
  }
}