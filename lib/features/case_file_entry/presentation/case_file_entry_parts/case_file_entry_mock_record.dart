part of '../case_file_entry_page.dart';

extension _CaseFileEntryMockRecord on _CaseFileEntryPageState {
Map<String, String> _createMockRecord() {
    final recordNumber = (_records.length + 1).toString();

    final responsiblePerson = _formValues['Avukat'] ??
        _formValues['Memur'] ??
        _formValues['Üye1 Avukat'] ??
        '';

    final authority = _formValues['Yetkili Mahkeme'] ??
        _formValues['İcra Dairesi'] ??
        _formValues['Yetkili Mahkeme / Geldiği Yer'] ??
        '';

    final subject = _formValues['Konu'] ?? '';
    final description = _formValues['Açıklama'] ?? '';
    final caseType = _dropdownValues['Dava Türü'] ?? _selectedMainType.label;

    final isArbitration =
        _selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType == DavaSubType.arabuluculuk;

    final firstParty = _partySummary(
      _selectedMainType == CaseMainType.icra
          ? 'Alacaklı'
          : _selectedMainType == CaseMainType.bilgiBelge
              ? 'Taraf1'
              : isArbitration
                  ? 'Başvurucu'
                  : 'Davacı',
    );

    final secondParty = _partySummary(
      _selectedMainType == CaseMainType.icra
          ? 'Borçlu'
          : _selectedMainType == CaseMainType.bilgiBelge
              ? 'Taraf2'
              : isArbitration
                  ? 'Karşı Yan'
                  : 'Davalı',
    );

    return {
      'Kayıt No': recordNumber,
      'Grup': _selectedMainType == CaseMainType.gorus
          ? 'Görüş Dosyası'
          : _selectedMainType.label,

      'AltGrup': _selectedMainType == CaseMainType.gorus
          ? ''
          : _selectedMainType == CaseMainType.dava
              ? _selectedDavaSubType.label
              : _selectedMainType.label,

      'Avukat': responsiblePerson,
      'Yetkili Mahkeme': authority,

      'Dosya Esas No':
          '${_formValues['Bidayet Dosya Esas Yıl'] ?? ''}/'
          '${_formValues['Bidayet Dosya Esas No'] ?? ''}',

      'Bidayet Dosya Esas':
          '${_formValues['Bidayet Dosya Esas Yıl'] ?? ''}/'
          '${_formValues['Bidayet Dosya Esas No'] ?? ''}',

      'Bidayet Dosya Esas Yıl':
          _formValues['Bidayet Dosya Esas Yıl'] ?? '',

      'Bidayet Dosya Esas No':
          _formValues['Bidayet Dosya Esas No'] ?? '',

      'Karar No':
          '${_formValues['Bidayet Karar Yıl'] ?? ''}/'
          '${_formValues['Bidayet Karar No'] ?? ''}',

      'Bidayet Karar':
          '${_formValues['Bidayet Karar Yıl'] ?? ''}/'
          '${_formValues['Bidayet Karar No'] ?? ''}',

      'Bidayet Karar Yıl':
          _formValues['Bidayet Karar Yıl'] ?? '',

      'Bidayet Karar No':
          _formValues['Bidayet Karar No'] ?? '',

      'Bidayet Netice':
          _dropdownValues['Bidayet Netice'] ?? '',

      'İlamlı Mı?':
          _dropdownValues['İlamlı Mı?'] ?? '',

      'İstinaf Merci':
          _formValues['İstinaf Merci'] ?? '',

      'İstinaf Bilgileri':
          _formValues['İstinaf Merci'] ?? '',

      'İstinaf Merci Eski Alan':
          _formValues['İstinaf Merci [Eski Alan]'] ?? '',

      'İstinaf Esas No':
          '${_formValues['İstinaf Esas Yıl'] ?? ''}/'
          '${_formValues['İstinaf Esas No'] ?? ''}',

      'İstinaf Esas Yıl':
          _formValues['İstinaf Esas Yıl'] ?? '',

      'İstinaf Esas No Değeri':
          _formValues['İstinaf Esas No'] ?? '',

      'İstinaf Karar No':
          '${_formValues['İstinaf Karar Yıl'] ?? ''}/'
          '${_formValues['İstinaf Karar No'] ?? ''}',

      'İstinaf Karar Yıl':
          _formValues['İstinaf Karar Yıl'] ?? '',

      'İstinaf Karar No Değeri':
          _formValues['İstinaf Karar No'] ?? '',

      'İstinaf Karar Tarihi':
          _dateValues['İstinaf Karar Tarihi'] ?? '',

      'Temyiz Merci':
          _formValues['Temyiz Merci'] ?? '',

      'Temyiz Esas':
          '${_formValues['Temyiz Esas Yıl'] ?? ''}/'
          '${_formValues['Temyiz Esas No'] ?? ''}',

      'Temyiz Esas Yıl':
          _formValues['Temyiz Esas Yıl'] ?? '',

      'Temyiz Esas No':
          _formValues['Temyiz Esas No'] ?? '',

      'Temyiz Karar':
          '${_formValues['Temyiz Karar Yıl'] ?? ''}/'
          '${_formValues['Temyiz Karar No'] ?? ''}',

      'Temyiz Karar Yıl':
          _formValues['Temyiz Karar Yıl'] ?? '',

      'Temyiz Karar No':
          _formValues['Temyiz Karar No'] ?? '',

      'Temyiz Karar Tarihi':
          _dateValues['Temyiz Karar Tarihi'] ?? '',

      'Bakanlık İstinaf Netice':
          _dropdownValues['Bakanlık İstinaf Netice'] ?? '',

      'Karşı Taraf İstinaf Netice':
          _dropdownValues['Karşı Taraf İstinaf Netice'] ?? '',

      'Bakanlık Temyiz Netice':
          _dropdownValues['Bakanlık Temyiz Netice'] ?? '',

      'Karşı Taraf Temyiz Netice':
          _dropdownValues['Karşı Taraf Temyiz Netice'] ?? '',

      'Devir?':
          _dropdownValues['Devir?'] ?? '',

      'Devir Yeri':
          _formValues['Devir Yeri'] ?? '',

      'İrtibat':
          _formValues['İrtibat'] ?? '',

      'İtiraz / Şikayet?':
          _dropdownValues['İtiraz / Şikayet?'] ?? '',

      'İtiraz Sonuç':
          _dropdownValues['İtiraz Sonuç'] ?? '',

      'İlişkili Dava Mahkeme':
          _formValues['İlişkili Dava Mahkeme'] ?? '',

      'Konu': subject,
      'Konu (Seçmeli)': caseType,
      'Dava Türü': caseType,

      'Davacı': firstParty,
      'Davalı': secondParty,
      'Alacaklı': firstParty,
      'Borçlu': secondParty,
      'Taraf1': firstParty,
      'Taraf2': secondParty,
      'Başvurucu': firstParty,
      'Karşı Yan': secondParty,

      'Karar Tarihi':
          _dateValues['Karar Tarihi'] ?? '',

      'Açıklama':
          description,

      'Durumu':
          _dropdownValues['Durumu'] ?? '',

      'Dava Aşama':
          _dropdownValues['Dava Aşama'] ?? '',

      'Talep Maddi Tzm':
          _formValues['Talep Maddi Tazminat'] ?? '',

      'Talep Manevi Tzm':
          _formValues['Talep Manevi Tazminat'] ?? '',

      'Hkm. Maddi Tzm':
          _formValues['Hüküm Maddi Tazminat'] ?? '',

      'Hkm. Manevi Tzm':
          _formValues['Hüküm Manevi Tazminat'] ?? '',

      'Geldiği Şehir':
          _dropdownValues['Şehir'] ?? '',

      'Şehir':
          _dropdownValues['Şehir'] ?? '',

      'Vekalet Ücreti':
          _formValues['Ödenen Vekalet Ücreti'] ?? '',

      'Kalan': '',
      'Ödendi?': '',
      'Vekalet Bilgisi': '',

      'Seri Takip Id':
          _formValues['Seri Takip Id'] ?? '',

      'Karşı Taraf Avukat':
          _formValues['Karşı Taraf Avukat'] ?? '',

      'Id': 'mock-$recordNumber',
      'Kurum':
          _formValues['Kurum'] ?? 'Demo',

      'Dilekçe Tebliğ / Verme':
          _dateValues['Dilekçe Tebliğ / Verme Tarihi'] ?? '',

      'Başlangıç': _selectedMainType == CaseMainType.gorus
          ? _dateValues['Geldiği Tarih'] ?? ''
          : _formValues['Başlangıç'] ?? '',

      'Bitiş': _selectedMainType == CaseMainType.gorus
          ? _dateValues['Son Gün'] ?? ''
          : _formValues['Bitiş'] ?? '',

      'Gel.Evrak No':
          _formValues['Gelen Evrak (Barkod) No'] ?? '',

      'Gid.Evrak No':
          _formValues['Giden Evrak (Barkod) No'] ?? '',

      'Evrak Tarihi':
          _dateValues['Evrak Tarihi'] ?? '',

      'Gelen Evrak No':
          _formValues['Gelen Evrak (Barkod) No'] ?? '',

      'İcra Dairesi':
          _formValues['İcra Dairesi'] ?? '',

      'İcra DosyaNo Yıl':
          _formValues['İcra DosyaNo Yıl'] ?? '',

      'İcra DosyaNo No':
          _formValues['İcra DosyaNo No'] ?? '',

      'Arabuluculuk No':
          _formValues['Arabuluculuk No (Yıl / No)'] ?? '',

      'Kesinleşme?':
          _dropdownValues['Kesinleşme?'] ?? '',

      'Kesinleşme Tarihi':
          _dateValues['Kesinleşme Tarihi'] ?? '',

      'Esası Değişen Dava Mı?':
          _dropdownValues['Esası Değişen Dava Mı?'] ?? '',

      'Esası Değişen Dosya-Mahkeme':
          _formValues['Esası Değişen Dosya-Mahkeme'] ?? '',

      'Ücret Farkı Başlangıç':
          _dateValues['Ücret Farkı Başlangıç'] ?? '',

      'Ücret Farkı Bitiş':
          _dateValues['Ücret Farkı Bitiş'] ?? '',

      'Ücret Farkı Boş Olma Nedeni':
          _dropdownValues['Ücret Farkı Boş Olma Nedeni'] ?? '',

      'İkramiye Başlangıç':
          _dateValues['İkramiye Başlangıç'] ?? '',

      'İkramiye Bitiş':
          _dateValues['İkramiye Bitiş'] ?? '',

      'İkramiye Boş Olma Nedeni':
          _dropdownValues['İkramiye Boş Olma Nedeni'] ?? '',

      'Tediye Başlangıç':
          _dateValues['Tediye Başlangıç'] ?? '',

      'Tediye Bitiş':
          _dateValues['Tediye Bitiş'] ?? '',

      'Tediye Boş Olma Nedeni':
          _dropdownValues['Tediye Boş Olma Nedeni'] ?? '',

      'Ödeme Yapılmasına İlişkin Talep Tarihi':
          _dateValues['Ödeme Yapılmasına İlişkin Talep Tarihi'] ?? '',

      'Talebin Yetkili Birime İntikal Tarihi':
          _dateValues[
                'Talebin Ödeme Yapmaya Yetkili Birime İntikal Tarihi'
              ] ??
              '',

      'İcra Takip Tarihi':
          _dateValues['İcra Takip Tarihi'] ?? '',

      'İcra Emrinin Yetkili Birime İntikal Tarihi':
          _dateValues[
                'İcra Emrinin Ödeme Yapmaya Yetkili Birime İntikal Tarihi'
              ] ??
              '',

      'Ödenen Asıl Borç':
          _formValues['Ödenen Asıl Borç'] ?? '',

      'Ödenen Yargılama Gideri':
          _formValues['Ödenen Yargılama Gideri'] ?? '',

      'Ödenen Vekalet Ücreti':
          _formValues['Ödenen Vekalet Ücreti'] ?? '',

      'Kadro Öncesi Oran':
          _formValues['Kadro Öncesi Oran (%)'] ?? '',

      'Kadro Sonrası Oran':
          _formValues['Kadro Sonrası Oran (%)'] ?? '',

      'Kadro Sonrası İkinci Oran':
          _formValues['Kadro Sonrası İkinci Oran (%)'] ?? '',

      'İstinaf Esas (Yıl / No)':
          '${_formValues['İstinaf Esas Yıl'] ?? ''}/'
          '${_formValues['İstinaf Esas No'] ?? ''}',

      'İstinaf Karar (Yıl / No) - Karar Tarihi':
          '${_formValues['İstinaf Karar Yıl'] ?? ''}/'
          '${_formValues['İstinaf Karar No'] ?? ''}'
          ' - ${_dateValues['İstinaf Karar Tarihi'] ?? ''}',

      'İç TakipId':
          _formValues['İç TakipId'] ?? '',

      'Başvurucu[Ad]':
          _formValues['Başvurucu Ünvan/Ad'] ?? '',

      'Başvurucu[Soyad]':
          _formValues['Başvurucu Soyadı'] ?? '',

      'Başvurucu[Tc]':
          _formValues['Başvurucu TC Kimlik'] ?? '',

      'Karşı Yan[Ad]':
          _formValues['Karşı Yan Ünvan/Ad'] ?? '',

      'Karşı Yan[Soyad]':
          _formValues['Karşı Yan Soyadı'] ?? '',

      'Karşı Yan[Tc]':
          _formValues['Karşı Yan TC Kimlik'] ?? '',

      'Arabuluculuk No (Yıl / No)':
          '${_formValues['Arabuluculuk No Yıl'] ?? ''}/'
          '${_formValues['Arabuluculuk No'] ?? ''}',

      'Büro No (Yıl / No)':
          '${_formValues['Büro No Yıl'] ?? ''}/'
          '${_formValues['Büro No'] ?? ''}',

      'Görüşme Sonucu':
          _dropdownValues['Görüşme Sonucu'] ?? '',

      'Görüşme Sonucu Değeri':
          _formValues['Görüşme Sonucu Değeri'] ?? '',

      'Üye2':
          _formValues['Üye2'] ?? '',

      'Üye3':
          _formValues['Üye3'] ?? '',

      'Arabulucu':
          _formValues['Arabulucu'] ?? '',

      'DavaTürü':
          _dropdownValues['Dava Türü'] ?? '',

      'Birim': _dropdownValues['Birim'] ?? '',

      'Geldiği Yer':
          _formValues['Geldiği Yer'] ?? '',


      'Geldigi Sehir':
          _dropdownValues['Şehir'] ?? '',

      'Geldigi Yer':
          _formValues['Geldiği Yer'] ?? '',

      'Dilekçe Tebliğ / Verme Tarih':
          _dateValues[
                'Dilekçe Tebliğ / Verme Tarihi'
              ] ??
              '',

      'Alacaklı[Ad]':
          _formValues['Alacaklı Ünvan/Ad'] ?? '',

      'Alacaklı[Soyad]':
          _formValues['Alacaklı Soyadı'] ?? '',

      'Alacaklı[Tc]':
          _formValues['Alacaklı TC Kimlik'] ?? '',

      'Borçlu[Ad]':
          _formValues['Borçlu Ünvan/Ad'] ?? '',

      'Borçlu[Soyad]':
          _formValues['Borçlu Soyadı'] ?? '',

      'Borçlu[Tc]':
          _formValues['Borçlu TC Kimlik'] ?? '',

      'Bidayet Dosya Esas (Yıl / No)':
          '${_formValues['Bidayet Dosya Esas Yıl'] ?? ''}/'
          '${_formValues['Bidayet Dosya Esas No'] ?? ''}',

      'Bidayet Karar (Yıl / No)':
          '${_formValues['Bidayet Karar Yıl'] ?? ''}/'
          '${_formValues['Bidayet Karar No'] ?? ''}',

      'Taraf1[Ad]':
          _formValues['Taraf1 Ünvan/Ad'] ?? '',

      'Taraf1[Soyad]':
          _formValues['Taraf1 Soyadı'] ?? '',

      'Taraf1[Tc]':
          _formValues['Taraf1 TC Kimlik'] ?? '',

      'Taraf2[Ad]':
          _formValues['Taraf2 Ünvan/Ad'] ?? '',

      'Taraf2[Soyad]':
          _formValues['Taraf2 Soyadı'] ?? '',

      'Taraf2[Tc]':
          _formValues['Taraf2 TC Kimlik'] ?? '',

      'Davacı[Ad]':
          _formValues['Davacı Ünvan/Ad'] ?? '',

      'Davacı[Soyad]':
          _formValues['Davacı Soyadı'] ?? '',

      'Davacı[Tc]':
          _formValues['Davacı TC Kimlik'] ?? '',

      'Davalı[Ad]':
          _formValues['Davalı Ünvan/Ad'] ??
          _formValues['Davalı Adı'] ??
          '',

      'Davalı[Soyad]':
          _formValues['Davalı Soyadı'] ?? '',

      'Davalı[Tc]':
          _formValues['Davalı TC Kimlik'] ?? '',

      '_mainType': _selectedMainType.name,
      '_davaSubType': _selectedDavaSubType.name,
      };
  }

  String _partySummary(String prefix) {
    final name = _formValues['$prefix Ünvan/Ad'] ??
        _formValues['$prefix Adı'] ??
        _formValues['$prefix Ad'] ??
        '';

    final surname = _formValues['$prefix Soyadı'] ?? '';
    final tc = _formValues['$prefix TC Kimlik'] ?? '';

    final parts = [
      if (name.trim().isNotEmpty) name.trim(),
      if (surname.trim().isNotEmpty) surname.trim(),
      if (tc.trim().isNotEmpty) '($tc)',
    ];

    return parts.join(' ');
  }
}