import 'package:flutter_test/flutter_test.dart';

import 'package:persus_mobile/features/security/data/models/security_menu.dart';

void main() {
  test(
    'SecurityMenu hiyerarşik childs alanını doğru parse eder',
    () {
      final json = <String, dynamic>{
        'adi': 'menu.hukuk',
        'baslik': 'Hukuk Bürosu İşlemleri',
        'aciklama': 'Hukuk bürosu işlemleri',
        'id': 1,
        'childs': [
          {
            'adi': 'menu.dava.sorgu',
            'baslik': 'Dava Sorgu',
            'aciklama': '',
            'id': 2,
            'childs': [],
          },
          {
            'adi': 'menu.dava.dosya',
            'baslik': 'Dava Dosya',
            'aciklama': '',
            'id': 3,
            'childs': [],
          },
          {
            'adi': 'menu.durusma.listesi',
            'baslik': 'Duruşma Listesi',
            'aciklama': '',
            'id': 4,
            'childs': [],
          },
        ],
      };

      final menu =
          SecurityMenu.fromJson(json);

      expect(
        menu.baslik,
        'Hukuk Bürosu İşlemleri',
      );

      expect(
        menu.hasChildren,
        isTrue,
      );

      expect(
        menu.childs.length,
        3,
      );

      expect(
        menu.childs[0].baslik,
        'Dava Sorgu',
      );

      expect(
        menu.childs[1].baslik,
        'Dava Dosya',
      );

      expect(
        menu.childs[2].baslik,
        'Duruşma Listesi',
      );
    },
  );

  test(
    'SecurityMenu kurumId map değilse uygulama çökmez',
    () {
      final json = <String, dynamic>{
        'adi': 'menu.test',
        'baslik': 'Test',
        'aciklama': '',
        'kurumId': 10,
        'childs': [],
      };

      final menu =
          SecurityMenu.fromJson(json);

      expect(
        menu.kurumId,
        isNull,
      );
    },
  );
}