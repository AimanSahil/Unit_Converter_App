import 'package:flutter/material.dart';

class UnitDropdownCard extends StatelessWidget {
  final String value;
  final List<String> units;
  final ValueChanged<String> onChanged;

  const UnitDropdownCard({
    super.key,
    required this.value,
    required this.units,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE4EAF5)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF203A68).withOpacity(.025),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF74829B), size: 24),
          borderRadius: BorderRadius.circular(14),
          items: units
              .map((unit) => DropdownMenuItem(
                    value: unit,
                    child: Text(unit,
                        style: const TextStyle(
                          color: Color(0xFF2D3D59),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        )),
                  ))
              .toList(),
          onChanged: (next) {
            if (next != null) onChanged(next);
          },
        ),
      ),
    );
  }
}
