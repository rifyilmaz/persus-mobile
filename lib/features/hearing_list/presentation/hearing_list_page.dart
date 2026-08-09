import 'package:flutter/material.dart';

class HearingListPage extends StatefulWidget {
  const HearingListPage({super.key});

  @override
  State<HearingListPage> createState() => _HearingListPageState();
}

class _HearingListPageState extends State<HearingListPage> {
  final Map<String, String> _dateValues = {};
  final Map<String, String> _dropdownValues = {};

  int _resetVersion = 0;
  bool _hasListed = false;

  void _listHearings() {
    setState(() {
      _hasListed = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Duruşma listesi mock olarak getirildi.'),
      ),
    );
  }

  void _clearForm() {
    setState(() {
      _dateValues.clear();
      _dropdownValues.clear();
      _hasListed = false;
      _resetVersion++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Duruşma listeleme alanları temizlendi.'),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    return '$day.$month.$year';
  }

  Widget _dateField(String label) {
    final value = _dateValues[label];

    return TextFormField(
      key: ValueKey('date-$_resetVersion-$label-${value ?? ''}'),
      initialValue: value,
      readOnly: true,
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (pickedDate == null) {
          return;
        }

        setState(() {
          _dateValues[label] = _formatDate(pickedDate);
        });
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: 'gg.aa.yyyy',
        suffixIcon: const Icon(Icons.calendar_month_outlined),
      ),
    );
  }

  Widget _dropdownField(
    String label,
    List<String> options,
  ) {
    final selectedValue = _dropdownValues[label];

    return DropdownButtonFormField<String>(
      key: ValueKey('dropdown-$_resetVersion-$label-$selectedValue'),
      initialValue: selectedValue,
      isExpanded: true,
      hint: const Text('Boş seç'),
      items: [
        const DropdownMenuItem<String>(
          value: '',
          child: Text('Boş seç'),
        ),
        ...options.map(
          (option) => DropdownMenuItem<String>(
            value: option,
            child: Text(
              option,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          if (value == null || value.isEmpty) {
            _dropdownValues.remove(label);
          } else {
            _dropdownValues[label] = value;
          }
        });
      },
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }

  Widget _filterCard() {
    return _FormCard(
      title: 'Duruşma Listeleme',
      subtitle:
          'Avukat ve tarih aralığına göre duruşma kayıtlarını listeleme ekranı.',
      children: [
        _dropdownField(
          'Avukat',
          _lawyerOptions,
        ),
        const SizedBox(height: 12),
        _dateField('Başlangıç'),
        const SizedBox(height: 12),
        _dateField('Bitiş'),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _clearForm,
                icon: const Icon(Icons.cleaning_services_outlined),
                label: const Text('Temizle'),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton.icon(
                onPressed: _listHearings,
                icon: const Icon(Icons.list_alt_outlined),
                label: const Text('Listele'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _resultTable() {
    final records =
        _hasListed ? _mockHearingRecords : const <Map<String, String>>[];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Duruşma Listesi',
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
                  for (final column in _hearingColumns)
                    DataColumn(
                      label: Text(
                        column,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
                rows: [
                  for (final record in records)
                    DataRow(
                      cells: [
                        for (final column in _hearingColumns)
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
                '${records.length} duruşma kaydı listeleniyor.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            const SizedBox(height: 12),
            const Divider(),
            Text(
              'Toplam kayıt: ${records.length}',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const _HeaderCard(
          title: 'Duruşma Listesi',
          subtitle:
              'Duruşmaları avukat ve tarih aralığına göre listeleme ekranı.',
        ),
        const SizedBox(height: 16),
        _filterCard(),
        const SizedBox(height: 16),
        _resultTable(),
      ],
    );
  }
}

class _HeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _HeaderCard({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: colorScheme.surface,
              child: const Icon(Icons.event_note_outlined),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(subtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

const List<String> _hearingColumns = [
  'Avukat',
  'Tarih',
  'Saat',
  'Gün',
  'Yer',
  'Açıklama',
  'Davalı',
  'Davacı',
  'Konu',
  'DosyaEsasNo',
  'Dava Türü',
];

const List<Map<String, String>> _mockHearingRecords = [];

const List<String> _lawyerOptions = [
  'Demo Avukat - 1001',
  'Rıfat Yılmaz - 1002',
  'Beyza Demo - 1003',
];