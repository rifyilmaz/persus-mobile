import 'package:flutter/material.dart';

part 'case_file_entry_parts/case_file_entry_enums.dart';
part 'case_file_entry_parts/case_file_entry_options.dart';
part 'case_file_entry_parts/case_file_entry_selectors.dart';
part 'case_file_entry_parts/case_file_entry_common_widgets.dart';
part 'case_file_entry_parts/forms/appeal_info_form_card.dart';
part 'case_file_entry_parts/forms/payment_info_form_card.dart';
part 'case_file_entry_parts/forms/series_sync_form_card.dart';
part 'case_file_entry_parts/forms/empty_serial_file_form_card.dart';
part 'case_file_entry_parts/forms/arbitration_form_card.dart';
part 'case_file_entry_parts/forms/gorus_form_card.dart';
part 'case_file_entry_parts/forms/temel_bilgiler_form_card.dart';
part 'case_file_entry_parts/case_file_entry_table_columns.dart';
part 'case_file_entry_parts/case_file_entry_field_builders.dart';
part 'case_file_entry_parts/case_file_entry_mock_record.dart';
part 'case_file_entry_parts/case_file_entry_form_router.dart';

class CaseFileEntryPage extends StatefulWidget {
  const CaseFileEntryPage({super.key});

  @override
  State<CaseFileEntryPage> createState() => _CaseFileEntryPageState();
}

class _CaseFileEntryPageState extends State<CaseFileEntryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _formValues = {};
  final Map<String, String> _dateValues = {};
  final Map<String, String> _dropdownValues = {};
  final List<Map<String, String>> _records = [];
  int _formResetVersion = 0;
  CaseMainType _selectedMainType = CaseMainType.dava;
  DavaSubType _selectedDavaSubType = DavaSubType.adli;
  CaseFormSection _selectedSection = CaseFormSection.temel;
  IcraPageSection _selectedIcraPage =IcraPageSection.icraBilgileri;
  BilgiBelgePageSection _selectedBilgiBelgePage =
      BilgiBelgePageSection.bilgiBelgeBilgileri;
  DigerPageSection _selectedDigerPage =
      DigerPageSection.digerBilgileri;
  DavaPageSection _selectedDavaPage =
      DavaPageSection.davaBilgileri;

  List<CaseFormSection> get _availableSections {
    if (_selectedMainType == CaseMainType.icra) {
      return const [
        CaseFormSection.temel,
        CaseFormSection.istinaf,
        CaseFormSection.odeme,
        CaseFormSection.seri,
      ];
    }
    if (_selectedMainType ==
        CaseMainType.bilgiBelge) {
      return const [
        CaseFormSection.temel,
        CaseFormSection.istinaf,
        CaseFormSection.odeme,
        CaseFormSection.seri,
      ];
    }
    if (_selectedMainType == CaseMainType.gorus) {
      return const [
        CaseFormSection.temel,
      ];
    }

    if (_selectedMainType == CaseMainType.diger) {
      return const [
        CaseFormSection.temel,
        CaseFormSection.istinaf,
        CaseFormSection.odeme,
        CaseFormSection.seri,
      ];
    }

    if (_selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType !=
            DavaSubType.arabuluculuk) {
      return const [
        CaseFormSection.temel,
        CaseFormSection.istinaf,
        CaseFormSection.odeme,
        CaseFormSection.seri,
      ];
    }

    if (_selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType == DavaSubType.arabuluculuk) {
      return const [
        CaseFormSection.arabuluculukDava,
        CaseFormSection.iliskiliDosyalar,
        CaseFormSection.toplantiYeri,
        CaseFormSection.bosSeri,
      ];
    }

    return const [
      CaseFormSection.temel,
      CaseFormSection.istinaf,
      CaseFormSection.odeme,
      CaseFormSection.seri,
      CaseFormSection.bosSeri,
    ];
  }

  List<Map<String, String>> get _visibleRecords {
    return _records.where((record) {
      if (record['_mainType'] !=
          _selectedMainType.name) {
        return false;
      }

      if (_selectedMainType == CaseMainType.dava &&
          record['_davaSubType'] !=
              _selectedDavaSubType.name) {
        return false;
      }

      return true;
    }).toList();
  }

  void _changeMainType(CaseMainType type) {
    setState(() {
      _selectedMainType = type;
      _selectedSection = CaseFormSection.temel;
      _selectedDavaPage =
          DavaPageSection.davaBilgileri;
      _selectedIcraPage =
          IcraPageSection.icraBilgileri;
      _selectedBilgiBelgePage =
          BilgiBelgePageSection.bilgiBelgeBilgileri;
      _selectedDigerPage =
          DigerPageSection.digerBilgileri;
      _selectedDavaSubType = DavaSubType.adli;
      _formValues.clear();
      _dateValues.clear();
      _dropdownValues.clear();
      _formResetVersion++;
    });
  }

  void _changeSection(CaseFormSection section) {
    setState(() {
      _selectedSection = section;
    });
  }

  void _clearForm() {
    setState(() {
      _formValues.clear();
      _dateValues.clear();
      _dropdownValues.clear();
      _formResetVersion++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Form alanları temizlendi.'),
      ),
    );
  }

  void _saveMock() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen zorunlu alanları kontrol edin.'),
        ),
      );
      return;
    }

    _formKey.currentState?.save();

    final newRecord = _createMockRecord();

    setState(() {
      _records.add(newRecord);
      _formValues.clear();
      _dateValues.clear();
      _dropdownValues.clear();
      _formResetVersion++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${_selectedMainType.detailTitle} mock olarak kayıt listesine eklendi.',
        ),
      ),
    );
  }
  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    return '$day.$month.$year';
  }

  bool get _isEmptyArbitrationSection {
    return _selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType ==
            DavaSubType.arabuluculuk &&
        (_selectedSection ==
                CaseFormSection.iliskiliDosyalar ||
            _selectedSection ==
                CaseFormSection.toplantiYeri);
  }

  bool get _isEmptyIcraPage {
    if (_selectedMainType != CaseMainType.icra) {
      return false;
    }

    return _selectedIcraPage ==
            IcraPageSection.iliskiliDosyalar ||
        _selectedIcraPage ==
            IcraPageSection.durusmaBilgileri ||
        _selectedIcraPage ==
            IcraPageSection.istinafMahkemeBilgileri ||
        _selectedIcraPage ==
            IcraPageSection.geldigiYerSehir ||
        _selectedIcraPage ==
            IcraPageSection.vekaletIslemleri;
  }

  bool get _hideActionsAndTable {
    return _isEmptyDavaPage ||
        _isEmptyIcraPage ||
        _isEmptyBilgiBelgePage ||
        _isEmptyDigerPage ||
        _isEmptyArbitrationSection;
  }

  bool get _isIcraEmptySerialPage {
    return _selectedMainType == CaseMainType.icra &&
        _selectedIcraPage ==
            IcraPageSection.bosSeriDosyaOlustur;
  }

  bool get _showSubSectionSelector {
    if (_selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType !=
            DavaSubType.arabuluculuk) {
      return _selectedDavaPage ==
          DavaPageSection.davaBilgileri;
    }

    if (_selectedMainType == CaseMainType.icra) {
      return _selectedIcraPage ==
          IcraPageSection.icraBilgileri;
    }

    if (_selectedMainType ==
        CaseMainType.bilgiBelge) {
      return _selectedBilgiBelgePage ==
          BilgiBelgePageSection.bilgiBelgeBilgileri;
    }

    if (_selectedMainType == CaseMainType.diger) {
      return _selectedDigerPage ==
          DigerPageSection.digerBilgileri;
    }
    return true;
  }

  bool get _isEmptyBilgiBelgePage {
    if (_selectedMainType !=
        CaseMainType.bilgiBelge) {
      return false;
    }

    return _selectedBilgiBelgePage ==
            BilgiBelgePageSection.iliskiliDosyalar ||
        _selectedBilgiBelgePage ==
            BilgiBelgePageSection.durusmaBilgileri ||
        _selectedBilgiBelgePage ==
            BilgiBelgePageSection
                .istinafMahkemeBilgileri ||
        _selectedBilgiBelgePage ==
            BilgiBelgePageSection.geldigiYerSehir ||
        _selectedBilgiBelgePage ==
            BilgiBelgePageSection.vekaletIslemleri;
  }

  bool get _isBilgiBelgeEmptySerialPage {
    return _selectedMainType ==
            CaseMainType.bilgiBelge &&
        _selectedBilgiBelgePage ==
            BilgiBelgePageSection
                .bosSeriDosyaOlustur;
  }

  bool get _isEmptyDigerPage {
    if (_selectedMainType != CaseMainType.diger) {
      return false;
    }

    return _selectedDigerPage ==
            DigerPageSection.iliskiliDosyalar ||
        _selectedDigerPage ==
            DigerPageSection.durusmaBilgileri ||
        _selectedDigerPage ==
            DigerPageSection.istinafMahkemeBilgileri ||
        _selectedDigerPage ==
            DigerPageSection.geldigiYerSehir ||
        _selectedDigerPage ==
            DigerPageSection.vekaletIslemleri;
  }

  bool get _isDigerEmptySerialPage {
    return _selectedMainType == CaseMainType.diger &&
        _selectedDigerPage ==
            DigerPageSection.bosSeriDosyaOlustur;
  }

  bool get _isEmptyDavaPage {
    if (_selectedMainType != CaseMainType.dava ||
        _selectedDavaSubType ==
            DavaSubType.arabuluculuk) {
      return false;
    }

    return _selectedDavaPage ==
            DavaPageSection.iliskiliDosyalar ||
        _selectedDavaPage ==
            DavaPageSection.durusmaBilgileri ||
        _selectedDavaPage ==
            DavaPageSection.istinafMahkemeBilgileri ||
        _selectedDavaPage ==
            DavaPageSection.geldigiYerSehir ||
        _selectedDavaPage ==
            DavaPageSection.vekaletIslemleri;
  }

  bool get _isDavaEmptySerialPage {
    return _selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType !=
            DavaSubType.arabuluculuk &&
        _selectedDavaPage ==
            DavaPageSection.bosSeriDosyaOlustur;
  }


  void _searchMock() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Arama işlemi mock olarak çalıştırıldı.'),
      ),
    );
  }

  void _setDateValue(String label, DateTime pickedDate) {
    setState(() {
      _dateValues[label] = _formatDate(pickedDate);
    });
  }

  void _setDropdownValue(String label, String? value) {
    setState(() {
      if (value == null || value.isEmpty) {
        _dropdownValues.remove(label);
      } else {
        _dropdownValues[label] = value;
      }
    });
  }

  void _setLookupValue(String label, String selectedValue) {
    setState(() {
      if (selectedValue.isEmpty) {
        _formValues.remove(label);
      } else {
        _formValues[label] = selectedValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _HeaderCard(
          title: 'Dava Dosya Giriş',
          subtitle:
              'Dosya türüne göre değişen mobil form ekranı. API hazır olduğunda bu alanlar servis verileriyle beslenecektir.',
          selectedMainType: _selectedMainType,
        ),
        const SizedBox(height: 16),
        _MainTypeSelector(
          selectedType: _selectedMainType,
          onChanged: _changeMainType,
        ),
        if (_selectedMainType == CaseMainType.icra) ...[
          const SizedBox(height: 12),

          _IcraPageSelector(
            selectedPage: _selectedIcraPage,
            onChanged: (page) {
              setState(() {
                _selectedIcraPage = page;
                _selectedSection =
                    page == IcraPageSection.bosSeriDosyaOlustur
                        ? CaseFormSection.bosSeri
                        : CaseFormSection.temel;
                _formValues.clear();
                _dateValues.clear();
                _dropdownValues.clear();
                _formResetVersion++;
              });
            },
          ),
        ],

        if (_selectedMainType == CaseMainType.diger) ...[
          const SizedBox(height: 12),

          _DigerPageSelector(
            selectedPage: _selectedDigerPage,
            onChanged: (page) {
              setState(() {
                _selectedDigerPage = page;

                _selectedSection =
                    page == DigerPageSection.bosSeriDosyaOlustur
                        ? CaseFormSection.bosSeri
                        : CaseFormSection.temel;

                _formValues.clear();
                _dateValues.clear();
                _dropdownValues.clear();
                _formResetVersion++;
              });
            },
          ),
        ],

        if (_selectedMainType ==
            CaseMainType.bilgiBelge) ...[
          const SizedBox(height: 12),

          _BilgiBelgePageSelector(
            selectedPage: _selectedBilgiBelgePage,
            onChanged: (page) {
              setState(() {
                _selectedBilgiBelgePage = page;

                _selectedSection =
                    page ==
                            BilgiBelgePageSection
                                .bosSeriDosyaOlustur
                        ? CaseFormSection.bosSeri
                        : CaseFormSection.temel;

                _formValues.clear();
                _dateValues.clear();
                _dropdownValues.clear();
                _formResetVersion++;
              });
            },
          ),
        ],

        if (_selectedMainType == CaseMainType.dava) ...[
          const SizedBox(height: 12),
          _DavaSubTypeSelector(
            selectedType: _selectedDavaSubType,
            onChanged: (type) {
              setState(() {
                _selectedDavaSubType = type;
                _selectedDavaPage =
                    DavaPageSection.davaBilgileri;
                _selectedSection = type == DavaSubType.arabuluculuk
                    ? CaseFormSection.arabuluculukDava
                    : CaseFormSection.temel;
                _formValues.clear();
                _dateValues.clear();
                _dropdownValues.clear();
                _formResetVersion++;
              });
            },
          ),
        ],

        if (_selectedMainType == CaseMainType.dava &&
            _selectedDavaSubType !=
                DavaSubType.arabuluculuk) ...[
          const SizedBox(height: 12),

          _DavaPageSelector(
            selectedPage: _selectedDavaPage,
            onChanged: (page) {
              setState(() {
                _selectedDavaPage = page;

                _selectedSection =
                    page == DavaPageSection.bosSeriDosyaOlustur
                        ? CaseFormSection.bosSeri
                        : CaseFormSection.temel;

                _formValues.clear();
                _dateValues.clear();
                _dropdownValues.clear();
                _formResetVersion++;
              });
            },
          ),
        ],

        if (_availableSections.length > 1 &&
            _showSubSectionSelector) ...[
          const SizedBox(height: 16),
          _SectionSelector(
            selectedSection: _selectedSection,
            sections: _availableSections,
            onChanged: _changeSection,
          ),
        ],
        const SizedBox(height: 16),
        Form(
          key: _formKey,
          child: _buildSelectedForm(),
        ),
        if (!_hideActionsAndTable) ...[
          const SizedBox(height: 16),

          _ActionButtons(
            onClear: _clearForm,
            onSearch: _searchMock,
            onSave: _saveMock,
          ),

          const SizedBox(height: 16),

          _ResultTableCard(
            columns: _tableColumns(),
            records: _visibleRecords,
          ),
        ],
      ],
    );
  }
}