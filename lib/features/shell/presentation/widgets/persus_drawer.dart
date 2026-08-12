import 'package:flutter/material.dart';

import '../../../security/data/models/security_menu.dart';

class PersusDrawer extends StatelessWidget {
  final int? selectedIndex;

  final VoidCallback onDashboardSelected;

  final ValueChanged<int> onSelected;

  final VoidCallback onLogout;

  final List<SecurityMenu> menus;

  const PersusDrawer({
    super.key,
    required this.selectedIndex,
    required this.onDashboardSelected,
    required this.onSelected,
    required this.onLogout,
    this.menus = const [],
  });

  int? _getMappedIndex(String menuAdi) {
    switch (menuAdi) {
      case 'menu.adt.davadosyayeni':
        return 0;

      case 'menu.adt.durusmalistesi':
        return 1;

      case 'menu.adt.dosya':
        return 2;

      default:
        return null;
    }
  }

  IconData _getIconForIndex(
    int? index,
    bool isSelected,
  ) {
    switch (index) {
      case 0:
        return isSelected
            ? Icons.note_add
            : Icons.note_add_outlined;

      case 1:
        return isSelected
            ? Icons.gavel
            : Icons.gavel_outlined;

      case 2:
        return isSelected
            ? Icons.search
            : Icons.search_outlined;

      default:
        return isSelected
            ? Icons.circle
            : Icons.circle_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor:
                        Theme.of(context)
                            .colorScheme
                            .primaryContainer,
                    child: const Icon(
                      Icons.home_work_outlined,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PERSUS',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('Demo Edition'),
                        SizedBox(height: 4),
                        Text(
                          'Hukuk dava dosya takip',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              selected: selectedIndex == null,
              leading: const Icon(
                Icons.dashboard_outlined,
              ),
              title: const Text('Ana Sayfa'),
              trailing: selectedIndex == null
                  ? const Icon(Icons.check)
                  : null,
              onTap: onDashboardSelected,
            ),

            const Divider(),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: menus
                    .map(
                      (menu) => _buildMenuTree(
                        context,
                        menu,
                        0,
                      ),
                    )
                    .toList(),
              ),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text('Çıkış'),
              onTap: onLogout,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuTree(
    BuildContext context,
    SecurityMenu menu,
    int level,
  ) {
    if (menu.hasChildren) {
      return ExpansionTile(
        leading: Icon(
          level == 0
              ? Icons.folder_outlined
              : Icons.subdirectory_arrow_right,
        ),
        title: Text(
          menu.displayTitle,
          style: TextStyle(
            fontWeight: level == 0
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        subtitle:
            menu.aciklama.trim().isNotEmpty
                ? Text(menu.aciklama)
                : null,
        childrenPadding:
            const EdgeInsets.only(
          left: 16,
        ),
        children: menu.childs
            .map(
              (child) => _buildMenuTree(
                context,
                child,
                level + 1,
              ),
            )
            .toList(),
      );
    }

    final mappedIndex =
        _getMappedIndex(menu.adi);

    final isSelected =
        mappedIndex != null &&
        selectedIndex == mappedIndex;

    return ListTile(
      selected: isSelected,
      leading: Icon(
        _getIconForIndex(
          mappedIndex,
          isSelected,
        ),
      ),
      title: Text(menu.displayTitle),
      subtitle:
          menu.url != null &&
                  menu.url!.isNotEmpty
              ? Text(menu.url!)
              : null,
      trailing: isSelected
          ? const Icon(Icons.check)
          : null,
      onTap: () {
        if (mappedIndex != null) {
          onSelected(mappedIndex);
          return;
        }

        ScaffoldMessenger.of(context)
            .showSnackBar(
          SnackBar(
            content: Text(
              '${menu.displayTitle} ekranı henüz aktif değil.',
            ),
            duration:
                const Duration(seconds: 2),
          ),
        );
      },
    );
  }
}