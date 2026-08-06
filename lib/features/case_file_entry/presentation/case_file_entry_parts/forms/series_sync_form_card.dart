part of '../../case_file_entry_page.dart';

class _SeriesSyncFormCard extends StatefulWidget {
  const _SeriesSyncFormCard();

  @override
  State<_SeriesSyncFormCard> createState() =>
      _SeriesSyncFormCardState();
}

class _SeriesSyncFormCardState
    extends State<_SeriesSyncFormCard> {
  static const List<String> _decisionOptions = [
    'Bidayet Karar Tarihi Bilgisi Eşitle',
    'Kesinleşme / Tarih Bilgisi Eşitle',
    'Bidayet Karar Tebliğ Tarihi Bilgisi Eşitle',
    'Dava Aşama Bilgisi Eşitle',
    'Karar Kesinleşme Aşaması Bilgisi Eşitle',
    'Bidayet Netice Bilgisi Eşitle',
  ];

  static const List<String> _partyOptions = [
    'Karşı Taraf Avukat Bilgisi Eşitle',
    'Alacak Dönem Bilgisini Eşitle',
    'Talep Takip Bilgilerini Eşitle',
    'Geldiği Yer Bilgisini Eşitle',
    'Talep Maddi Tazminat Bilgisi Eşitle',
    'Hüküm Maddi Tazminat Bilgisi Eşitle',
  ];

  static const List<String> _appealOptions = [
    'İstinaf Merci Bilgisi Eşitle',
    'İstinaf Karar Tarihi Bilgisi Eşitle',
    'Temyiz Merci Bilgisi Eşitle',
    'Temyiz Merci Tarihi Bilgisi Eşitle',
    'Bakanlık İstinaf Netice Bilgisi Eşitle',
    'Bakanlık Temyiz Netice Bilgisi Eşitle',
  ];

  final Set<String> _selectedValues = <String>{};

  List<String> get _allOptions => [
        ..._decisionOptions,
        ..._partyOptions,
        ..._appealOptions,
      ];

  void _changeSelection(
    String value,
    bool selected,
  ) {
    setState(() {
      if (selected) {
        _selectedValues.add(value);
      } else {
        _selectedValues.remove(value);
      }
    });
  }

  void _selectAll() {
    setState(() {
      _selectedValues
        ..clear()
        ..addAll(_allOptions);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tüm bilgiler seçildi.'),
      ),
    );
  }

  void _clearSelection() {
    if (_selectedValues.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kaldırılacak bir seçim bulunmuyor.'),
        ),
      );
      return;
    }

    setState(() {
      _selectedValues.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bütün seçimler kaldırıldı.'),
      ),
    );
  }

  void _synchronizeSelectedValues() {
    if (_selectedValues.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Eşitleme işlemi için en az bir bilgi seçmelisiniz.',
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${_selectedValues.length} bilgi, serinin tüm '
          'dosyalarıyla mock olarak eşitlendi.',
        ),
      ),
    );
  }

  Widget _buildControlledCheckList(
    List<String> values,
  ) {
    return Column(
      children: [
        for (final value in values)
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity:
                ListTileControlAffinity.leading,
            value: _selectedValues.contains(value),
            title: Text(value),
            onChanged: (checked) {
              _changeSelection(
                value,
                checked ?? false,
              );
            },
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = _selectedValues.length;
    final allSelected =
        selectedCount == _allOptions.length;

    return Column(
      children: [
        _FormCard(
          title: 'Seri Dosyalarıyla Bilgi Eşitleme',
          subtitle:
              'Seri dosyalar arasında aktarılacak bilgilerin '
              'seçileceği mock ekran.',
          children: const [
            Text(
              'Bilgiler konu başlıklarına ayrılmıştır. '
              'İhtiyaç duyduğunuz grubu açarak eşitlenecek '
              'alanları seçebilirsiniz.',
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Karar ve Kesinleşme Bilgileri',
          subtitle:
              'Karar tarihi, kesinleşme ve bidayet netice alanları',
          icon: Icons.fact_check_outlined,
          children: [
            _buildControlledCheckList(
              _decisionOptions,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Taraf, Dönem ve Talep Bilgileri',
          subtitle:
              'Karşı taraf, dönem, takip ve tazminat alanları',
          icon: Icons.groups_outlined,
          children: [
            _buildControlledCheckList(
              _partyOptions,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'İstinaf ve Temyiz Bilgileri',
          subtitle:
              'İstinaf, temyiz ve bakanlık netice alanları',
          icon: Icons.account_balance_outlined,
          children: [
            _buildControlledCheckList(
              _appealOptions,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Toplu İşlem',
          subtitle: selectedCount == 0
              ? 'Henüz bilgi seçilmedi'
              : '$selectedCount bilgi seçildi',
          icon: Icons.done_all_outlined,
          children: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed:
                        allSelected ? null : _selectAll,
                    icon: const Icon(
                      Icons.select_all_outlined,
                    ),
                    label: const Text(
                      'Tümünü Seç',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: selectedCount == 0
                        ? null
                        : _clearSelection,
                    icon: const Icon(
                      Icons.deselect_outlined,
                    ),
                    label: const Text(
                      'Seçimi Kaldır',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: selectedCount == 0
                    ? null
                    : _synchronizeSelectedValues,
                icon: const Icon(
                  Icons.done_all_outlined,
                ),
                label: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Text(
                    'Seçili Bilgileri Serinin Tüm '
                    'Dosyalarına Eşitle',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}