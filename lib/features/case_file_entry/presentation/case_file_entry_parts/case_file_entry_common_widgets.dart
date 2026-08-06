part of '../case_file_entry_page.dart';

class _FormCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;

  const _FormCard({
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(subtitle),
            const SizedBox(height: 18),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _ExpandableFormCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Widget> children;

  const _ExpandableFormCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        maintainState: true,
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(subtitle),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: children,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _CheckList extends StatefulWidget {
  final List<String> values;

  const _CheckList({
    required this.values,
  });

  @override
  State<_CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<_CheckList> {
  late final Set<String> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = <String>{};
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final value in widget.values)
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: _selectedValues.contains(value),
            title: Text(value),
            onChanged: (checked) {
              setState(() {
                if (checked ?? false) {
                  _selectedValues.add(value);
                } else {
                  _selectedValues.remove(value);
                }
              });
            },
          ),
      ],
    );
  }
}


class _SingleCheckboxTile extends StatefulWidget {
  final String title;

  const _SingleCheckboxTile({
    required this.title,
  });

  @override
  State<_SingleCheckboxTile> createState() => _SingleCheckboxTileState();
}
class _SingleCheckboxTileState extends State<_SingleCheckboxTile> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      value: _checked,
      title: Text(widget.title),
      onChanged: (value) {
        setState(() {
          _checked = value ?? false;
        });
      },
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final VoidCallback onClear;
  final VoidCallback onSearch;
  final VoidCallback onSave;

  const _ActionButtons({
    required this.onClear,
    required this.onSearch,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onClear,
            icon: const Icon(Icons.cleaning_services_outlined),
            label: const Text('Temizle'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onSearch,
            icon: const Icon(Icons.search_outlined),
            label: const Text('Ara'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FilledButton.icon(
            onPressed: onSave,
            icon: const Icon(Icons.save_outlined),
            label: const Text('Kaydet'),
          ),
        ),
      ],
    );
  }
}

class _ResultTableCard extends StatelessWidget {
  final List<String> columns;
  final List<Map<String, String>> records;

  const _ResultTableCard({
    required this.columns,
    required this.records,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kayıt Listesi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  for (final column in columns)
                    DataColumn(
                      label: Text(
                        column,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
                rows: [
                  for (final record in records)
                    DataRow(
                      cells: [
                        for (final column in columns)
                          DataCell(
                            Text(record[column] ?? ''),
                          ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            if (records.isEmpty)
              Text(
                'Kayıt yok.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              )
            else
              Text(
                '${records.length} kayıt listeleniyor.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            const SizedBox(height: 12),
            const Divider(),
            Text(
              'Toplam kayıt: ${records.length}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}