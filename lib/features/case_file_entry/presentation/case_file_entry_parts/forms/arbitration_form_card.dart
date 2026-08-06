part of '../../case_file_entry_page.dart';

class _ArbitrationFormCard extends StatelessWidget {
  final bool emptySerialMode;

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

  const _ArbitrationFormCard({
    required this.emptySerialMode,
    required this.fieldBuilder,
    required this.dateBuilder,
    required this.dropdownBuilder,
    required this.lookupBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FormCard(
          title: emptySerialMode
              ? 'Arabuluculuk Boş Seri Dosya Oluştur'
              : 'Arabuluculuk Dava Bilgileri',
          subtitle: emptySerialMode
              ? 'Arabuluculuk türünde seri dosyalar oluşturmak için gerekli alanlar.'
              : 'Arabuluculuk dosyasına ait taraf, arabulucu, sonuç ve takip bilgileri.',
          children: [
            if (emptySerialMode) ...[
              fieldBuilder(
                'Adet',
                icon: Icons.format_list_numbered_outlined,
                keyboardType: TextInputType.number,
                requiredField: true,
              ),
              const SizedBox(height: 12),
            ],

            lookupBuilder(
              emptySerialMode ? 'Avukat' : 'Üye1 Avukat',
              icon: Icons.person_outline,
              requiredField: true,
              dialogTitle:
                  emptySerialMode ? 'Avukat' : 'Üye1 Avukat',
              options: _lawyerOptions,
            ),
            const SizedBox(height: 12),

            dropdownBuilder(
              'Dava Türü',
              _arbitrationCaseTypeOptions,
              requiredField: true,
              icon: Icons.category_outlined,
            ),
            const SizedBox(height: 12),

            lookupBuilder(
              'Üye2',
              icon: Icons.person_search_outlined,
              dialogTitle: 'Komisyon Üyesi Ara',
              options: _mediationMemberOptions,
            ),
            const SizedBox(height: 12),

            lookupBuilder(
              'Üye3',
              icon: Icons.person_search_outlined,
              dialogTitle: 'Komisyon Üyesi Ara',
              options: _mediationMemberOptions,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Taraf Bilgileri',
          subtitle:
              'Başvurucu ve karşı yan kimlik bilgileri',
          icon: Icons.groups_outlined,
          children: [
            const _SectionTitle(title: 'Başvurucu'),
            const SizedBox(height: 8),

            fieldBuilder(
              'Başvurucu TC Kimlik',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            fieldBuilder('Başvurucu Ünvan/Ad'),
            const SizedBox(height: 12),

            fieldBuilder('Başvurucu Soyadı'),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),

            const _SectionTitle(title: 'Karşı Yan'),
            const SizedBox(height: 8),

            fieldBuilder(
              'Karşı Yan TC Kimlik',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            fieldBuilder('Karşı Yan Ünvan/Ad'),
            const SizedBox(height: 12),

            fieldBuilder('Karşı Yan Soyadı'),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Dosya ve Arabuluculuk Bilgileri',
          subtitle:
              'Konu, arabuluculuk numarası ve büro numarası',
          icon: Icons.folder_outlined,
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
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Arabulucu Bilgileri',
          subtitle: emptySerialMode
              ? 'Arabulucu seçimi ve adı'
              : 'Arabulucu seçimi ve iletişim bilgileri',
          icon: Icons.handshake_outlined,
          children: [
            lookupBuilder(
              'Arabulucu',
              icon: Icons.person_search_outlined,
              dialogTitle: 'Arabulucu Bilgileri',
              options: _arbitratorOptions,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Arabulucu Adı',
              readOnly: true,
            ),

            if (!emptySerialMode) ...[
              const SizedBox(height: 12),

              fieldBuilder(
                'Arabulucu Sicil No',
                readOnly: true,
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'Arabulucu Telefon',
                readOnly: true,
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'Arabulucu Adres',
                maxLines: 3,
                readOnly: true,
              ),
            ],
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Sonuç, Şehir ve Kurum',
          subtitle:
              'Görüşme sonucu, şehir ve kurum bilgileri',
          icon: Icons.fact_check_outlined,
          children: [
            if (!emptySerialMode) ...[
              dropdownBuilder(
                'Durumu',
                _statusOptions,
              ),
              const SizedBox(height: 12),
              fieldBuilder(
                'Arabuluculuk No Yıl',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'Arabuluculuk No',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'Büro No Yıl',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'Büro No',
                keyboardType: TextInputType.number,
              ),
            ],

            dropdownBuilder(
              'Görüşme Sonucu',
              _mediationResultOptions,
            ),
            const SizedBox(height: 12),

            fieldBuilder('Görüşme Sonucu Değeri'),
            const SizedBox(height: 12),

            dropdownBuilder(
              'Şehir',
              _turkeyCityOptions,
              icon: Icons.location_city_outlined,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Kurum',
              icon: Icons.business_outlined,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Takip ve Zaman Bilgileri',
          subtitle: emptySerialMode
              ? 'Tarih, saat, yer ve seri takip bilgileri'
              : 'İç takip, seri takip ve kayıt bilgileri',
          icon: Icons.schedule_outlined,
          children: [
            if (emptySerialMode) ...[
              dateBuilder('Tarih'),
              const SizedBox(height: 12),

              fieldBuilder(
                'Başlangıç Saati',
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'Yer',
                icon: Icons.location_on_outlined,
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'İç TakipId Başlangıç',
                readOnly: true,
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'İç TakipId Bitiş',
                readOnly: true,
              ),
              const SizedBox(height: 12),

              lookupBuilder(
                'Seri Takip Id',
                icon: Icons.search_outlined,
                dialogTitle: 'Seri Takip Id Ara',
                options: _serialTrackingOptions,
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'Başlangıç',
                readOnly: true,
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'Bitiş',
                readOnly: true,
              ),
            ] else ...[
              fieldBuilder('İç TakipId'),
              const SizedBox(height: 12),

              fieldBuilder('Seri Takip Id'),
              const SizedBox(height: 4),

              const _SingleCheckboxTile(
                title: 'Sadece Seri Dosyalar',
              ),
              const SizedBox(height: 12),

              fieldBuilder(
                'Kayıt No',
                readOnly: true,
              ),
            ],
          ],
        ),

        if (!emptySerialMode) ...[
          const SizedBox(height: 12),

          _ExpandableFormCard(
            title: 'Bul',
            subtitle:
                'Arabuluculuk no, konu, şehir ve kayıt no ile arama',
            icon: Icons.search_outlined,
            children: [
              lookupBuilder(
                'Bul [ArabuluculukNo]',
                icon: Icons.search_outlined,
                dialogTitle: 'Arabuluculuk No Ara',
                options: const [],
              ),
              const SizedBox(height: 12),

              lookupBuilder(
                'Bul [Konu]',
                icon: Icons.search_outlined,
                dialogTitle: 'Konu Ara',
                options: const [],
              ),
              const SizedBox(height: 12),

              lookupBuilder(
                'Bul [Şehir]',
                icon: Icons.location_city_outlined,
                dialogTitle: 'Şehir Ara',
                options: _turkeyCityOptions,
              ),
              const SizedBox(height: 12),

              lookupBuilder(
                'Bul [Kayıt No]',
                icon: Icons.search_outlined,
                dialogTitle: 'Kayıt No Ara',
                options: const [],
              ),
            ],
          ),
        ],
      ],
    );
  }
}