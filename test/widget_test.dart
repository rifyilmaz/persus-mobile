import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persus_mobile/main.dart';

void main() {
  testWidgets(
    'Persus giriş ekranında insan doğrulaması gösterilir',
    (WidgetTester tester) async {
      await tester.pumpWidget(const PersusApp());

      expect(find.text('PERSUS'), findsOneWidget);
      expect(find.text('Bağlan'), findsOneWidget);
      expect(find.text('Ben robot değilim'), findsOneWidget);
      expect(find.text('Doğrulama Kodu'), findsNothing);
      expect(find.byType(Checkbox), findsOneWidget);
    },
  );

  testWidgets(
    'İnsan doğrulaması yapılmadan giriş engellenir',
    (WidgetTester tester) async {
      await tester.pumpWidget(const PersusApp());

      await tester.tap(find.text('Bağlan'));
      await tester.pump();

      expect(
        find.text(
          'Devam etmek için “Ben robot değilim” alanını işaretleyin.',
        ),
        findsOneWidget,
      );
    },
  );
}