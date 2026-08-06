part of '../../case_file_entry_page.dart';

class _GorusFormCard extends StatelessWidget {
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

  final String nextRecordNumber;

  const _GorusFormCard({
    required this.fieldBuilder,
    required this.dateBuilder,
    required this.dropdownBuilder,
    required this.lookupBuilder,
    required this.nextRecordNumber,
  });

  Widget _readOnlyField({
    required String label,
    required String value,
    IconData? icon,
  }) {
    return TextFormField(
      key: ValueKey('gorus-$label-$value'),
      initialValue: value,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _FormCard(
          title: 'Görüş Bilgileri',
          subtitle:
              'Görüş dosyasına ait sorumlu, birim, tarih, evrak ve durum bilgileri.',
          children: [
            Text(
              'Bilgiler konu başlıklarına ayrılmıştır. '
              'Doldurmak istediğiniz kartı açabilirsiniz.',
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Temel Görüş Bilgileri',
          subtitle: 'Avukat, dava türü, birim ve geldiği yer',
          icon: Icons.record_voice_over_outlined,
          children: [
            fieldBuilder(
              'Avukat',
              icon: Icons.person_outline,
              requiredField: true,
            ),
            const SizedBox(height: 12),

            dropdownBuilder(
              'Dava Türü',
              _gorusCaseTypeOptions,
              icon: Icons.category_outlined,
              requiredField: true,
            ),
            const SizedBox(height: 12),

            dropdownBuilder(
              'Birim',
              _gorusUnitOptions,
              icon: Icons.apartment_outlined,
            ),
            const SizedBox(height: 12),

            lookupBuilder(
              'Geldiği Yer',
              icon: Icons.location_on_outlined,
              dialogTitle: 'Geldiği Yer Kod Tanımları',
              options: const [],
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Tarih ve Evrak Bilgileri',
          subtitle: 'Başlangıç, bitiş ve gelen/giden evrak bilgileri',
          icon: Icons.calendar_month_outlined,
          children: [
            dateBuilder(
              'Geldiği Tarih',
              requiredField: true,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Süresi (Gün)',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            dateBuilder('Son Gün'),
            const SizedBox(height: 12),

            fieldBuilder(
              'Gelen Evrak (Barkod) No',
              icon: Icons.move_to_inbox_outlined,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Giden Evrak (Barkod) No',
              icon: Icons.outbox_outlined,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Durum ve Açıklama',
          subtitle: 'Konu, durum ve açıklama bilgileri',
          icon: Icons.description_outlined,
          children: [
            dropdownBuilder(
              'Durumu',
              _gorusStatusOptions,
              icon: Icons.fact_check_outlined,
            ),
            const SizedBox(height: 12),

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
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Kayıt Bilgileri',
          subtitle: 'Kayıt numarası, grup ve alt grup bilgileri',
          icon: Icons.folder_outlined,
          children: [
            _readOnlyField(
              label: 'Kayıt No',
              value: nextRecordNumber,
              icon: Icons.numbers_outlined,
            ),
            const SizedBox(height: 12),

            _readOnlyField(
              label: 'Grup',
              value: 'Görüş Dosyası',
              icon: Icons.folder_outlined,
            ),
            const SizedBox(height: 12),

            _readOnlyField(
              label: 'AltGrup',
              value: '',
              icon: Icons.folder_copy_outlined,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Bul / Filtrele',
          subtitle: 'Kayıt numarası ve konu ile arama',
          icon: Icons.search_outlined,
          children: [
            lookupBuilder(
              'Bul [Kayıt No]',
              icon: Icons.numbers_outlined,
              dialogTitle: 'Kayıt No ile Ara',
              options: const [],
            ),
            const SizedBox(height: 12),

            lookupBuilder(
              'Bul [Konu]',
              icon: Icons.subject_outlined,
              dialogTitle: 'Konu ile Ara',
              options: const [],
            ),
          ],
        ),
      ],
    );
  }
}