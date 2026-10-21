# Unit Converter App

A clean, responsive Flutter unit converter using Provider state management.

## Features
- Length, weight, and temperature conversions
- Input field with live results
- From/To unit dropdowns
- Swap units
- Input validation and friendly empty state
- Conversion logic separated from UI
- Material 3 styling with a blue/indigo visual theme

## Run
1. Install Flutter.
2. Extract this ZIP and open the `unit_converter_app` folder.
3. Run:
   ```bash
   flutter pub get
   flutter run
   ```

## Structure
- `lib/main.dart` — app entry point and theme
- `lib/models/conversion_category.dart` — conversion categories and units
- `lib/services/conversion_service.dart` — conversion calculations
- `lib/providers/converter_provider.dart` — Provider state
- `lib/screens/converter_screen.dart` — converter UI
- `lib/widgets/` — reusable interface components
