part of '../case_file_entry_page.dart';

extension _CaseFileEntryTableColumns on _CaseFileEntryPageState {
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
}

