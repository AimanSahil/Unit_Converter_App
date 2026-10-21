import '../models/conversion_category.dart';

class ConversionService {
  static double convert({
    required double value,
    required ConversionCategory category,
    required String from,
    required String to,
  }) {
    if (from == to) return value;

    switch (category) {
      case ConversionCategory.length:
        if (from == 'Meter' && to == 'Kilometer') return value / 1000;
        if (from == 'Kilometer' && to == 'Meter') return value * 1000;
      case ConversionCategory.weight:
        if (from == 'Gram' && to == 'Kilogram') return value / 1000;
        if (from == 'Kilogram' && to == 'Gram') return value * 1000;
      case ConversionCategory.temperature:
        if (from == 'Celsius' && to == 'Fahrenheit') return (value * 9 / 5) + 32;
        if (from == 'Fahrenheit' && to == 'Celsius') return (value - 32) * 5 / 9;
    }
    return value;
  }

  static String format(double value) {
    if (!value.isFinite) return '—';
    if (value == 0) return '0';
    if (value.abs() >= 1e9 || (value.abs() < 0.000001 && value != 0)) {
      return value.toStringAsExponential(4);
    }
    return value.toStringAsFixed(6).replaceFirst(RegExp(r'\.?0+$'), '');
  }
}
