class DashboardMeeting {
  final int kayitId;
  final String avukat;
  final String birim;
  final String geldigiYer;
  final String baslangic;
  final String bitis;
  final String konu;
  final String gelenEvrakNo;
  final String gidenEvrakNo;
  final String aciklama;
  final String durum;

  const DashboardMeeting({
    required this.kayitId,
    required this.avukat,
    required this.birim,
    required this.geldigiYer,
    required this.baslangic,
    required this.bitis,
    required this.konu,
    required this.gelenEvrakNo,
    required this.gidenEvrakNo,
    required this.aciklama,
    required this.durum,
  });

  factory DashboardMeeting.fromJson(
    Map<String, dynamic> json,
  ) {
    final avukatKisi =
        json['avukatKisiId'] is Map<String, dynamic>
            ? json['avukatKisiId'] as Map<String, dynamic>
            : <String, dynamic>{};

    final gorusBirim =
        json['gorusBirimId'] is Map<String, dynamic>
            ? json['gorusBirimId'] as Map<String, dynamic>
            : <String, dynamic>{};

    final yer =
        json['yerId'] is Map<String, dynamic>
            ? json['yerId'] as Map<String, dynamic>
            : <String, dynamic>{};

    final durum =
        json['durumId'] is Map<String, dynamic>
            ? json['durumId'] as Map<String, dynamic>
            : <String, dynamic>{};

    return DashboardMeeting(
      kayitId: _readInt(json['kayitId']),
      avukat: _readAvukat(avukatKisi),
      birim: _readString(gorusBirim['tanimi']),
      geldigiYer: _readString(yer['tanimi']),
      baslangic: _readString(json['geldigiTarih']),
      bitis: _readString(json['bitisTarih']),
      konu: _readString(json['konu']),
      gelenEvrakNo: _readString(
        json['gelenEvrakNo'] ??
            json['gelEvrakNo'],
      ),
      gidenEvrakNo: _readString(
        json['gidenEvrakNo'] ??
            json['gidEvrakNo'],
      ),
      aciklama: _readString(json['aciklama']),
      durum: _readString(durum['tanimi']),
    );
  }

  static String _readAvukat(
    Map<String, dynamic> json,
  ) {
    final ad = _readString(json['adi']);
    final soyad = _readString(json['soyadi']);

    return '$ad $soyad'.trim();
  }

  static String _readString(dynamic value) {
    if (value == null) {
      return '-';
    }

    final text = value.toString().trim();

    if (text.isEmpty) {
      return '-';
    }

    return text;
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