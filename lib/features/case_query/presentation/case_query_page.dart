import 'package:flutter/material.dart';

part 'case_query_parts/case_query_options.dart';
part 'case_query_parts/case_query_widgets.dart';
part 'case_query_parts/case_query_forms.dart';
part 'case_query_parts/case_query_result_table.dart';

class CaseQueryPage extends StatefulWidget {
  const CaseQueryPage({super.key});

  @override
  State<CaseQueryPage> createState() => _CaseQueryPageState();
}

class _CaseQueryPageState extends State<CaseQueryPage> {
  final Map<String, String> _textValues = {};
  final Map<String, String> _dateValues = {};
  final Map<String, String> _dropdownValues = {};

  int _selectedTabIndex = 0;
  int _resetVersion = 0;
  bool _hasSearched = false;

  void _changeTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  void _clearForm() {
    setState(() {
      _textValues.clear();
      _dateValues.clear();
      _dropdownValues.clear();
      _hasSearched = false;
      _resetVersion++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sorgu alanları temizlendi.'),
      ),
    );
  }

  void _search() {
    setState(() {
      _hasSearched = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Dava sorgu işlemi mock olarak çalıştırıldı.'),
      ),
    );
  }

  void _newSearch() {
    setState(() {
      _textValues.clear();
      _dateValues.clear();
      _dropdownValues.clear();
      _hasSearched = false;
      _resetVersion++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Yeni sorgu için alanlar hazırlandı.'),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    return '$day.$month.$year';
  }

  Widget _textField(
    String label, {
    String? displayLabel,
    int maxLines = 1,
    TextInputType? keyboardType,
    bool readOnly = false,
  }) {
    final value = _textValues[label];

    return TextFormField(
      key: ValueKey('text-$_resetVersion-$label-${value ?? ''}'),
      initialValue: value,
      maxLines: maxLines,
      readOnly: readOnly,
      keyboardType: keyboardType,
      onChanged: (text) {
        _textValues[label] = text.trim();
      },
      decoration: InputDecoration(
        labelText: displayLabel ?? label,
      ),
    );
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
    List<String> options, {
    String? displayLabel,
  }) {
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
        labelText: displayLabel ?? label,
      ),
    );
  }

  Widget _lookupField(
    String label, {
    String? displayLabel,
    String dialogTitle = 'Kod Tanımları',
    List<String> options = const [],
  }) {
    final value = _textValues[label];

    return TextFormField(
      key: ValueKey('lookup-$_resetVersion-$label-${value ?? ''}'),
      initialValue: value,
      onChanged: (text) {
        _textValues[label] = text.trim();
      },
      decoration: InputDecoration(
        labelText: displayLabel ?? label,
        suffixIcon: IconButton(
          tooltip: 'Ara',
          icon: const Icon(Icons.search_outlined),
          onPressed: () async {
            final selectedValue = await _openLookupBottomSheet(
              title: dialogTitle,
              options: options,
            );

            if (selectedValue == null) {
              return;
            }

            setState(() {
              if (selectedValue.isEmpty) {
                _textValues.remove(label);
              } else {
                _textValues[label] = selectedValue;
              }
            });
          },
        ),
      ),
    );
  }

  Future<String?> _openLookupBottomSheet({
    required String title,
    required List<String> options,
  }) {
    final searchController = TextEditingController();
    var filteredOptions = List<String>.from(options);

    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
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
                      const SizedBox(height: 12),
                      TextField(
                        controller: searchController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: 'En az 3 karakter giriniz',
                          prefixIcon: Icon(Icons.search_outlined),
                        ),
                        onChanged: (query) {
                          setModalState(() {
                            filteredOptions = options
                                .where(
                                  (item) => item.toLowerCase().contains(
                                        query.toLowerCase(),
                                      ),
                                )
                                .toList();
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: filteredOptions.isEmpty
                            ? const Center(
                                child: Text('Kayıt yok.'),
                              )
                            : ListView.separated(
                                itemCount: filteredOptions.length,
                                separatorBuilder: (context, index) =>
                                    const Divider(height: 1),
                                itemBuilder: (context, index) {
                                  final item = filteredOptions[index];

                                  return ListTile(
                                    title: Text(item),
                                    trailing: const Icon(
                                      Icons.chevron_right_outlined,
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop(item);
                                    },
                                  );
                                },
                              ),
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pop('');
                        },
                        icon: const Icon(Icons.clear_outlined),
                        label: const Text('Seçimi boş bırak'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _tabSelector() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ChoiceChip(
              label: const Text('Sorgu Parametresi'),
              selected: _selectedTabIndex == 0,
              onSelected: (_) => _changeTab(0),
            ),
            ChoiceChip(
              label: const Text('Ek Parametre'),
              selected: _selectedTabIndex == 1,
              onSelected: (_) => _changeTab(1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _newSearch,
            icon: const Icon(Icons.add_circle_outline),
            label: const Text('Yeni'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FilledButton.icon(
            onPressed: _search,
            icon: const Icon(Icons.search_outlined),
            label: const Text('Ara'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _clearForm,
            icon: const Icon(Icons.cleaning_services_outlined),
            label: const Text('Temizle'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const _HeaderCard(
          title: 'Dava Sorgu',
          subtitle:
              'Dava dosyalarını sorgu parametresi ve ek parametre alanlarıyla arama ekranı.',
        ),
        const SizedBox(height: 16),
        _tabSelector(),
        const SizedBox(height: 16),
        if (_selectedTabIndex == 0) _queryParameterForm(),
        if (_selectedTabIndex == 1) _extraParameterForm(),
        const SizedBox(height: 16),
        _actionButtons(),
        const SizedBox(height: 16),
        _resultTable(),
      ],
    );
  }
}