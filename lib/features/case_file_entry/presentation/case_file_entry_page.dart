import 'package:flutter/material.dart';

enum CaseMainType {
  dava,
  icra,
  bilgiBelge,
  gorus,
  diger,
}

enum DavaSubType {
  adli,
  ceza,
  idari,
  arabuluculuk,
}

enum CaseFormSection {
  temel,
  istinaf,
  odeme,
  seri,
  bosSeri,

  arabuluculukDava,
  iliskiliDosyalar,
  toplantiYeri,
}

enum IcraPageSection {
  icraBilgileri,
  iliskiliDosyalar,
  durusmaBilgileri,
  istinafMahkemeBilgileri,
  geldigiYerSehir,
  vekaletIslemleri,
  bosSeriDosyaOlustur,
}

enum DigerPageSection {
  digerBilgileri,
  iliskiliDosyalar,
  durusmaBilgileri,
  istinafMahkemeBilgileri,
  geldigiYerSehir,
  vekaletIslemleri,
  bosSeriDosyaOlustur,
}

enum BilgiBelgePageSection {
  bilgiBelgeBilgileri,
  iliskiliDosyalar,
  durusmaBilgileri,
  istinafMahkemeBilgileri,
  geldigiYerSehir,
  vekaletIslemleri,
  bosSeriDosyaOlustur,
}

enum DavaPageSection {
  davaBilgileri,
  iliskiliDosyalar,
  durusmaBilgileri,
  istinafMahkemeBilgileri,
  geldigiYerSehir,
  vekaletIslemleri,
  bosSeriDosyaOlustur,
}

extension CaseMainTypeText on CaseMainType {
  String get label {
    switch (this) {
      case CaseMainType.dava:
        return 'Dava';
      case CaseMainType.icra:
        return 'İcra';
      case CaseMainType.bilgiBelge:
        return 'Bilgi-Belge';
      case CaseMainType.gorus:
        return 'Görüş';
      case CaseMainType.diger:
        return 'Diğer';
    }
  }

  String get detailTitle {
    switch (this) {
      case CaseMainType.dava:
        return 'Dava Bilgileri';
      case CaseMainType.icra:
        return 'İcra Bilgileri';
      case CaseMainType.bilgiBelge:
        return 'Bilgi-Belge Bilgileri';
      case CaseMainType.gorus:
        return 'Görüş Bilgileri';
      case CaseMainType.diger:
        return 'Diğer Bilgileri';
    }
  }
}

extension DavaSubTypeText on DavaSubType {
  String get label {
    switch (this) {
      case DavaSubType.adli:
        return 'Adli';
      case DavaSubType.ceza:
        return 'Ceza';
      case DavaSubType.idari:
        return 'İdari';
      case DavaSubType.arabuluculuk:
        return 'Arabuluculuk';
    }
  }
}

extension CaseFormSectionText on CaseFormSection {
  String get label {
    switch (this) {
      case CaseFormSection.temel:
        return 'Temel Bilgiler';
      case CaseFormSection.istinaf:
        return 'İstinaf / Temyiz';
      case CaseFormSection.odeme:
        return 'Ödeme Talep';
      case CaseFormSection.seri:
        return 'Seri Eşitleme';
      case CaseFormSection.bosSeri:
        return 'Boş Seri Dosya Oluştur';
      case CaseFormSection.arabuluculukDava:
        return 'Dava';
      case CaseFormSection.iliskiliDosyalar:
        return 'İlişkili Dosyalar';
      case CaseFormSection.toplantiYeri:
        return 'Toplantı Yeri';
    }
  }

  IconData get icon {
    switch (this) {
      case CaseFormSection.temel:
        return Icons.description_outlined;
      case CaseFormSection.istinaf:
        return Icons.account_balance_outlined;
      case CaseFormSection.odeme:
        return Icons.payments_outlined;
      case CaseFormSection.seri:
        return Icons.sync_outlined;
      case CaseFormSection.bosSeri:
        return Icons.library_add_outlined;
      case CaseFormSection.arabuluculukDava:
        return Icons.balance_outlined;
      case CaseFormSection.iliskiliDosyalar:
        return Icons.folder_copy_outlined;
      case CaseFormSection.toplantiYeri:
        return Icons.meeting_room_outlined;
    }
  }
}

extension IcraPageSectionText on IcraPageSection {
  String get label {
    switch (this) {
      case IcraPageSection.icraBilgileri:
        return 'İcra Bilgileri';
      case IcraPageSection.iliskiliDosyalar:
        return 'İlişkili Dosyalar';
      case IcraPageSection.durusmaBilgileri:
        return 'Duruşma Bilgileri';
      case IcraPageSection.istinafMahkemeBilgileri:
        return 'İstinaf Mahkeme Bilgileri';
      case IcraPageSection.geldigiYerSehir:
        return 'Geldiği Yer-Şehir';
      case IcraPageSection.vekaletIslemleri:
        return 'Vekalet İşlemleri';
      case IcraPageSection.bosSeriDosyaOlustur:
        return 'Boş Seri Dosya Oluştur';
    }
  }

  IconData get icon {
    switch (this) {
      case IcraPageSection.icraBilgileri:
        return Icons.description_outlined;
      case IcraPageSection.iliskiliDosyalar:
        return Icons.folder_copy_outlined;
      case IcraPageSection.durusmaBilgileri:
        return Icons.gavel_outlined;
      case IcraPageSection.istinafMahkemeBilgileri:
        return Icons.account_balance_outlined;
      case IcraPageSection.geldigiYerSehir:
        return Icons.location_on_outlined;
      case IcraPageSection.vekaletIslemleri:
        return Icons.assignment_ind_outlined;
      case IcraPageSection.bosSeriDosyaOlustur:
        return Icons.library_add_outlined;
    }
  }
}

extension DigerPageSectionText on DigerPageSection {
  String get label {
    switch (this) {
      case DigerPageSection.digerBilgileri:
        return 'Diğer Bilgileri';
      case DigerPageSection.iliskiliDosyalar:
        return 'İlişkili Dosyalar';
      case DigerPageSection.durusmaBilgileri:
        return 'Duruşma Bilgileri';
      case DigerPageSection.istinafMahkemeBilgileri:
        return 'İstinaf Mahkeme Bilgileri';
      case DigerPageSection.geldigiYerSehir:
        return 'Geldiği Yer-Şehir';
      case DigerPageSection.vekaletIslemleri:
        return 'Vekalet İşlemleri';
      case DigerPageSection.bosSeriDosyaOlustur:
        return 'Boş Seri Dosya Oluştur';
    }
  }

  IconData get icon {
    switch (this) {
      case DigerPageSection.digerBilgileri:
        return Icons.description_outlined;
      case DigerPageSection.iliskiliDosyalar:
        return Icons.folder_copy_outlined;
      case DigerPageSection.durusmaBilgileri:
        return Icons.gavel_outlined;
      case DigerPageSection.istinafMahkemeBilgileri:
        return Icons.account_balance_outlined;
      case DigerPageSection.geldigiYerSehir:
        return Icons.location_on_outlined;
      case DigerPageSection.vekaletIslemleri:
        return Icons.assignment_ind_outlined;
      case DigerPageSection.bosSeriDosyaOlustur:
        return Icons.library_add_outlined;
    }
  }
}

extension BilgiBelgePageSectionText
    on BilgiBelgePageSection {
  String get label {
    switch (this) {
      case BilgiBelgePageSection.bilgiBelgeBilgileri:
        return 'Bilgi-Belge Bilgileri';
      case BilgiBelgePageSection.iliskiliDosyalar:
        return 'İlişkili Dosyalar';
      case BilgiBelgePageSection.durusmaBilgileri:
        return 'Duruşma Bilgileri';
      case BilgiBelgePageSection.istinafMahkemeBilgileri:
        return 'İstinaf Mahkeme Bilgileri';
      case BilgiBelgePageSection.geldigiYerSehir:
        return 'Geldiği Yer-Şehir';
      case BilgiBelgePageSection.vekaletIslemleri:
        return 'Vekalet İşlemleri';
      case BilgiBelgePageSection.bosSeriDosyaOlustur:
        return 'Boş Seri Dosya Oluştur';
    }
  }

  IconData get icon {
    switch (this) {
      case BilgiBelgePageSection.bilgiBelgeBilgileri:
        return Icons.description_outlined;
      case BilgiBelgePageSection.iliskiliDosyalar:
        return Icons.folder_copy_outlined;
      case BilgiBelgePageSection.durusmaBilgileri:
        return Icons.gavel_outlined;
      case BilgiBelgePageSection.istinafMahkemeBilgileri:
        return Icons.account_balance_outlined;
      case BilgiBelgePageSection.geldigiYerSehir:
        return Icons.location_on_outlined;
      case BilgiBelgePageSection.vekaletIslemleri:
        return Icons.assignment_ind_outlined;
      case BilgiBelgePageSection.bosSeriDosyaOlustur:
        return Icons.library_add_outlined;
    }
  }
}

extension DavaPageSectionText on DavaPageSection {
  String get label {
    switch (this) {
      case DavaPageSection.davaBilgileri:
        return 'Dava Bilgileri';
      case DavaPageSection.iliskiliDosyalar:
        return 'İlişkili Dosyalar';
      case DavaPageSection.durusmaBilgileri:
        return 'Duruşma Bilgileri';
      case DavaPageSection.istinafMahkemeBilgileri:
        return 'İstinaf Mahkeme Bilgileri';
      case DavaPageSection.geldigiYerSehir:
        return 'Geldiği Yer-Şehir';
      case DavaPageSection.vekaletIslemleri:
        return 'Vekalet İşlemleri';
      case DavaPageSection.bosSeriDosyaOlustur:
        return 'Boş Seri Dosya Oluştur';
    }
  }

  IconData get icon {
    switch (this) {
      case DavaPageSection.davaBilgileri:
        return Icons.description_outlined;
      case DavaPageSection.iliskiliDosyalar:
        return Icons.folder_copy_outlined;
      case DavaPageSection.durusmaBilgileri:
        return Icons.gavel_outlined;
      case DavaPageSection.istinafMahkemeBilgileri:
        return Icons.account_balance_outlined;
      case DavaPageSection.geldigiYerSehir:
        return Icons.location_on_outlined;
      case DavaPageSection.vekaletIslemleri:
        return Icons.assignment_ind_outlined;
      case DavaPageSection.bosSeriDosyaOlustur:
        return Icons.library_add_outlined;
    }
  }
}

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

  Widget _buildSelectedForm() {
    if (_selectedMainType == CaseMainType.icra) {
      if (_isEmptyIcraPage) {
        return const SizedBox.shrink();
      }

      if (_isIcraEmptySerialPage) {
        return _EmptySerialFileFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType: _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      }
    }

    if (_selectedMainType ==
        CaseMainType.bilgiBelge) {
      if (_isEmptyBilgiBelgePage) {
        return const SizedBox.shrink();
      }

      if (_isBilgiBelgeEmptySerialPage) {
        return _EmptySerialFileFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType:
              _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      }
    }

    if (_selectedMainType == CaseMainType.gorus) {
      return _GorusFormCard(
        fieldBuilder: _textField,
        dateBuilder: _dateField,
        dropdownBuilder: _dropdownField,
        lookupBuilder: _lookupField,
        nextRecordNumber: (_records.length + 1).toString(),
      );
    }

    if (_selectedMainType == CaseMainType.diger) {
      if (_isEmptyDigerPage) {
        return const SizedBox.shrink();
      }

      if (_isDigerEmptySerialPage) {
        return _EmptySerialFileFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType: _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      }
    }

    if (_selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType !=
            DavaSubType.arabuluculuk) {
      if (_isEmptyDavaPage) {
        return const SizedBox.shrink();
      }

      if (_isDavaEmptySerialPage) {
        return _EmptySerialFileFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType: _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      }
    }

    switch (_selectedSection) {
      case CaseFormSection.temel:
        return _TemelBilgilerFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType: _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      case CaseFormSection.istinaf:
        return _AppealInfoFormCard(
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );
      case CaseFormSection.odeme:
        return _PaymentInfoFormCard(
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
        );
      case CaseFormSection.seri:
        return const _SeriesSyncFormCard();
      case CaseFormSection.bosSeri:
        if (_selectedMainType == CaseMainType.dava &&
            _selectedDavaSubType ==
                DavaSubType.arabuluculuk) {
          return _ArbitrationFormCard(
            emptySerialMode: true,
            fieldBuilder: _textField,
            dateBuilder: _dateField,
            dropdownBuilder: _dropdownField,
            lookupBuilder: _lookupField,
          );
        }

        return _EmptySerialFileFormCard(
          selectedMainType: _selectedMainType,
          selectedDavaSubType: _selectedDavaSubType,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );

      case CaseFormSection.arabuluculukDava:
        return _ArbitrationFormCard(
          emptySerialMode: false,
          fieldBuilder: _textField,
          dateBuilder: _dateField,
          dropdownBuilder: _dropdownField,
          lookupBuilder: _lookupField,
        );

      case CaseFormSection.iliskiliDosyalar:
        return const SizedBox.shrink();

      case CaseFormSection.toplantiYeri:
        return const SizedBox.shrink();
    }
  }


  List<String> _tableColumns() {

    if (_selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType ==
            DavaSubType.arabuluculuk &&
        _selectedSection ==
            CaseFormSection.arabuluculukDava) {
      return const [
        'Kayıt No',
        'İç TakipId',
        'Seri Takip Id',
        'Grup',
        'AltGrup',
        'Avukat',
        'Yetkili Mahkeme',
        'Dosya Esas No',
        'Konu',
        'Başvurucu',
        'Karşı Yan',
        'Karar No',
        'Karar Tarihi',
        'Açıklama',
        'Durumu',
        'Dava Aşama',
        'Görüşme Sonucu',
        'Talep Maddi Tzm',
        'DavaTürü',
        'Şehir',
        'Kurum',
        'Seri Takip Id',
      ];
    }

    if (_selectedMainType == CaseMainType.icra) {
      if (_isIcraEmptySerialPage ||
          _selectedSection == CaseFormSection.bosSeri) {
        return _emptySerialFileTableColumns();
      }

      if (_selectedIcraPage ==
          IcraPageSection.icraBilgileri) {
        return _icraInformationTableColumns();
      }

      return const [];
    }

    if (_selectedMainType ==
        CaseMainType.bilgiBelge) {
      if (_isBilgiBelgeEmptySerialPage ||
          _selectedSection ==
              CaseFormSection.bosSeri) {
        return _emptySerialFileTableColumns();
      }

      if (_selectedBilgiBelgePage ==
          BilgiBelgePageSection.bilgiBelgeBilgileri) {
        return _bilgiBelgeInformationTableColumns();
      }

      return const [];
    }

    if (_selectedMainType == CaseMainType.diger) {
      if (_isDigerEmptySerialPage ||
          _selectedSection == CaseFormSection.bosSeri) {
        return _emptySerialFileTableColumns();
      }

      if (_selectedDigerPage ==
          DigerPageSection.digerBilgileri) {
        return _digerInformationTableColumns();
      }

      return const [];
    }

    if (_selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType != DavaSubType.arabuluculuk) {
      if (_isDavaEmptySerialPage ||
          _selectedSection == CaseFormSection.bosSeri) {
        return _emptySerialFileTableColumns();
      }

      if (_isEmptyDavaPage) {
        return const [];
      }

      if (_selectedDavaPage ==
          DavaPageSection.davaBilgileri) {
        return _davaInformationTableColumns();
      }

      return const [];
    }

    if (_selectedSection == CaseFormSection.seri) {
      return _seriesSyncTableColumns();
    }

    if (_selectedSection == CaseFormSection.bosSeri) {
      return _emptySerialFileTableColumns();
    }

    switch (_selectedMainType) {
      case CaseMainType.icra:
        return _icraInformationTableColumns();
      case CaseMainType.bilgiBelge:
        return _bilgiBelgeInformationTableColumns();

      case CaseMainType.gorus:
        return const [
          'Kayıt No',
          'Avukat',
          'Geldiği Yer',
          'Başlangıç',
          'Bitiş',
          'Konu (Seçmeli)',
          'Konu',
          'Gel.Evrak No',
          'Gid.Evrak No',
          'Açıklama',
          'Durumu',
          'DavaTürü',
          'Grup',
          'AltGrup',
        ];

      case CaseMainType.diger:
        return _digerInformationTableColumns();

      case CaseMainType.dava:
        return _davaInformationTableColumns();
    }
  }

  List<String> _digerInformationTableColumns() {
    return const [
      'Kayıt No',
      'Grup',
      'AltGrup',
      'Avukat',
      'Yetkili Mahkeme',
      'Dosya Esas No',
      'Karar No',
      'İstinaf Esas No',
      'İstinaf Karar No',
      'Temyiz Esas',
      'Temyiz Karar',
      'Konu',
      'Davacı',
      'Davalı',
      'Karar Tarihi',
      'Açıklama',
      'Durumu',
      'Dava Aşama',
      'Bidayet Netice',
      'Talep Maddi Tzm',
      'DavaTürü',
      'Geldigi Sehir',
      'Geldigi Yer',
      'İstinaf Bilgileri',
      'Vekalet Ücreti',
      'Kalan',
      'Ödendi?',
      'Vekalet Bilgisi',
      'Seri Takip Id',
      'Karşı Taraf Avukat',
      'Id',
      'Kurum',
    ];
  }
  List<String> _icraInformationTableColumns() {
    return const [
      'Kayıt No',
      'Grup',
      'AltGrup',
      'Avukat',
      'Yetkili Mahkeme',
      'Dosya Esas No',
      'Karar No',
      'İstinaf Esas No',
      'İstinaf Karar No',
      'Temyiz Esas',
      'Temyiz Karar',
      'Konu',
      'Alacaklı',
      'Borçlu',
      'Karar Tarihi',
      'Açıklama',
      'Durumu',
      'Dava Aşama',
      'Bidayet Netice',
      'Talep Maddi Tzm',
      'DavaTürü',
      'Geldigi Sehir',
      'Geldigi Yer',
      'İstinaf Bilgileri',
      'Vekalet Ücreti',
      'Kalan',
      'Ödendi?',
      'Vekalet Bilgisi',
      'Seri Takip Id',
      'Karşı Taraf Avukat',
      'Id',
      'Kurum',
    ];
  }

  List<String> _bilgiBelgeInformationTableColumns() {
    return const [
      'Kayıt No',
      'Grup',
      'AltGrup',
      'Avukat',
      'Yetkili Mahkeme',
      'Dosya Esas No',
      'Karar No',
      'İstinaf Esas No',
      'İstinaf Karar No',
      'Temyiz Esas',
      'Temyiz Karar',
      'Konu',
      'Taraf1',
      'Taraf2',
      'Karar Tarihi',
      'Açıklama',
      'Durumu',
      'Dava Aşama',
      'Bidayet Netice',
      'Talep Maddi Tzm',
      'DavaTürü',
      'Geldigi Sehir',
      'Geldigi Yer',
      'İstinaf Bilgileri',
      'Vekalet Ücreti',
      'Kalan',
      'Ödendi?',
      'Vekalet Bilgisi',
      'Seri Takip Id',
      'Karşı Taraf Avukat',
      'Id',
      'Kurum',
    ];
  }

  List<String> _seriesSyncTableColumns() {
    return const [
      'Kayıt No',
      'Davacı',
      'Davalı',
      'Karar Tarihi',
      'Açıklama',
      'Durumu',
      'Dava Aşama',
      'Bidayet Netice',
      'Talep Maddi Tzm',
      'Dava Türü',
      'Geldiği Şehir',
      'Geldiği Yer',
      'İstinaf Bilgileri',
      'Vekalet Ücreti',
      'Kalan',
      'Ödendi?',
      'Vekalet Bilgisi',
      'Seri Takip Id',
      'Karşı Taraf Avukat',
      'Id',
      'Kurum',
    ];
  }

  List<String> _davaInformationTableColumns() {
    return const [
      'Kayıt No',
      'Grup',
      'AltGrup',
      'Avukat',
      'Yetkili Mahkeme',
      'Dosya Esas No',
      'Karar No',
      'İstinaf Esas No',
      'İstinaf Karar No',
      'Temyiz Esas',
      'Temyiz Karar',
      'Konu',
      'Davacı',
      'Davalı',
      'Karar Tarihi',
      'Açıklama',
      'Durumu',
      'Dava Aşama',
      'Bidayet Netice',
      'Talep Maddi Tzm',
      'DavaTürü',
      'Geldigi Sehir',
      'Geldigi Yer',
      'İstinaf Bilgileri',
      'Vekalet Ücreti',
      'Kalan',
      'Ödendi?',
      'Vekalet Bilgisi',
      'Seri Takip Id',
      'Karşı Taraf Avukat',
      'Id',
      'Kurum',
    ];
  }

  List<String> _emptySerialFileTableColumns() {
    if (_selectedMainType == CaseMainType.icra) {
      return const [
        'Kayıt No',
        'Dilekçe Tebliğ / Verme Tarih',
        'Alacaklı[Ad]',
        'Alacaklı[Soyad]',
        'Alacaklı[Tc]',
        'Borçlu[Ad]',
        'Borçlu[Soyad]',
        'Borçlu[Tc]',
        'Konu',
        'Açıklama',
        'Bidayet Dosya Esas (Yıl / No)',
        'Bidayet Karar (Yıl / No)',
        'Bidayet Netice',
        'Avukat',
        'Dava Türü',
        'İstinaf Merci',
        'İstinaf Esas (Yıl / No)',
        'İstinaf Karar (Yıl / No) - Karar Tarihi',
        'Seri Takip Id',
        'Id',
      ];
    }

    if (_selectedMainType ==
        CaseMainType.bilgiBelge) {
      return const [
        'Kayıt No',
        'Dilekçe Tebliğ / Verme Tarih',
        'Taraf1[Ad]',
        'Taraf1[Soyad]',
        'Taraf1[Tc]',
        'Taraf2[Ad]',
        'Taraf2[Soyad]',
        'Taraf2[Tc]',
        'Konu',
        'Açıklama',
        'Bidayet Dosya Esas (Yıl / No)',
        'Bidayet Karar (Yıl / No)',
        'Bidayet Netice',
        'Avukat',
        'Dava Türü',
        'İstinaf Merci',
        'İstinaf Esas (Yıl / No)',
        'İstinaf Karar (Yıl / No) - Karar Tarihi',
        'Seri Takip Id',
        'Id',
      ];
    }

    if (_selectedMainType == CaseMainType.diger) {
      return const [
        'Kayıt No',
        'Dilekçe Tebliğ / Verme Tarih',
        'Davacı[Ad]',
        'Davacı[Soyad]',
        'Davacı[Tc]',
        'Davalı[Ad]',
        'Davalı[Soyad]',
        'Davalı[Tc]',
        'Konu',
        'Açıklama',
        'Bidayet Dosya Esas (Yıl / No)',
        'Bidayet Karar (Yıl / No)',
        'Bidayet Netice',
        'Avukat',
        'Dava Türü',
        'İstinaf Merci',
        'İstinaf Esas (Yıl / No)',
        'İstinaf Karar (Yıl / No) - Karar Tarihi',
        'Seri Takip Id',
        'Id',
      ];
    }

    if (_selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType != DavaSubType.arabuluculuk) {
      return const [
        'Kayıt No',
        'Dilekçe Tebliğ / Verme Tarih',
        'Davacı[Ad]',
        'Davacı[Soyad]',
        'Davacı[Tc]',
        'Davalı[Ad]',
        'Davalı[Soyad]',
        'Davalı[Tc]',
        'Konu',
        'Açıklama',
        'Bidayet Dosya Esas (Yıl / No)',
        'Bidayet Karar (Yıl / No)',
        'Bidayet Netice',
        'Avukat',
        'Dava Türü',
        'İstinaf Merci',
        'İstinaf Esas (Yıl / No)',
        'İstinaf Karar (Yıl / No) - Karar Tarihi',
        'Seri Takip Id',
        'Id',
      ];
    }

    if (_selectedMainType == CaseMainType.dava &&
        _selectedDavaSubType ==
            DavaSubType.arabuluculuk) {
      return const [
        'Kayıt No',
        'İç TakipId',
        'Başvurucu[Ad]',
        'Başvurucu[Soyad]',
        'Başvurucu[Tc]',
        'Karşı Yan[Ad]',
        'Karşı Yan[Soyad]',
        'Karşı Yan[Tc]',
        'Konu',
        'Açıklama',
        'Arabuluculuk No (Yıl / No)',
        'Büro No (Yıl / No)',
        'Görüşme Sonucu',
        'Görüşme Sonucu Değeri',
        'Şehir',
        'Kurum',
        'Avukat',
        'Dava Türü',
        'İstinaf Merci',
        'İstinaf Esas (Yıl / No)',
        'İstinaf Karar (Yıl / No) - Karar Tarihi',
        'Üye2',
        'Üye3',
        'Arabulucu',
        'Seri Takip Id',
        'Id',
      ];
    }
    switch (_selectedMainType) {
      case CaseMainType.icra:
        return const [
          'Kayıt No',
          'Dilekçe Tebliğ / Verme',
          'Alacaklı[Ad]',
          'Alacaklı[Soyad]',
          'Alacaklı[Tc]',
          'Borçlu[Ad]',
          'Borçlu[Soyad]',
          'Borçlu[Tc]',
          'Konu',
          'Açıklama',
          'Bidayet Dosya Esas',
          'İcra Dairesi',
          'Talep Maddi Tzm',
          'Talep Manevi Tzm',
          'Hkm. Maddi Tzm',
          'Hkm. Manevi Tzm',
          'Geldiği Yer',
          'Şehir',
          'Seri Takip Id',
          'Başlangıç',
          'Bitiş',
          'Id',
        ];

      case CaseMainType.bilgiBelge:
        return _bilgiBelgeInformationTableColumns();

      case CaseMainType.gorus:
        return const [
          'Kayıt No',
          'Avukat',
          'Geldiği Yer',
          'Başlangıç',
          'Bitiş',
          'Konu',
          'Gel.Evrak No',
          'Gid.Evrak No',
          'Açıklama',
          'Durumu',
          'Dava Türü',
          'Grup',
        ];

      case CaseMainType.dava:
        return _davaInformationTableColumns();
      case CaseMainType.diger:
        return const [
          'Kayıt No',
          'Dilekçe Tebliğ / Verme',
          'Davacı[Ad]',
          'Davacı[Soyad]',
          'Davacı[Tc]',
          'Davalı[Ad]',
          'Davalı[Soyad]',
          'Davalı[Tc]',
          'Konu',
          'Açıklama',
          'Bidayet Dosya Esas',
          'Bidayet Karar',
          'Bidayet Netice',
          'Avukat',
          'Dava Türü',
          'İstinaf Merci',
          'İstinaf Esas',
          'İstinaf Karar',
          'Talep Maddi Tzm',
          'Talep Manevi Tzm',
          'Hkm. Maddi Tzm',
          'Hkm. Manevi Tzm',
          'Geldiği Yer',
          'Şehir',
          'Seri Takip Id',
          'Başlangıç',
          'Bitiş',
          'Id',
        ];
    }
  }

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

        setState(() {
          _dateValues[label] = _formatDate(pickedDate);
        });
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
        setState(() {
          if (value == null || value.isEmpty) {
            _dropdownValues.remove(label);
          } else {
            _dropdownValues[label] = value;
          }
        });
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

            setState(() {
              _formValues[label] = selectedValue;
            });
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

class _HeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final CaseMainType selectedMainType;

  const _HeaderCard({
    required this.title,
    required this.subtitle,
    required this.selectedMainType,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: colorScheme.surface,
              child: const Icon(Icons.folder_copy_outlined),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(subtitle),
                  const SizedBox(height: 8),
                  Text(
                    'Seçili tür: ${selectedMainType.detailTitle}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainTypeSelector extends StatelessWidget {
  final CaseMainType selectedType;
  final ValueChanged<CaseMainType> onChanged;

  const _MainTypeSelector({
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Dosya Türü',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final type in CaseMainType.values)
            ChoiceChip(
              label: Text(type.label),
              selected: selectedType == type,
              onSelected: (_) => onChanged(type),
            ),
        ],
      ),
    );
  }
}

class _DavaSubTypeSelector extends StatelessWidget {
  final DavaSubType selectedType;
  final ValueChanged<DavaSubType> onChanged;

  const _DavaSubTypeSelector({
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Dava Alt Türü',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final type in DavaSubType.values)
            ChoiceChip(
              label: Text(type.label),
              selected: selectedType == type,
              onSelected: (_) => onChanged(type),
            ),
        ],
      ),
    );
  }
}

class _IcraPageSelector extends StatelessWidget {
  final IcraPageSection selectedPage;
  final ValueChanged<IcraPageSection> onChanged;

  const _IcraPageSelector({
    required this.selectedPage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'İcra Sayfası',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final page in IcraPageSection.values)
            ChoiceChip(
              avatar: Icon(
                page.icon,
                size: 18,
              ),
              label: Text(page.label),
              selected: selectedPage == page,
              onSelected: (_) => onChanged(page),
            ),
        ],
      ),
    );
  }
}

class _DavaPageSelector extends StatelessWidget {
  final DavaPageSection selectedPage;
  final ValueChanged<DavaPageSection> onChanged;

  const _DavaPageSelector({
    required this.selectedPage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Dava Sayfası',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final page in DavaPageSection.values)
            ChoiceChip(
              avatar: Icon(
                page.icon,
                size: 18,
              ),
              label: Text(page.label),
              selected: selectedPage == page,
              onSelected: (_) => onChanged(page),
            ),
        ],
      ),
    );
  }
}

class _DigerPageSelector extends StatelessWidget {
  final DigerPageSection selectedPage;
  final ValueChanged<DigerPageSection> onChanged;

  const _DigerPageSelector({
    required this.selectedPage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Diğer Sayfası',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final page in DigerPageSection.values)
            ChoiceChip(
              avatar: Icon(
                page.icon,
                size: 18,
              ),
              label: Text(page.label),
              selected: selectedPage == page,
              onSelected: (_) => onChanged(page),
            ),
        ],
      ),
    );
  }
}

class _BilgiBelgePageSelector extends StatelessWidget {
  final BilgiBelgePageSection selectedPage;
  final ValueChanged<BilgiBelgePageSection> onChanged;

  const _BilgiBelgePageSelector({
    required this.selectedPage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Bilgi-Belge Sayfası',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final page
              in BilgiBelgePageSection.values)
            ChoiceChip(
              avatar: Icon(
                page.icon,
                size: 18,
              ),
              label: Text(page.label),
              selected: selectedPage == page,
              onSelected: (_) => onChanged(page),
            ),
        ],
      ),
    );
  }
}

class _SectionSelector extends StatelessWidget {
  final CaseFormSection selectedSection;
  final List<CaseFormSection> sections;
  final ValueChanged<CaseFormSection> onChanged;

  const _SectionSelector({
    required this.selectedSection,
    required this.sections,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SelectorCard(
      title: 'Form Bölümü',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final section in sections)
            ChoiceChip(
              avatar: Icon(section.icon, size: 18),
              label: Text(section.label),
              selected: selectedSection == section,
              onSelected: (_) => onChanged(section),
            ),
        ],
      ),
    );
  }
}

class _SelectorCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SelectorCard({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

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

class _SingleCheckboxTile extends StatefulWidget {
  final String title;

  const _SingleCheckboxTile({
    required this.title,
  });

  @override
  State<_SingleCheckboxTile> createState() => _SingleCheckboxTileState();
}

class _SingleCheckboxTileState extends State<_SingleCheckboxTile> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      value: _checked,
      title: Text(widget.title),
      onChanged: (value) {
        setState(() {
          _checked = value ?? false;
        });
      },
    );
  }
}

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

class _SeriesSyncFormCard extends StatefulWidget {
  const _SeriesSyncFormCard();

  @override
  State<_SeriesSyncFormCard> createState() =>
      _SeriesSyncFormCardState();
}

class _SeriesSyncFormCardState
    extends State<_SeriesSyncFormCard> {
  static const List<String> _decisionOptions = [
    'Bidayet Karar Tarihi Bilgisi Eşitle',
    'Kesinleşme / Tarih Bilgisi Eşitle',
    'Bidayet Karar Tebliğ Tarihi Bilgisi Eşitle',
    'Dava Aşama Bilgisi Eşitle',
    'Karar Kesinleşme Aşaması Bilgisi Eşitle',
    'Bidayet Netice Bilgisi Eşitle',
  ];

  static const List<String> _partyOptions = [
    'Karşı Taraf Avukat Bilgisi Eşitle',
    'Alacak Dönem Bilgisini Eşitle',
    'Talep Takip Bilgilerini Eşitle',
    'Geldiği Yer Bilgisini Eşitle',
    'Talep Maddi Tazminat Bilgisi Eşitle',
    'Hüküm Maddi Tazminat Bilgisi Eşitle',
  ];

  static const List<String> _appealOptions = [
    'İstinaf Merci Bilgisi Eşitle',
    'İstinaf Karar Tarihi Bilgisi Eşitle',
    'Temyiz Merci Bilgisi Eşitle',
    'Temyiz Merci Tarihi Bilgisi Eşitle',
    'Bakanlık İstinaf Netice Bilgisi Eşitle',
    'Bakanlık Temyiz Netice Bilgisi Eşitle',
  ];

  final Set<String> _selectedValues = <String>{};

  List<String> get _allOptions => [
        ..._decisionOptions,
        ..._partyOptions,
        ..._appealOptions,
      ];

  void _changeSelection(
    String value,
    bool selected,
  ) {
    setState(() {
      if (selected) {
        _selectedValues.add(value);
      } else {
        _selectedValues.remove(value);
      }
    });
  }

  void _selectAll() {
    setState(() {
      _selectedValues
        ..clear()
        ..addAll(_allOptions);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tüm bilgiler seçildi.'),
      ),
    );
  }

  void _clearSelection() {
    if (_selectedValues.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kaldırılacak bir seçim bulunmuyor.'),
        ),
      );
      return;
    }

    setState(() {
      _selectedValues.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bütün seçimler kaldırıldı.'),
      ),
    );
  }

  void _synchronizeSelectedValues() {
    if (_selectedValues.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Eşitleme işlemi için en az bir bilgi seçmelisiniz.',
          ),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${_selectedValues.length} bilgi, serinin tüm '
          'dosyalarıyla mock olarak eşitlendi.',
        ),
      ),
    );
  }

  Widget _buildControlledCheckList(
    List<String> values,
  ) {
    return Column(
      children: [
        for (final value in values)
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            controlAffinity:
                ListTileControlAffinity.leading,
            value: _selectedValues.contains(value),
            title: Text(value),
            onChanged: (checked) {
              _changeSelection(
                value,
                checked ?? false,
              );
            },
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = _selectedValues.length;
    final allSelected =
        selectedCount == _allOptions.length;

    return Column(
      children: [
        _FormCard(
          title: 'Seri Dosyalarıyla Bilgi Eşitleme',
          subtitle:
              'Seri dosyalar arasında aktarılacak bilgilerin '
              'seçileceği mock ekran.',
          children: const [
            Text(
              'Bilgiler konu başlıklarına ayrılmıştır. '
              'İhtiyaç duyduğunuz grubu açarak eşitlenecek '
              'alanları seçebilirsiniz.',
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Karar ve Kesinleşme Bilgileri',
          subtitle:
              'Karar tarihi, kesinleşme ve bidayet netice alanları',
          icon: Icons.fact_check_outlined,
          children: [
            _buildControlledCheckList(
              _decisionOptions,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Taraf, Dönem ve Talep Bilgileri',
          subtitle:
              'Karşı taraf, dönem, takip ve tazminat alanları',
          icon: Icons.groups_outlined,
          children: [
            _buildControlledCheckList(
              _partyOptions,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'İstinaf ve Temyiz Bilgileri',
          subtitle:
              'İstinaf, temyiz ve bakanlık netice alanları',
          icon: Icons.account_balance_outlined,
          children: [
            _buildControlledCheckList(
              _appealOptions,
            ),
          ],
        ),

        const SizedBox(height: 12),

        _ExpandableFormCard(
          title: 'Toplu İşlem',
          subtitle: selectedCount == 0
              ? 'Henüz bilgi seçilmedi'
              : '$selectedCount bilgi seçildi',
          icon: Icons.done_all_outlined,
          children: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed:
                        allSelected ? null : _selectAll,
                    icon: const Icon(
                      Icons.select_all_outlined,
                    ),
                    label: const Text(
                      'Tümünü Seç',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: selectedCount == 0
                        ? null
                        : _clearSelection,
                    icon: const Icon(
                      Icons.deselect_outlined,
                    ),
                    label: const Text(
                      'Seçimi Kaldır',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: selectedCount == 0
                    ? null
                    : _synchronizeSelectedValues,
                icon: const Icon(
                  Icons.done_all_outlined,
                ),
                label: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Text(
                    'Seçili Bilgileri Serinin Tüm '
                    'Dosyalarına Eşitle',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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

class _FormCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;

  const _FormCard({
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
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
            const SizedBox(height: 6),
            Text(subtitle),
            const SizedBox(height: 18),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _ExpandableFormCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Widget> children;

  const _ExpandableFormCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        maintainState: true,
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(subtitle),
        childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: children,
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _CheckList extends StatefulWidget {
  final List<String> values;

  const _CheckList({
    required this.values,
  });

  @override
  State<_CheckList> createState() => _CheckListState();
}

class _CheckListState extends State<_CheckList> {
  late final Set<String> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = <String>{};
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final value in widget.values)
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            value: _selectedValues.contains(value),
            title: Text(value),
            onChanged: (checked) {
              setState(() {
                if (checked ?? false) {
                  _selectedValues.add(value);
                } else {
                  _selectedValues.remove(value);
                }
              });
            },
          ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final VoidCallback onClear;
  final VoidCallback onSearch;
  final VoidCallback onSave;

  const _ActionButtons({
    required this.onClear,
    required this.onSearch,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onClear,
            icon: const Icon(Icons.cleaning_services_outlined),
            label: const Text('Temizle'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: onSearch,
            icon: const Icon(Icons.search_outlined),
            label: const Text('Ara'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: FilledButton.icon(
            onPressed: onSave,
            icon: const Icon(Icons.save_outlined),
            label: const Text('Kaydet'),
          ),
        ),
      ],
    );
  }
}

class _ResultTableCard extends StatelessWidget {
  final List<String> columns;
  final List<Map<String, String>> records;

  const _ResultTableCard({
    required this.columns,
    required this.records,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kayıt Listesi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  for (final column in columns)
                    DataColumn(
                      label: Text(
                        column,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
                rows: [
                  for (final record in records)
                    DataRow(
                      cells: [
                        for (final column in columns)
                          DataCell(
                            Text(record[column] ?? ''),
                          ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            if (records.isEmpty)
              Text(
                'Kayıt yok.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              )
            else
              Text(
                '${records.length} kayıt listeleniyor.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            const SizedBox(height: 12),
            const Divider(),
            Text(
              'Toplam kayıt: ${records.length}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

  const List<String> _adliCaseTypeOptions = [
  '5510',
  '696 Khk Ücret Farkı',
  'Alacak',
  'Delil Tespiti',
  'Depo Kararı',
  'Disiplin Cezası',
  'Fiili El Atma',
  'İhtiyati Tedbir',
  'İhya',
  'İşçilik Alacağı',
  'İşe İade',
  'İş Kazası',
  'İşyeri Değiştirilmesi Kararının İptali',
  'İtirazın İptali',
  'Kamulaştırmasız El Atma',
  'Kira - Ecrimisil',
  'Kira Uyarlama',
  'Kişi Borcu',
  'Menfi Tespit',
  'Meslek Kodunun Düzeltilmesi',
  'Mirasın Reddi',
  'Nüfus Düzeltme',
  'Rücu',
  'Rücu - Açılmamış',
  'Rücu - Davalı Olunan',
  'Rücu - Hizmet Kusuru',
  'Sıra Cetveline İtiraz',
  'Staj',
  'Sulh Hukuk',
  'Tahliye',
  'Tapu İptali Ve Tescil',
  'Tazminat',
  'Tereke',
  'Tespit Davası',
  'TİS',
  'Vasiyetnamenin Tenfizi',
  'Asliye Ticaret',
];

const List<String> _caseStageOptions = [
  'Basit Yargılama',
  'Başka İle Devir',
  'Bilirkişi',
  'Dilekçeler Teatisi',
  'Duruşma',
  'Feragat',
  'İstinaf',
  'İtiraz',
  'Karar Çıktı',
  'Kesinleşti',
  'Temyiz',
  'Üst İncelemede',
];

const List<String> _statusOptions = [
  'Derdest',
  'Hitam',
  'İcrada',
  'İptal Edildi',
  'Ödeme Bekliyor',
];

const List<String> _finalizationStageOptions = [
  'İlk Derece',
  'İstinaf',
  'Temyiz',
];

const List<String> _bidayetResultOptions = [
  'Beraat',
  'Ceza Verilmesine Yer Olmadığı',
  'Dava Kabul',
  'Davanın Açılmamış Sayılması',
  'Dava - Talep Red',
  'Düşme',
  'Feragat',
  'Görevsizlik Kararı',
  'Güvenlik Tedbirlerine Hükmolunması',
  'Hükmün Açıklamasının Geri Bırakılması',
  'İcra Dosyası - İnfaz',
  'İcra Şikayet Kabul',
  'İcra Şikayet Red',
  'İcra Takibinin Devamı',
  'İcra Takibinin Durması',
  'İhtiyati Haciz Kararı',
  'İhtiyati Tedbir Kararı',
  'İstinaf Kabul, Bidayete Gönderme Kararı',
  'İstinaf Kabul, Bidayet Kararını Kaldırıp Davayı Kabul Kararı',
  'İstinaf Kabul, Bidayet Kararını Kaldırıp Davayı Red Kararı',
  'İstinaf Red',
  'Kamu Davasının Durmasına',
  'Karar Verilmesine Yer Olmadığı',
  'Kısmi Kabul',
  'Kovuşturmaya Yer Olmadığı',
  'Mahkumiyet',
  'Tehiri İcra Kararı',
  'Temyizen Bozma',
  'Temyizen Onama',
  'Y. D İtiraz',
  'Y. D İtiraz Kabul',
  'Y. D İtiraz Red',
  'Yetkisizlik Kararı',
  'Yürütmenin Durdurulması Kararı',
];

const List<String> _courtOptions = [
  'Ankara 1. Asliye Hukuk Mahkemesi',
  'Ankara 2. Asliye Hukuk Mahkemesi',
  'Ankara İş Mahkemesi',
  'İstanbul Asliye Ticaret Mahkemesi',
  'İzmir İdare Mahkemesi',
  'Sulh Hukuk Mahkemesi',
];

const List<String> _executionOfficeOptions = [
  'Ankara 1. İcra Dairesi',
  'Ankara 2. İcra Dairesi',
  'İstanbul İcra Dairesi',
  'İzmir İcra Dairesi',
];

const List<String> _lawyerOptions = [
  'Demo Avukat - 1001',
  'Rıfat Yılmaz - 1002',
  'Beyza Demo - 1003',
];

const List<String> _legalResultOptions = [
  'Beraat',
  'Ceza Verilmesine Yer Olmadığı',
  'Dava Kabul',
  'Davanın Açılmamış Sayılması',
  'Dava - Talep Red',
  'Düşme',
  'Feragat',
  'Görevsizlik Kararı',
  'Güvenlik Tedbirlerine Hükmolunması',
  'Hükmün Açıklamasının Geri Bırakılması',
  'İcra Dosyası - İnfaz',
  'İcra Şikayet Kabul',
  'İcra Şikayet Red',
  'İcra Takibinin Devamı',
  'İcra Takibinin Durması',
  'İhtiyati Haciz Kararı',
  'İhtiyati Tedbir Kararı',
  'İstinaf Kabul, Bidayete Gönderme Kararı',
  'İstinaf Kabul, Bidayet Kararını Kaldırıp Davayı Kabul Kararı',
  'İstinaf Kabul, Bidayet Kararını Kaldırıp Davayı Red Kararı',
  'İstinaf Red',
  'Kamu Davasının Durmasına',
  'Karar Verilmesine Yer Olmadığı',
  'Kısmi Kabul',
  'Kovuşturmaya Yer Olmadığı',
  'Mahkumiyet',
  'Tehiri İcra Kararı',
  'Temyizen Bozma',
  'Temyizen Onama',
  'Y. D İtiraz',
  'Y. D İtiraz Kabul',
  'Y. D İtiraz Red',
  'Yetkisizlik Kararı',
  'Yürütmenin Durdurulması Kararı',
];

const List<String> _emptyReasonOptions = [
  'Bilirkişide',
  'Duruşmada',
  'Talep Yok',
];

const List<String> _turkeyCityOptions = [
  'Adana',
  'Adıyaman',
  'Afyonkarahisar',
  'Ağrı',
  'Aksaray',
  'Amasya',
  'Ankara',
  'Antalya',
  'Ardahan',
  'Artvin',
  'Aydın',
  'Balıkesir',
  'Bartın',
  'Batman',
  'Bayburt',
  'Bilecik',
  'Bingöl',
  'Bitlis',
  'Bolu',
  'Burdur',
  'Bursa',
  'Çanakkale',
  'Çankırı',
  'Çorum',
  'Denizli',
  'Diyarbakır',
  'Düzce',
  'Edirne',
  'Elazığ',
  'Erzincan',
  'Erzurum',
  'Eskişehir',
  'Gaziantep',
  'Giresun',
  'Gümüşhane',
  'Hakkari',
  'Hatay',
  'Iğdır',
  'Isparta',
  'İstanbul',
  'İzmir',
  'Kahramanmaraş',
  'Karabük',
  'Karaman',
  'Kars',
  'Kastamonu',
  'Kayseri',
  'Kırıkkale',
  'Kırklareli',
  'Kırşehir',
  'Kilis',
  'Kocaeli',
  'Konya',
  'Kütahya',
  'Malatya',
  'Manisa',
  'Mardin',
  'Mersin',
  'Muğla',
  'Muş',
  'Nevşehir',
  'Niğde',
  'Ordu',
  'Osmaniye',
  'Rize',
  'Sakarya',
  'Samsun',
  'Şanlıurfa',
  'Siirt',
  'Sinop',
  'Sivas',
  'Şırnak',
  'Tekirdağ',
  'Tokat',
  'Trabzon',
  'Tunceli',
  'Uşak',
  'Van',
  'Yalova',
  'Yozgat',
  'Zonguldak',
];

const List<String> _serialTrackingOptions = [
  '10001',
  '10002',
  '10003',
];

const List<String> _arbitrationCaseTypeOptions = [
  '696 Khk Ücret Farkı',
  'Diğer',
  'İşçilik Alacak',
  'İşe İade',
  'Staj',
  'Ticari',
];

const List<String> _mediationResultOptions = [
  'Görüşme Sonucu Anlaşma',
  'Görüşme Sonucu Anlaşamama',
  'Görüşme Yapılmadan Anlaşamama',
  'Yetkisizlik',
];

const List<String> _mediationMemberOptions = [
  'Komisyon Üyesi 1',
  'Komisyon Üyesi 2',
  'Komisyon Üyesi 3',
];

const List<String> _arbitratorOptions = [
  'Demo Arabulucu - 1001',
  'Demo Arabulucu - 1002',
  'Demo Arabulucu - 1003',
];

const List<String> _executionCaseTypeOptions = [
  'Alacaklı İcra',
  'Borçlu İcra',
  'İflas Takibi',
  'Mehil Vesikası İşlemleri',
  'Rücu İcra',
  'Şikayet Davası',
  'Talimat',
];

const List<String> _informationDocumentCaseTypeOptions = [
  '89/1',
  'Bakanlık Aracılık İşlemi',
  'Bilgi-belge',
  'Duruşma',
  'Haciz Müzekkeresi',
  'İç Kontrol',
  'İhtarname',
  'Kamu Zararı',
  'Muhakemat Aracılık İşlemi',
  'Müzekkere',
  'Sehven',
  'Staj Ücret Talebi',
  'Tazminat Talebi',
  'Tebligat Aracılık',
  'Tehiri İcra Alınması Talebi',
];

const List<String> _gorusCaseTypeOptions = [
  'Görüş',
];

const List<String> _gorusUnitOptions = [
  'Acil Sağlık Hizmetleri Başkanlığı',
  'Destek Hizmetleri Başkanlığı',
  'Diğer',
  'Halk Sağlığı Hizmetleri Başkanlığı',
  'Hastaneler',
  'Personel Hizmetleri Başkanlığı',
  'Sağlık Hizmetleri Başkanlığı',
];

const List<String> _gorusStatusOptions = [
  'Derdest',
  'Hitam',
  'İcrada',
  'İptal Edildi',
  'Ödeme Bekliyor',
];

const List<String> _otherCaseTypeOptions = [
  'Boş',
];
