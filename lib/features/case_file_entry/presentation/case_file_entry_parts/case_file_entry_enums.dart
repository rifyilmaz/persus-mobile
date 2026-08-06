part of '../case_file_entry_page.dart';

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