part of '../../case_file_entry_page.dart';

class _TemelBilgilerFormCard extends StatelessWidget {
  final CaseMainType selectedMainType;
  final DavaSubType selectedDavaSubType;

  final Widget Function(
    String label, {
    IconData? icon,
    int maxLines,
    bool requiredField,
    bool readOnly,
    TextInputType? keyboardType,
  }) fieldBuilder;

  final Widget Function(
    String label, {
    bool requiredField,
  }) dateBuilder;

  final Widget Function(
    String label,
    List<String> options, {
    bool requiredField,
    IconData? icon,
  }) dropdownBuilder;

  final Widget Function(
    String label, {
    IconData? icon,
    bool requiredField,
    String dialogTitle,
    List<String> options,
  }) lookupBuilder;

  const _TemelBilgilerFormCard({
    required this.selectedMainType,
    required this.selectedDavaSubType,
    required this.fieldBuilder,
    required this.dateBuilder,
    required this.dropdownBuilder,
    required this.lookupBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final labels = _FormLabels.fromType(selectedMainType);

    return Column(
      children: [
        _FormCard(
          title: selectedMainType.detailTitle,
          subtitle: selectedMainType == CaseMainType.dava
              ? '${selectedDavaSubType.label} dava türü için zorunlu temel bilgiler.'
              : 'Seçilen dosya türüne göre zorunlu temel bilgiler.',
          children: [
            _SectionTitle(title: 'Zorunlu Temel Bilgiler'),
            const SizedBox(height: 12),
            lookupBuilder(
              labels.responsiblePerson,
              icon: Icons.person_outline,
              requiredField: true,
              dialogTitle: labels.responsiblePerson == 'Memur'
                  ? 'Memur'
                  : 'Avukat',
              options: _lawyerOptions,
            ),
            const SizedBox(height: 12),
            dropdownBuilder(
              'Dava Türü',
              _caseTypeOptions(selectedMainType, selectedDavaSubType),
              icon: Icons.category_outlined,
              requiredField: true,
            ),
            const SizedBox(height: 12),
            lookupBuilder(
              labels.authority,
              icon: Icons.account_balance_outlined,
              requiredField: true,
              dialogTitle: 'Kod Tanımları',
              options: _courtOptions,
            ),
            const SizedBox(height: 12),
            fieldBuilder(
              'Konu',
              icon: Icons.subject_outlined,
              requiredField: true,
            ),
            const SizedBox(height: 12),
            lookupBuilder(
              'Karşı Taraf Avukat',
              icon: Icons.person_search_outlined,
              dialogTitle: 'Avukat',
              options: _lawyerOptions,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'Taraf Bilgileri',
          subtitle:
              '${labels.firstPartyTitle} ve ${labels.secondPartyTitle} bilgileri',
          icon: Icons.groups_outlined,
          children: [
            _SectionTitle(title: labels.firstPartyTitle),
            const SizedBox(height: 8),
            fieldBuilder(
              '${labels.firstPartyTitle} TC Kimlik',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            fieldBuilder('${labels.firstPartyTitle} Ünvan/Ad'),
            const SizedBox(height: 12),
            fieldBuilder('${labels.firstPartyTitle} Soyadı'),
            const SizedBox(height: 16),
            _SectionTitle(title: labels.secondPartyTitle),
            const SizedBox(height: 8),
            fieldBuilder(
              '${labels.secondPartyTitle} TC Kimlik',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            fieldBuilder('${labels.secondPartyTitle} Ünvan/Ad'),
            const SizedBox(height: 12),
            fieldBuilder('${labels.secondPartyTitle} Soyadı'),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'Karar ve Dosya Bilgileri',
          subtitle:
              'Bidayet dosya esas, karar no, karar tarihi ve kesinleşme bilgileri',
          icon: Icons.fact_check_outlined,
          children: [
            fieldBuilder('Bidayet Dosya Esas Yıl'),
            const SizedBox(height: 12),
            fieldBuilder('Bidayet Dosya Esas No'),
            const SizedBox(height: 12),
            fieldBuilder('Bidayet Karar Yıl'),
            const SizedBox(height: 12),
            fieldBuilder('Bidayet Karar No'),
            const SizedBox(height: 12),
            dateBuilder('Karar Tarihi'),
            const SizedBox(height: 12),
            dateBuilder('Bidayet Karar Tebliğ Tarihi'),
            const SizedBox(height: 12),
            dropdownBuilder(
              'Kesinleşme?',
              const ['Evet', 'Hayır'],
            ),
            const SizedBox(height: 12),
            dateBuilder('Kesinleşme Tarihi'),
            const SizedBox(height: 12),
            dropdownBuilder(
              'Esası Değişen Dava Mı?',
              const ['Evet', 'Hayır'],
            ),
            const SizedBox(height: 12),
            lookupBuilder(
              'Esası Değişen Dosya-Mahkeme',
              icon: Icons.search_outlined,
              dialogTitle: 'Kod Tanımları',
              options: _courtOptions,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'Aşama, Durum ve Netice',
          subtitle:
              'Dava aşaması, dosya durumu, kesinleşme aşaması ve bidayet netice bilgileri',
          icon: Icons.timeline_outlined,
          children: [
            dropdownBuilder(
              'Dava Aşama',
              _caseStageOptions,
            ),
            const SizedBox(height: 12),
            dropdownBuilder(
              'Durumu',
              _statusOptions,
            ),
            const SizedBox(height: 12),
            dropdownBuilder(
              'Karar Kesinleşme Aşaması',
              _finalizationStageOptions,
            ),
            const SizedBox(height: 12),
            dropdownBuilder(
              'Bidayet Netice',
              _bidayetResultOptions,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'İcra ve Tazminat Bilgileri',
          subtitle:
              'İcra dairesi, icra dosya numarası ve maddi/manevi tazminat alanları',
          icon: Icons.request_quote_outlined,
          children: [
            lookupBuilder(
              'İcra Dairesi',
              icon: Icons.account_balance_outlined,
              dialogTitle: 'Kod Tanımları',
              options: _executionOfficeOptions,
            ),
            const SizedBox(height: 12),
            fieldBuilder('İcra DosyaNo Yıl'),
            const SizedBox(height: 12),
            fieldBuilder('İcra DosyaNo No'),
            const SizedBox(height: 12),
            fieldBuilder(
              'Talep Maddi Tazminat',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            fieldBuilder(
              'Talep Manevi Tazminat',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            fieldBuilder(
              'Hüküm Maddi Tazminat',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            fieldBuilder(
              'Hüküm Manevi Tazminat',
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'Tarih, Açıklama ve Takip',
          subtitle: 'Tebliğ tarihi, olay tarihi, açıklama ve takip bilgileri',
          icon: Icons.event_note_outlined,

          children: [
            if (selectedMainType ==
                CaseMainType.bilgiBelge) ...[
              dateBuilder('Evrak Tarihi'),
              const SizedBox(height: 12),

              fieldBuilder(
                'Gelen Evrak (Barkod) No',
                icon: Icons.qr_code_outlined,
              ),
              const SizedBox(height: 12),

              const Divider(),
              const SizedBox(height: 12),
            ],
            dateBuilder('Dilekçe Tebliğ / Verme Tarihi'),
            const SizedBox(height: 12),
            dateBuilder('Olay Tarihi'),
            const SizedBox(height: 12),
            fieldBuilder('İç TakipId'),
            const SizedBox(height: 12),
            fieldBuilder('Seri Takip Id'),
            const SizedBox(height: 12),
            fieldBuilder('Arşiv No'),
            const SizedBox(height: 12),
            fieldBuilder('Kayıt No', readOnly: true),
            const SizedBox(height: 12),
            fieldBuilder(
              'Açıklama',
              icon: Icons.notes_outlined,
              maxLines: 4,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _SearchPanelCard(
          fieldBuilder: fieldBuilder,
          dropdownBuilder: dropdownBuilder,
          lookupBuilder: lookupBuilder,
        ),
      ],
    );
  }

  List<String> _caseTypeOptions(
    CaseMainType mainType,
    DavaSubType subType,
  ) {
    if (mainType == CaseMainType.icra) {
      return _executionCaseTypeOptions;
    }

    if (mainType == CaseMainType.bilgiBelge) {
      return _informationDocumentCaseTypeOptions;
    }

    if (mainType == CaseMainType.diger) {
      return _otherCaseTypeOptions;
    }

    if (subType == DavaSubType.arabuluculuk) {
      return const [
        'Arabuluculuk',
        'İş Arabuluculuğu',
        'Ticari Arabuluculuk',
      ];
    }

    return _adliCaseTypeOptions;
  }
}

class _SearchPanelCard extends StatelessWidget {
  final Widget Function(
    String label, {
    IconData? icon,
    int maxLines,
    bool requiredField,
    bool readOnly,
    TextInputType? keyboardType,
  }) fieldBuilder;

  final Widget Function(
    String label,
    List<String> options, {
    bool requiredField,
    IconData? icon,
  }) dropdownBuilder;

  final Widget Function(
    String label, {
    IconData? icon,
    bool requiredField,
    String dialogTitle,
    List<String> options,
  }) lookupBuilder;

  const _SearchPanelCard({
    required this.fieldBuilder,
    required this.dropdownBuilder,
    required this.lookupBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return _ExpandableFormCard(
      title: 'Bul / Filtrele',
      subtitle:
          'Şehir, yer, dosya esas no, konu ve kayıt no ile arama alanları',
      icon: Icons.search_outlined,
      children: [
        const _SingleCheckboxTile(title: 'Sadece Seri Dosyalar'),
        const SizedBox(height: 12),
        dropdownBuilder(
          'Bul [Şehir]',
          _turkeyCityOptions,
          icon: Icons.location_city_outlined,
        ),
        const SizedBox(height: 12),
        lookupBuilder(
          'Bul [Yer]',
          icon: Icons.location_on_outlined,
          dialogTitle: 'Kod Tanımları',
          options: _courtOptions,
        ),
        const SizedBox(height: 12),
        fieldBuilder('Bul [DosyaEsasNo]'),
        const SizedBox(height: 12),
        fieldBuilder('Bul [Konu]'),
        const SizedBox(height: 12),
        fieldBuilder('Bul [Kayıt No]'),
      ],
    );
  }
}

class _FormLabels {
  final String responsiblePerson;
  final String authority;
  final String firstPartyTitle;
  final String secondPartyTitle;

  const _FormLabels({
    required this.responsiblePerson,
    required this.authority,
    required this.firstPartyTitle,
    required this.secondPartyTitle,
  });

  factory _FormLabels.fromType(CaseMainType type) {
    switch (type) {
      case CaseMainType.icra:
        return const _FormLabels(
          responsiblePerson: 'Avukat',
          authority: 'İcra Dairesi',
          firstPartyTitle: 'Alacaklı',
          secondPartyTitle: 'Borçlu',
        );
      case CaseMainType.bilgiBelge:
        return const _FormLabels(
          responsiblePerson: 'Memur',
          authority: 'Yetkili Mahkeme / Geldiği Yer',
          firstPartyTitle: 'Taraf1',
          secondPartyTitle: 'Taraf2',
        );
      case CaseMainType.dava:
      case CaseMainType.diger:
      case CaseMainType.gorus:
        return const _FormLabels(
          responsiblePerson: 'Avukat',
          authority: 'Yetkili Mahkeme',
          firstPartyTitle: 'Davacı',
          secondPartyTitle: 'Davalı',
        );
    }
  }
} 