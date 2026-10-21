import 'package:flutter_test/flutter_test.dart';
import 'package:unit_converter_app/models/conversion_category.dart';
import 'package:unit_converter_app/services/conversion_service.dart';

void main() {
  group('ConversionService', () {
    test('meters to kilometers', () {
      expect(
        ConversionService.convert(
          value: 10,
          category: ConversionCategory.length,
          from: 'Meter',
          to: 'Kilometer',
        ),
        0.01,
      );
    });

    test('kilometers to meters', () {
      expect(
        ConversionService.convert(
          value: 10,
          category: ConversionCategory.length,
          from: 'Kilometer',
          to: 'Meter',
        ),
        10000,
      );
    });

    test('grams to kilograms', () {
      expect(
        ConversionService.convert(
          value: 2500,
          category: ConversionCategory.weight,
          from: 'Gram',
          to: 'Kilogram',
        ),
        2.5,
      );
    });

    test('Celsius to Fahrenheit', () {
      expect(
        ConversionService.convert(
          value: 0,
          category: ConversionCategory.temperature,
          from: 'Celsius',
          to: 'Fahrenheit',
        ),
        32,
      );
    });
  });
}
