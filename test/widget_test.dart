import 'package:flutter_test/flutter_test.dart';
import 'package:film_fan/main.dart';

void main() {
  testWidgets('Film Fan App loads without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const FilmFanApp());

    expect(find.text('Now Playing'), findsOneWidget);
  });
}