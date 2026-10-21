enum ConversionCategory { length, weight, temperature }

extension ConversionCategoryInfo on ConversionCategory {
  String get label {
    switch (this) {
      case ConversionCategory.length:
        return 'Length';
      case ConversionCategory.weight:
        return 'Weight';
      case ConversionCategory.temperature:
        return 'Temp';
    }
  }

  String get title {
    switch (this) {
      case ConversionCategory.length:
        return 'Length converter';
      case ConversionCategory.weight:
        return 'Weight converter';
      case ConversionCategory.temperature:
        return 'Temperature converter';
    }
  }

  String get subtitle {
    switch (this) {
      case ConversionCategory.length:
        return 'Convert distances in a moment';
      case ConversionCategory.weight:
        return 'Make every measurement count';
      case ConversionCategory.temperature:
        return 'Switch between temperature scales';
    }
  }

  List<String> get units {
    switch (this) {
      case ConversionCategory.length:
        return ['Meter', 'Kilometer'];
      case ConversionCategory.weight:
        return ['Gram', 'Kilogram'];
      case ConversionCategory.temperature:
        return ['Celsius', 'Fahrenheit'];
    }
  }

  String get symbol {
    switch (this) {
      case ConversionCategory.length:
        return '↔';
      case ConversionCategory.weight:
        return '⚖';
      case ConversionCategory.temperature:
        return '°';
    }
  }
}
