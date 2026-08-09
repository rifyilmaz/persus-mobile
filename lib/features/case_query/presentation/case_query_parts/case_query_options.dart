part of '../case_query_page.dart';

const List<String> _queryResultColumns = [
  'Avukat',
  'Kayıt No',
  'Davacı',
  'Davacı[Tc]',
  'Davalı',
  'Davalı[Tc]',
  'DavaTürü',
  'Mahkeme',
  'Dosya Esas No',
  'Karar No',
  'İstinaf Esas No',
  'İstinaf Karar No',
  'Temyiz Esas',
  'Temyiz Karar',
  'Dava Aşama',
  'Sonucu',
  'Durumu',
  'Talep Maddi Tzm',
  'Talep Manevi Tzm',
  'Hkm. Maddi Tzm',
  'Hkm. Manevi Tzm',
  'Açıklama',
  'Konu',
  'Geldigi Sehir',
  'Geldigi Yer',
  'Son Durusma Tarih',
  'İcra dairesi',
  'İcra DosyaNo',
  'İstinaf Merci',
  'İrtibat',
  'Olay Tarihi',
  'İç Dosya TakipId',
  'Grup',
  'AltGrup',
  'Arabulucu Ades',
  'Arabulucu Adı',
  'Arabulucu Irtibat',
  'Üye2',
  'Üye3',
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

const List<Map<String, String>> _mockRecords = [];

const List<String> _groupOptions = [
  'Bilgi - Belge',
  'Dava',
  'Diğer',
  'Görüş',
  'İcra',
];

const List<String> _subGroupOptions = [
  'Adli',
  'Ceza',
  'İdari',
  'Arabuluculuk',
];

const List<String> _caseTypeOptions = [
  '1219 A Muhalefet',
  '1262 Ye Aykırılık',
  '5510',
  '696 Khk Ücret Farkı',
  '696 S.khk',
  '89/1',
  'Alacak',
  'Alacaklı İcra',
  'Asliye Ceza',
  'Atama',
  'Bakanlık Aracılık İşlemi',
  'Beyaz Kod',
  'Bilgi - Belge İstemi',
  'Borçlu İcra',
  'Boş',
  'Delil Tespiti',
  'Duruşma',
  'İşçilik Alacağı',
  'İşe İade',
  'Kamulaştırmasız El Atma',
  'Rücu',
  'Staj',
  'Tazminat',
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

const List<String> _yesNoOptions = [
  'Evet',
  'Hayır',
];

const List<String> _courtOptions = [
  'Ankara 1. Asliye Hukuk Mahkemesi',
  'Ankara 2. Asliye Hukuk Mahkemesi',
  'Ankara 10. Asliye Hukuk Mahkemesi',
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

const List<String> _cityOptions = [
  'Adana',
  'Ankara',
  'Antalya',
  'Bursa',
  'İstanbul',
  'İzmir',
  'Konya',
  'Samsun',
];

const List<String> _arbitratorOptions = [
  'Demo Arabulucu - 1001',
  'Demo Arabulucu - 1002',
  'Demo Arabulucu - 1003',
];