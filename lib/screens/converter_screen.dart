import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../models/conversion_category.dart';
import '../providers/converter_provider.dart';
import '../services/conversion_service.dart';
import '../widgets/conversion_result_card.dart';
import '../widgets/unit_dropdown_card.dart';

class ConverterScreen extends StatelessWidget {
  const ConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final converter = context.watch<ConverterProvider>();
    final category = converter.category;
    final value = converter.numericValue;
    final result = converter.result;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF4C83F5), Color(0xFF2858CE)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF356AE6).withOpacity(.22),
                                  blurRadius: 18,
                                  offset: const Offset(0, 7),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.swap_horiz_rounded,
                                color: Colors.white, size: 28),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Unit Converter',
                                    style: TextStyle(
                                      color: Color(0xFF17233D),
                                      fontSize: 23,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -.6,
                                    )),
                                SizedBox(height: 3),
                                Text('Simple conversions, instantly',
                                    style: TextStyle(
                                      color: Color(0xFF7B879D),
                                      fontSize: 13,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: const Color(0xFFE7ECF5)),
                            ),
                            child: const Icon(Icons.calculate_outlined,
                                color: Color(0xFF356AE6)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBF0FA),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: ConversionCategory.values.map((item) {
                            final selected = item == category;
                            final icon = switch (item) {
                              ConversionCategory.length => Icons.straighten_rounded,
                              ConversionCategory.weight => Icons.scale_rounded,
                              ConversionCategory.temperature => Icons.thermostat_rounded,
                            };
                            return Expanded(
                              child: GestureDetector(
                                onTap: () => context.read<ConverterProvider>().setCategory(item),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 180),
                                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 4),
                                  decoration: BoxDecoration(
                                    color: selected ? Colors.white : Colors.transparent,
                                    borderRadius: BorderRadius.circular(13),
                                    boxShadow: selected
                                        ? [
                                            BoxShadow(
                                              color: const Color(0xFF243D72).withOpacity(.08),
                                              blurRadius: 10,
                                              offset: const Offset(0, 3),
                                            )
                                          ]
                                        : null,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(icon,
                                          size: 17,
                                          color: selected
                                              ? const Color(0xFF356AE6)
                                              : const Color(0xFF8793A8)),
                                      const SizedBox(width: 6),
                                      Flexible(
                                        child: Text(item.label,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                                              color: selected
                                                  ? const Color(0xFF24395F)
                                                  : const Color(0xFF7D899D),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 26),
                      Text(category.title,
                          style: const TextStyle(
                            color: Color(0xFF17233D),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -.4,
                          )),
                      const SizedBox(height: 5),
                      Text(category.subtitle,
                          style: const TextStyle(color: Color(0xFF8490A5), fontSize: 13)),
                      const SizedBox(height: 22),
                      const _FieldLabel(label: 'ENTER VALUE'),
                      const SizedBox(height: 9),
                      TextFormField(
                        key: ValueKey(category),
                        initialValue: converter.input,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[-0-9.,]')),
                        ],
                        onChanged: context.read<ConverterProvider>().setInput,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF253653),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type a number',
                          suffixText: _unitShort(converter.from),
                          suffixStyle: const TextStyle(
                            color: Color(0xFF8793A8),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (converter.input.isNotEmpty && value == null) ...[
                        const SizedBox(height: 7),
                        const Text('Enter a valid number to convert.',
                            style: TextStyle(color: Color(0xFFD94D5C), fontSize: 12)),
                      ],
                      const SizedBox(height: 24),
                      const _FieldLabel(label: 'FROM'),
                      const SizedBox(height: 9),
                      UnitDropdownCard(
                        value: converter.from,
                        units: category.units,
                        onChanged: (unit) => context.read<ConverterProvider>().setFrom(unit),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Material(
                          color: const Color(0xFF356AE6),
                          borderRadius: BorderRadius.circular(18),
                          elevation: 5,
                          shadowColor: const Color(0xFF356AE6).withOpacity(.25),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(18),
                            onTap: () => context.read<ConverterProvider>().swap(),
                            child: const SizedBox(
                              width: 54,
                              height: 54,
                              child: Icon(Icons.swap_vert_rounded,
                                  color: Colors.white, size: 27),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const _FieldLabel(label: 'TO'),
                      const SizedBox(height: 9),
                      UnitDropdownCard(
                        value: converter.to,
                        units: category.units,
                        onChanged: (unit) => context.read<ConverterProvider>().setTo(unit),
                      ),
                      const SizedBox(height: 25),
                      ConversionResultCard(
                        from: converter.from,
                        to: converter.to,
                        result: result == null ? null : ConversionService.format(result),
                        input: value == null ? null : ConversionService.format(value),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          const Icon(Icons.bolt_rounded, color: Color(0xFF356AE6), size: 18),
                          const SizedBox(width: 7),
                          const Expanded(
                            child: Text('Your result updates as you type.',
                                style: TextStyle(color: Color(0xFF8793A8), fontSize: 12)),
                          ),
                          Text('PROVIDER',
                              style: TextStyle(
                                fontSize: 10,
                                letterSpacing: 1.1,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF356AE6).withOpacity(.8),
                              )),
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static String _unitShort(String unit) {
    switch (unit) {
      case 'Meter': return 'm';
      case 'Kilometer': return 'km';
      case 'Gram': return 'g';
      case 'Kilogram': return 'kg';
      case 'Celsius': return '°C';
      case 'Fahrenheit': return '°F';
      default: return '';
    }
  }
}

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) => Text(
        label,
        style: const TextStyle(
          color: Color(0xFF8995A8),
          fontSize: 11,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.25,
        ),
      );
}
