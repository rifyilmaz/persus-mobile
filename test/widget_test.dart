import 'package:flutter_test/flutter_test.dart';
import 'package:persus_mobile/main.dart';

void main() {
  testWidgets('Persus login ekranı açılır', (WidgetTester tester) async {
    await tester.pumpWidget(const PersusApp());

    expect(find.text('PERSUS'), findsOneWidget);
    expect(find.text('Bağlan'), findsOneWidget);
  });
}