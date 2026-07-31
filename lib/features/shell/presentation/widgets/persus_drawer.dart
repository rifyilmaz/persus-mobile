import 'package:flutter/material.dart';

class PersusDrawer extends StatelessWidget {
  final int? selectedIndex;
  final VoidCallback onDashboardSelected;
  final ValueChanged<int> onSelected;
  final VoidCallback onLogout;

  const PersusDrawer({
    super.key,
    required this.selectedIndex,
    required this.onDashboardSelected,
    required this.onSelected,
    required this.onLogout,
  });

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
                        Theme.of(context).colorScheme.primaryContainer,
                    child: const Icon(Icons.home_work_outlined),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PERSUS',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('Demo Edition'),
                        SizedBox(height: 4),
                        Text(
                          'Hukuk dava dosya takip',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              selected: selectedIndex == null,
              leading: const Icon(Icons.dashboard_outlined),
              title: const Text('Ana Sayfa'),
              trailing: selectedIndex == null ? const Icon(Icons.check) : null,
              onTap: () {
                Navigator.of(context).pop();
                onDashboardSelected();
              },
            ),

            const Divider(),

            _DrawerMenuItem(
              index: 0,
              selectedIndex: selectedIndex,
              icon: Icons.note_add_outlined,
              selectedIcon: Icons.note_add,
              title: 'Dava Dosya Giriş',
              onSelected: onSelected,
            ),
            _DrawerMenuItem(
              index: 1,
              selectedIndex: selectedIndex,
              icon: Icons.gavel_outlined,
              selectedIcon: Icons.gavel,
              title: 'Duruşma Listesi',
              onSelected: onSelected,
            ),
            _DrawerMenuItem(
              index: 2,
              selectedIndex: selectedIndex,
              icon: Icons.search_outlined,
              selectedIcon: Icons.search,
              title: 'Dava Sorgu',
              onSelected: onSelected,
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerMenuItem extends StatelessWidget {
  final int index;
  final int? selectedIndex;
  final IconData icon;
  final IconData selectedIcon;
  final String title;
  final ValueChanged<int> onSelected;

  const _DrawerMenuItem({
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.selectedIcon,
    required this.title,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;

    return ListTile(
      selected: isSelected,
      leading: Icon(isSelected ? selectedIcon : icon),
      title: Text(title),
      trailing: isSelected ? const Icon(Icons.check) : null,
      onTap: () {
        onSelected(index);
      },
    );
  }
}