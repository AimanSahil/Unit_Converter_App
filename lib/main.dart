import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/converter_provider.dart';
import 'screens/converter_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ConverterProvider(),
      child: const UnitConverterApp(),
    ),
  );
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF356AE6);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          brightness: Brightness.light,
          surface: const Color(0xFFF7F9FE),
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9FE),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F9FE),
          foregroundColor: Color(0xFF17233D),
          elevation: 0,
          centerTitle: false,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFE4EAF5)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Color(0xFFE4EAF5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: primary, width: 1.6),
          ),
        ),
      ),
      home: const ConverterScreen(),
    );
  }
}
