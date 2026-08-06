part of '../../case_file_entry_page.dart';

class _EmptySerialFileFormCard extends StatelessWidget {
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

  const _EmptySerialFileFormCard({
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
    final responsiblePersonLabel =
    selectedMainType == CaseMainType.bilgiBelge
        ? 'Avukat'
        : labels.responsiblePerson;

    return Column(
      children: [
        _FormCard(
          title: 'Boş Seri Dosya Oluştur',
          subtitle:
              'Seri biçimde oluşturulacak dosyalar için gerekli temel alanlar.',
          children: [
            fieldBuilder(
              'Adet',
              icon: Icons.format_list_numbered_outlined,
              keyboardType: TextInputType.number,
              requiredField: true,
            ),
            const SizedBox(height: 12),
            fieldBuilder(
              responsiblePersonLabel,
              icon: Icons.person_outline,
              requiredField: true,
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
              dialogTitle: '$labels.authority Kod Tanımları',
              options: _courtOptions,
            ),
            const SizedBox(height: 12),
            dateBuilder('Dilekçe Tebliğ / Verme Tarihi'),
            const SizedBox(height: 12),

            lookupBuilder(
              'Karşı Taraf Avukat',
              icon: Icons.person_search_outlined,
              dialogTitle: 'Karşı Taraf Avukat',
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
          title: 'Konu ve Açıklama',
          subtitle: 'Dosyanın konusu, açıklaması ve geldiği yer bilgisi',
          icon: Icons.subject_outlined,
          children: [
            fieldBuilder(
              'Konu',
              icon: Icons.subject_outlined,
              requiredField: true,
            ),
            const SizedBox(height: 12),
            fieldBuilder(
              'Açıklama',
              icon: Icons.notes_outlined,
              maxLines: 4,
            ),
            const SizedBox(height: 12),
            lookupBuilder(
              'Geldiği Yer',
              icon: Icons.location_on_outlined,
              dialogTitle: 'Geldiği Yer Kod Tanımları',
              options: _courtOptions,
            ),
            const SizedBox(height: 12),
            dropdownBuilder(
              'Şehir',
              _turkeyCityOptions,
              icon: Icons.location_city_outlined,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'Tazminat ve Takip Bilgileri',
          subtitle: 'Talep, hüküm ve seri takip bilgileri',
          icon: Icons.request_quote_outlined,
          children: [
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
            const SizedBox(height: 12),
            lookupBuilder(
              'Seri Takip Id',
              icon: Icons.link_outlined,
              dialogTitle: 'Seri Takip Id Ara',
              options: _serialTrackingOptions,
            ),
            const SizedBox(height: 12),
            fieldBuilder('Başlangıç', readOnly: true),
            const SizedBox(height: 12),
            fieldBuilder('Bitiş', readOnly: true),
          ],
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

    switch (subType) {
      case DavaSubType.adli:
        return _adliCaseTypeOptions;

      case DavaSubType.ceza:
        return const [
          'Ceza',
          'Ağır Ceza',
          'Asliye Ceza',
        ];

      case DavaSubType.idari:
        return const [
          'İdari',
          'Vergi',
          'İdare Mahkemesi',
        ];

      case DavaSubType.arabuluculuk:
        return const [
          'Arabuluculuk',
          'İş Arabuluculuğu',
          'Ticari Arabuluculuk',
        ];
    }
  }
}