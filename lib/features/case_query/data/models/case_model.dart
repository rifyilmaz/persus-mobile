class CaseModel {
  final int kayitId;
  final String davaTuru;
  final String durum;
  final String yetkiliMahkeme;
  final String avukatAdSoyad;
  final String? konu;
  final String? davali;
  final String? davaciAdSoyad;
  final String davaGrup;
  final String davaTarihi;

  const CaseModel({
    required this.kayitId,
    required this.davaTuru,
    required this.durum,
    required this.yetkiliMahkeme,
    required this.avukatAdSoyad,
    this.konu,
    this.davali,
    this.davaciAdSoyad,
    required this.davaGrup,
    required this.davaTarihi,
  });

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    final davaTuru = json['davaTuruId'] as Map<String, dynamic>?;
    final durum = json['durumId'] as Map<String, dynamic>?;
    final mahkeme = json['yetkiliMahkemeId'] as Map<String, dynamic>?;
    final avukat = json['avukatKisiId'] as Map<String, dynamic>?;
    final davaGrup = json['davaGrupId'] as Map<String, dynamic>?;

    final avukatAd = avukat?['adi']?.toString() ?? '';
    final avukatSoyad = avukat?['soyadi']?.toString() ?? '';

    return CaseModel(
      kayitId: json['kayitId'] as int? ?? 0,
      davaTuru: davaTuru?['tanimi']?.toString() ?? '-',
      durum: durum?['tanimi']?.toString() ?? '-',
      yetkiliMahkeme: mahkeme?['tanimi']?.toString() ?? '-',
      avukatAdSoyad: '$avukatAd $avukatSoyad'.trim(),
      konu: json['konu']?.toString(),
      davali: json['davali']?.toString(),
      davaciAdSoyad: json['davaciAdSoyad']?.toString(),
      davaGrup: davaGrup?['tanimi']?.toString() ?? '-',
      davaTarihi: json['davaTarihi']?.toString() ?? '-',
    );
  }
}