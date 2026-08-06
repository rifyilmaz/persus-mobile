part of '../../case_file_entry_page.dart';

class _AppealInfoFormCard extends StatelessWidget {
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

  const _AppealInfoFormCard({
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
          title: 'Son İstinaf ve Ek Bilgiler',
          subtitle:
              'İstinaf, temyiz, netice, devir ve icra ek bilgilerinin '
              'girileceği alanlar.',
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
          title: 'İstinaf Bilgileri',
          subtitle:
              'İstinaf mercii, esas, karar ve karar tarihi',
          icon: Icons.account_balance_outlined,
          children: [
            lookupBuilder(
              'İstinaf Merci',
              icon: Icons.account_balance_outlined,
              dialogTitle: 'İstinaf Merci Kod Tanımları',
              options: _courtOptions,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'İstinaf Esas Yıl',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'İstinaf Esas No',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'İstinaf Karar Yıl',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'İstinaf Karar No',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            dateBuilder('İstinaf Karar Tarihi'),
            const SizedBox(height: 12),

            fieldBuilder('İstinaf Merci [Eski Alan]'),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Temyiz Bilgileri',
          subtitle:
              'Temyiz mercii, esas, karar ve karar tarihi',
          icon: Icons.gavel_outlined,
          children: [
            lookupBuilder(
              'Temyiz Merci',
              icon: Icons.account_balance_outlined,
              dialogTitle: 'Temyiz Merci Kod Tanımları',
              options: _courtOptions,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Temyiz Esas Yıl',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Temyiz Esas No',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Temyiz Karar Yıl',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Temyiz Karar No',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            dateBuilder('Temyiz Karar Tarihi'),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Netice ve Devir Bilgileri',
          subtitle:
              'Bakanlık, karşı taraf, devir ve irtibat bilgileri',
          icon: Icons.fact_check_outlined,
          children: [
            dropdownBuilder(
              'Bakanlık İstinaf Netice',
              _legalResultOptions,
            ),
            const SizedBox(height: 12),

            dropdownBuilder(
              'Karşı Taraf İstinaf Netice',
              _legalResultOptions,
            ),
            const SizedBox(height: 12),

            dropdownBuilder(
              'Bakanlık Temyiz Netice',
              _legalResultOptions,
            ),
            const SizedBox(height: 12),

            dropdownBuilder(
              'Karşı Taraf Temyiz Netice',
              _legalResultOptions,
            ),
            const SizedBox(height: 12),

            dropdownBuilder(
              'Devir?',
              const ['Evet', 'Hayır'],
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Devir Yeri',
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'İrtibat',
              icon: Icons.contact_phone_outlined,
              keyboardType: TextInputType.phone,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'İcra Ek Bilgileri',
          subtitle:
              'İtiraz, ilişkili dava, bidayet ve ilam bilgileri',
          icon: Icons.description_outlined,
          children: [
            dropdownBuilder(
              'İtiraz / Şikayet?',
              const ['Evet', 'Hayır'],
            ),
            const SizedBox(height: 12),

            dropdownBuilder(
              'İtiraz Sonuç',
              _legalResultOptions,
            ),
            const SizedBox(height: 12),

            lookupBuilder(
              'İlişkili Dava Mahkeme',
              icon: Icons.account_balance_outlined,
              dialogTitle:
                  'İlişkili Dava Mahkeme Kod Tanımları',
              options: _courtOptions,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Bidayet Dosya Esas Yıl',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            fieldBuilder(
              'Bidayet Dosya Esas No',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),

            dropdownBuilder(
              'İlamlı Mı?',
              const ['Evet', 'Hayır'],
            ),
          ],
        ),
      ],
    );
  }
}