
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_converter_app/main.dart';

void main() {
  testWidgets('Unit Converter app launches', (WidgetTester tester) async {
    await tester.pumpWidget(const UnitConverterApp());

    expect(find.text('Unit Converter'), findsOneWidget);
    expect(find.text('Length converter'), findsOneWidget);
  });
}
