class KurumInfo {
  final int? id;
  final String tanimi;

  const KurumInfo({
    this.id,
    this.tanimi = '',
  });

  factory KurumInfo.fromJson(
    Map<String, dynamic> json,
  ) {
    return KurumInfo(
      id: _parseInt(json['id']),
      tanimi: json['tanimi']?.toString() ?? '',
    );
  }

  static int? _parseInt(dynamic value) {
    if (value == null) {
      return null;
    }

    if (value is int) {
      return value;
    }

    return int.tryParse(value.toString());
  }
}

class SecurityMenu {
  final String adi;
  final int? yetkigurubuId;
  final int? turuId;
  final int? yetkilendirilebilir;
  final String baslik;
  final String aciklama;
  final String? url;
  final String? urlParametre;
  final int? urlMultiple;
  final int? sira;
  final int? seviye;
  final String? image;
  final int? parentId;
  final int? id;

  final KurumInfo? kurumId;

  final int? ekleyenId;
  final String? eklenmeTarihi;
  final int? guncelleyenId;
  final String? gunlenmeTarihi;
  final int? version;

  final List<SecurityMenu> childs;

  const SecurityMenu({
    required this.adi,
    required this.baslik,
    required this.aciklama,
    required this.childs,
    this.yetkigurubuId,
    this.turuId,
    this.yetkilendirilebilir,
    this.url,
    this.urlParametre,
    this.urlMultiple,
    this.sira,
    this.seviye,
    this.image,
    this.parentId,
    this.id,
    this.kurumId,
    this.ekleyenId,
    this.eklenmeTarihi,
    this.guncelleyenId,
    this.gunlenmeTarihi,
    this.version,
  });

  factory SecurityMenu.fromJson(
    Map<String, dynamic> json,
  ) {
    final rawChildren = json['childs'];

    final children = rawChildren is List
        ? rawChildren
            .whereType<Map<String, dynamic>>()
            .map(SecurityMenu.fromJson)
            .toList()
        : <SecurityMenu>[];

    final rawKurum = json['kurumId'];

    KurumInfo? kurum;

    if (rawKurum is Map<String, dynamic>) {
      kurum = KurumInfo.fromJson(rawKurum);
    }

    return SecurityMenu(
      adi: json['adi']?.toString() ?? '',
      yetkigurubuId: _parseInt(
        json['yetkigurubuId'],
      ),
      turuId: _parseInt(
        json['turuId'],
      ),
      yetkilendirilebilir: _parseInt(
        json['yetkilendirilebilir'],
      ),
      baslik: json['baslik']?.toString() ?? '',
      aciklama: json['aciklama']?.toString() ?? '',
      url: _parseNullableString(
        json['url'],
      ),
      urlParametre: _parseNullableString(
        json['urlParametre'],
      ),
      urlMultiple: _parseInt(
        json['urlMultiple'],
      ),
      sira: _parseInt(
        json['sira'],
      ),
      seviye: _parseInt(
        json['seviye'],
      ),
      image: _parseNullableString(
        json['image'],
      ),
      parentId: _parseInt(
        json['parentId'],
      ),
      id: _parseInt(
        json['id'],
      ),
      kurumId: kurum,
      ekleyenId: _parseInt(
        json['ekleyenId'],
      ),
      eklenmeTarihi: _parseNullableString(
        json['eklenmeTarihi'],
      ),
      guncelleyenId: _parseInt(
        json['guncelleyenId'],
      ),
      gunlenmeTarihi: _parseNullableString(
        json['gunlenmeTarihi'],
      ),
      version: _parseInt(
        json['version'],
      ),
      childs: children,
    );
  }

  bool get hasChildren => childs.isNotEmpty;

  String get displayTitle {
    if (baslik.trim().isNotEmpty) {
      return baslik.trim();
    }

    if (adi.trim().isNotEmpty) {
      return adi.trim();
    }

    return 'Adsız Menü';
  }

  static String? _parseNullableString(
    dynamic value,
  ) {
    if (value == null) {
      return null;
    }

    final result = value.toString().trim();

    return result.isEmpty ? null : result;
  }

  static int? _parseInt(
    dynamic value,
  ) {
    if (value == null) {
      return null;
    }

    if (value is int) {
      return value;
    }

    return int.tryParse(
      value.toString(),
    );
  }

  @override
  String toString() {
    return 'SecurityMenu('
        'adi: $adi, '
        'baslik: $baslik, '
        'id: $id, '
        'childs: ${childs.length}'
        ')';
  }
}