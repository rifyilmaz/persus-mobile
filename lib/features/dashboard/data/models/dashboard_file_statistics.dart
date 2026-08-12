class DashboardFileStatistics {
  final String avukat;
  final String tcKimlik;
  final int adliDerdest;
  final int adliObekliyor;
  final int adliHitam;
  final int idariDerdest;
  final int idariObekliyor;
  final int idariHitam;
  final int cezaDerdest;
  final int cezaObekliyor;
  final int cezaHitam;
  final int icraDerdest;
  final int icraObekliyor;
  final int icraHitam;
  final int durusma;

  const DashboardFileStatistics({
    required this.avukat,
    required this.tcKimlik,
    required this.adliDerdest,
    required this.adliObekliyor,
    required this.adliHitam,
    required this.idariDerdest,
    required this.idariObekliyor,
    required this.idariHitam,
    required this.cezaDerdest,
    required this.cezaObekliyor,
    required this.cezaHitam,
    required this.icraDerdest,
    required this.icraObekliyor,
    required this.icraHitam,
    required this.durusma,
  });

  factory DashboardFileStatistics.fromJson(
    Map<String, dynamic> json,
  ) {
    final adi = json['adi']?.toString() ?? '';
    final soyadi =
        json['soyadi']?.toString() ?? '';

    return DashboardFileStatistics(
      avukat: '$adi $soyadi'.trim(),
      tcKimlik:
          json['tckimlikno']?.toString() ?? '-',
      adliDerdest: _readInt(json['adliDerdest']),
      adliObekliyor:
          _readInt(json['adliObekliyor']),
      adliHitam: _readInt(json['adliHitam']),
      idariDerdest:
          _readInt(json['idariDerdest']),
      idariObekliyor:
          _readInt(json['idariObekliyor']),
      idariHitam: _readInt(json['idariHitam']),
      cezaDerdest:
          _readInt(json['cezaDerdest']),
      cezaObekliyor:
          _readInt(json['cezaObekliyor']),
      cezaHitam: _readInt(json['cezaHitam']),
      icraDerdest:
          _readInt(json['icraDerdest']),
      icraObekliyor:
          _readInt(json['icraObekliyor']),
      icraHitam: _readInt(json['icraHitam']),
      durusma: _readInt(json['durusma']),
    );
  }

  int get toplam {
    return adliDerdest +
        adliObekliyor +
        adliHitam +
        idariDerdest +
        idariObekliyor +
        idariHitam +
        cezaDerdest +
        cezaObekliyor +
        cezaHitam +
        icraDerdest +
        icraObekliyor +
        icraHitam;
  }

  static int _readInt(dynamic value) {
    if (value is int) {
      return value;
    }

    if (value is num) {
      return value.toInt();
    }

    return int.tryParse(
          value?.toString() ?? '',
        ) ??
        0;
  }
}