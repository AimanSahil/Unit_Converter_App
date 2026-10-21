import 'package:flutter/material.dart';

import '../models/conversion_category.dart';
import '../services/conversion_service.dart';

class ConverterProvider extends ChangeNotifier {
  ConversionCategory _category = ConversionCategory.length;
  String _from = 'Meter';
  String _to = 'Kilometer';
  String _input = '25';

  ConversionCategory get category => _category;
  String get from => _from;
  String get to => _to;
  String get input => _input;

  double? get numericValue {
    final cleaned = _input.trim().replaceAll(',', '.');
    if (cleaned.isEmpty) return null;
    return double.tryParse(cleaned);
  }

  double? get result {
    final value = numericValue;
    if (value == null) return null;
    return ConversionService.convert(
      value: value,
      category: _category,
      from: _from,
      to: _to,
    );
  }

  void setInput(String value) {
    _input = value;
    notifyListeners();
  }

  void setCategory(ConversionCategory category) {
    if (_category == category) return;
    _category = category;
    _from = category.units.first;
    _to = category.units.last;
    notifyListeners();
  }

  void setFrom(String unit) {
    _from = unit;
    notifyListeners();
  }

  void setTo(String unit) {
    _to = unit;
    notifyListeners();
  }

  void swap() {
    final previous = _from;
    _from = _to;
    _to = previous;
    notifyListeners();
  }
}
