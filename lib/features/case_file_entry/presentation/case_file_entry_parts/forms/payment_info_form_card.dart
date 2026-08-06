part of '../../case_file_entry_page.dart';

class _PaymentInfoFormCard extends StatelessWidget {
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

  const _PaymentInfoFormCard({
    required this.fieldBuilder,
    required this.dateBuilder,
    required this.dropdownBuilder,
  });

  Widget _describedNumberField({
    required String description,
    required String fieldLabel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        fieldBuilder(
          fieldLabel,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _FormCard(
          title: 'Ödeme Talep Bilgileri',
          subtitle:
              'Ödeme sürecindeki dönem, tarih, tutar ve bildirim alanları.',
          children: const [
            Text(
              'Bilgiler konu başlıklarına ayrılmıştır. '
              'Doldurmak istediğiniz kartın başlığına dokunarak '
              'ilgili alanları açabilirsiniz.',
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Dönem ve Boş Olma Nedenleri',
          subtitle:
              'Ücret farkı, ikramiye ve tediye dönemleri',
          icon: Icons.date_range_outlined,
          children: [
            const _SectionTitle(
              title: 'İşçi alacağına ait ücret farkı dönemi',
            ),
            const SizedBox(height: 12),

            dateBuilder('Ücret Farkı Başlangıç'),
            const SizedBox(height: 12),

            dateBuilder('Ücret Farkı Bitiş'),
            const SizedBox(height: 12),

            dropdownBuilder(
              'Ücret Farkı Boş Olma Nedeni',
              _emptyReasonOptions,
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),

            const _SectionTitle(
              title: 'İkramiye dönemi',
            ),
            const SizedBox(height: 12),

            dateBuilder('İkramiye Başlangıç'),
            const SizedBox(height: 12),

            dateBuilder('İkramiye Bitiş'),
            const SizedBox(height: 12),

            dropdownBuilder(
              'İkramiye Boş Olma Nedeni',
              _emptyReasonOptions,
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 12),

            const _SectionTitle(
              title: 'Tediye dönemi',
            ),
            const SizedBox(height: 12),

            dateBuilder('Tediye Başlangıç'),
            const SizedBox(height: 12),

            dateBuilder('Tediye Bitiş'),
            const SizedBox(height: 12),

            dropdownBuilder(
              'Tediye Boş Olma Nedeni',
              _emptyReasonOptions,
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 8),

            const _SectionTitle(
              title: 'Talep türleri',
            ),
            const SizedBox(height: 4),

            const _CheckList(
              values: [
                'Ücret Fark',
                'Tediye',
                'İkramiye',
              ],
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Ödeme Tarihleri',
          subtitle:
              'Talep, intikal, icra takip ve icra emri tarihleri',
          icon: Icons.event_available_outlined,
          children: [
            dateBuilder(
              'Ödeme Yapılmasına İlişkin Talep Tarihi',
            ),
            const SizedBox(height: 12),

            dateBuilder(
              'Talebin Ödeme Yapmaya Yetkili Birime İntikal Tarihi',
            ),
            const SizedBox(height: 12),

            dateBuilder('İcra Takip Tarihi'),
            const SizedBox(height: 12),

            dateBuilder(
              'İcra Emrinin Ödeme Yapmaya Yetkili Birime İntikal Tarihi',
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Ödenen Tutarlar',
          subtitle:
              'Asıl borç, yargılama gideri ve vekalet ücreti',
          icon: Icons.payments_outlined,
          children: [
            fieldBuilder(
              'Ödenen Asıl Borç',
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Ödenen Yargılama Gideri',
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Ödenen Vekalet Ücreti',
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Kadro ve Sözleşme Bilgileri',
          subtitle:
              'Sözleşme oranları ve bakanlığa bildirim durumu',
          icon: Icons.assignment_outlined,
          children: [
            _describedNumberField(
              description:
                  'Sürekli İşçi Kadrosuna Geçmeden Önce Alt '
                  'İşverenle Yapılan İş Sözleşmesindeki % Oran',
              fieldLabel: 'Kadro Öncesi Oran (%)',
            ),
            const SizedBox(height: 4),

            const _SingleCheckboxTile(
              title: 'Kadro Öncesi Oran Boş?',
            ),

            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),

            _describedNumberField(
              description:
                  'Kadroya Geçtikten Sonra İmzalanan '
                  'Sözleşmedeki % Oran',
              fieldLabel: 'Kadro Sonrası Oran (%)',
            ),
            const SizedBox(height: 4),

            const _SingleCheckboxTile(
              title: 'Kadro Sonrası Oran Boş?',
            ),

            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),

            _describedNumberField(
              description:
                  'Kadroya Geçtikten Sonra İmzalanan '
                  'Sözleşmedeki İkinci Oran '
                  '(Nüshalardaki oranların farklı olması '
                  'durumunda veri girişi yapılacaktır.)',
              fieldLabel: 'Kadro Sonrası İkinci Oran (%)',
            ),

            const SizedBox(height: 12),

            const _SingleCheckboxTile(
              title: 'Bakanlığa Bildirilecek',
            ),
          ],
        ),
      ],
    );
  }
}