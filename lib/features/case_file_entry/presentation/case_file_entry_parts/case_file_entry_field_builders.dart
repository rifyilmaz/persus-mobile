part of '../case_file_entry_page.dart';

extension _CaseFileEntryFieldBuilders on _CaseFileEntryPageState {
  Widget _textField(
    String label, {
    IconData? icon,
    int maxLines = 1,
    bool requiredField = false,
    bool readOnly = false,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      key: ValueKey('text-$_formResetVersion-$label'),
      initialValue: _formValues[label],
      readOnly: readOnly,
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: (value) {
        _formValues[label] = value.trim();
      },
      onSaved: (value) {
        _formValues[label] = value?.trim() ?? '';
      },
      validator: requiredField
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return '$label alanı zorunludur.';
              }
              return null;
            }
          : null,
      decoration: InputDecoration(
        labelText: requiredField ? '$label *' : label,
        prefixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }

  Widget _dateField(
    String label, {
    bool requiredField = false,
  }) {
    final value = _dateValues[label];

    return TextFormField(
      key: ValueKey('date-$_formResetVersion-$label-${value ?? ''}'),
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

        _setDateValue(label, pickedDate);
      },
      validator: requiredField
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return '$label alanı zorunludur.';
              }
              return null;
            }
          : null,
      decoration: InputDecoration(
        labelText: requiredField ? '$label *' : label,
        hintText: 'gg.aa.yyyy',
        suffixIcon: const Icon(Icons.calendar_month_outlined),
      ),
    );
  }

  Widget _dropdownField(
    String label,
    List<String> options, {
    bool requiredField = false,
    IconData? icon,
  }) {
    final selectedValue = _dropdownValues[label];

    final dropdownItems = <DropdownMenuItem<String>>[
      if (!requiredField)
        const DropdownMenuItem<String>(
          value: '',
          child: Text(''),
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
    ];

    return DropdownButtonFormField<String>(
      key: ValueKey('dropdown-$_formResetVersion-$label-$selectedValue'),
      initialValue: selectedValue,
      isExpanded: true,
      items: dropdownItems,
      onChanged: (value) {
        _setDropdownValue(label, value);
      },
      validator: requiredField
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return '$label alanı zorunludur.';
              }
              return null;
            }
          : null,
      decoration: InputDecoration(
        labelText: requiredField ? '$label *' : label,
        prefixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }

  Widget _lookupField(
    String label, {
    IconData? icon,
    bool requiredField = false,
    String dialogTitle = 'Kod Tanımları',
    List<String> options = const [],
  }) {
    final value = _formValues[label];

    return TextFormField(
      key: ValueKey('lookup-$_formResetVersion-$label-${value ?? ''}'),
      initialValue: value,
      readOnly: false,
      onChanged: (text) {
        _formValues[label] = text.trim();
      },
      onSaved: (text) {
        _formValues[label] = text?.trim() ?? '';
      },
      validator: requiredField
          ? (text) {
              if (text == null || text.trim().isEmpty) {
                return '$label alanı zorunludur.';
              }
              return null;
            }
          : null,
      decoration: InputDecoration(
        labelText: requiredField ? '$label *' : label,
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
            _setLookupValue(label, selectedValue);
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
                                separatorBuilder: (context, index) => const Divider(height: 1),
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
}