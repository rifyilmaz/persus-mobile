part of '../case_query_page.dart';

extension _CaseQueryForms on _CaseQueryPageState {
  
  Widget _yearNoFields({
    required String title,
    required String yearLabel,
    required String noLabel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: title),
        const SizedBox(height: 8),
        _textField(
          yearLabel,
          displayLabel: 'Yıl',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        _textField(
          noLabel,
          displayLabel: 'No',
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

    Widget _dateRangeFields({
    required String title,
    required String startLabel,
    required String endLabel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: title),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _dateField(startLabel),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _dateField(endLabel),
            ),
          ],
        ),
      ],
    );
  }

    Widget _queryParameterForm() {
    return Column(
      children: [
        _FormCard(
          title: 'Sorgu Parametresi',
          subtitle:
              'Dava dosyalarını kayıt, taraf, mahkeme, istinaf ve durum bilgilerine göre sorgulama alanı.',
          children: [
            _textField(
              'Kayıt No',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _dropdownField(
                    'Grup',
                    _groupOptions,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _dropdownField(
                    'AltGrup',
                    _subGroupOptions,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _dropdownField(
              'Dava Türü',
              _caseTypeOptions,
            ),
            const SizedBox(height: 12),
            _lookupField(
              'Yetkili Mahkeme',
              dialogTitle: 'Yetkili Mahkeme Kod Tanımları',
              options: _courtOptions,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'Dosya ve Karar Bilgileri',
          subtitle: 'Bidayet, icra ve karar numarası alanları',
          icon: Icons.folder_copy_outlined,
          children: [
            _yearNoFields(
              title: 'Bidayet Dosya Esas (Yıl / No)',
              yearLabel: 'Bidayet Dosya Esas Yıl',
              noLabel: 'Bidayet Dosya Esas No',
            ),
            const SizedBox(height: 12),
            _yearNoFields(
              title: 'Bidayet Karar (Yıl / No)',
              yearLabel: 'Bidayet Karar Yıl',
              noLabel: 'Bidayet Karar No',
            ),
            const SizedBox(height: 12),
            _lookupField(
              'İcra dairesi',
              dialogTitle: 'İcra Dairesi Kod Tanımları',
              options: _executionOfficeOptions,
            ),
            const SizedBox(height: 12),
            _textField(
              'İcra DosyaNo',
              displayLabel: 'DosyaNo',
            ),
            const SizedBox(height: 12),
            _dateField('Karar Tarihi'),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'Avukat ve Taraf Bilgileri',
          subtitle: 'Avukat, karşı taraf avukat, davacı ve davalı bilgileri',
          icon: Icons.groups_outlined,
          children: [
            _dropdownField(
              'Avukat',
              _lawyerOptions,
            ),
            const SizedBox(height: 12),
            _lookupField(
              'Karşı Taraf Avukat',
              dialogTitle: 'Karşı Taraf Avukat',
              options: _lawyerOptions,
            ),
            const SizedBox(height: 12),
            _textField(
              'Davacı',
              displayLabel: 'Davacı',
            ),
            const SizedBox(height: 12),
            _textField(
              'Davacı[Tc]',
              displayLabel: 'Davacı Tc Kimlik No',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            _textField(
              'Davalı',
              displayLabel: 'Davalı',
            ),
            const SizedBox(height: 12),
            _textField(
              'Davalı[Tc]',
              displayLabel: 'Davalı Tc Kimlik No',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            _textField('Konu'),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'İstinaf ve Dava Aşaması',
          subtitle: 'İstinaf merci, esas, karar, aşama ve netice alanları',
          icon: Icons.account_balance_outlined,
          children: [
            _lookupField(
              'İstinaf Merci',
              dialogTitle: 'İstinaf Merci Kod Tanımları',
              options: _courtOptions,
            ),
            const SizedBox(height: 12),
            _textField('İstinaf Esas No'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _textField('İstinaf Karar No'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _dateField('İstinaf Karar Tarihi'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _dropdownField(
              'Esası Değişen Dava Mı?',
              _yesNoOptions,
            ),
            const SizedBox(height: 12),
            _lookupField(
              'Esası Değişen Dosya-Mahkeme',
              dialogTitle: 'Kod Tanımları',
              options: _courtOptions,
            ),
            const SizedBox(height: 12),
            _dropdownField(
              'Dava Aşama',
              _caseStageOptions,
            ),
            const SizedBox(height: 12),
            _dropdownField(
              'Durumu',
              _statusOptions,
            ),
            const SizedBox(height: 12),
            _dropdownField(
              'Bidayet Netice',
              _legalResultOptions,
            ),
            const SizedBox(height: 12),
            _dateField('Olay Tarihi'),
            const SizedBox(height: 8),
            _lookupField(
              'Arabulucu Id',
              dialogTitle: 'Arabulucu Bilgileri',
              options: _arbitratorOptions,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'Tazminat ve Açıklama',
          subtitle: 'Talep, hüküm, konu ve açıklama alanları',
          icon: Icons.request_quote_outlined,
          children: [
          _textField(
            'Talep Maddi Tzm',
            displayLabel: 'Talep Maddi Tzm',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          _textField(
            'Talep Manevi Tzm',
            displayLabel: 'Talep Manevi Tzm',
            keyboardType: TextInputType.number,
          ),
            const SizedBox(height: 12),
            _textField(
              'Açıklama',
              maxLines: 4,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _ExpandableFormCard(
          title: 'Bul / Filtrele',
          subtitle: 'Şehir, yer, dosya esas no, kayıt no ve takip bilgileri',
          icon: Icons.search_outlined,
          children: [
            _dropdownField(
              'Bul [Şehir]',
              _cityOptions,
            ),
            const SizedBox(height: 12),
            _lookupField(
              'Bul [Yer]',
              dialogTitle: 'Yer Kod Tanımları',
              options: _courtOptions,
            ),
            const SizedBox(height: 12),
            _textField('Bul [Dosya Esas No]'),
            const SizedBox(height: 12),
            _textField('Bul [Kayıt No]'),
            const SizedBox(height: 12),
            _textField('İç TakipId'),
            const SizedBox(height: 12),
            _textField('Seri Takip Id'),
            const SizedBox(height: 8),
            const _SingleCheckboxTile(title: 'Sadece Seri Dosyalar'),
          ],
        ),
      ],
    );
  }

    Widget _extraParameterForm() {
    return Column(
      children: [
        _FormCard(
          title: 'Ek Parametre',
          subtitle:
              'Tarih aralığına göre dava dosyalarını filtrelemek için ek sorgu alanları.',
          children: [
            _dateRangeFields(
              title: 'Dilekçe Tebliğ / Verme Tarih',
              startLabel: 'Dilekçe Tebliğ / Verme Tarih Başlangıç',
              endLabel: 'Dilekçe Tebliğ / Verme Tarih Bitiş',
            ),
            const SizedBox(height: 16),
            _dateRangeFields(
              title: 'Kayıt Tarihi',
              startLabel: 'Kayıt Tarihi Başlangıç',
              endLabel: 'Kayıt Tarihi Bitiş',
            ),
          ],
        ),
      ],
    );
  }
}