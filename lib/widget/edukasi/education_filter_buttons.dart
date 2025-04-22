import 'package:flutter/material.dart';

class EducationFilterButtons extends StatefulWidget {
  final ValueChanged<String>? onFilterChanged;

  const EducationFilterButtons({super.key, this.onFilterChanged});

  @override
  State<EducationFilterButtons> createState() => _EducationFilterButtonsState();
}

class _EducationFilterButtonsState extends State<EducationFilterButtons> {
  String? _selectedFilter;
  final List<String> _filterOptions = [
    'Semua',
    'Pertolongan Pertama',
    'Artikel',
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 180, // Lebar disesuaikan
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedFilter,
            hint: const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Pilih',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF88A9D3)),
            iconSize: 24,
            elevation: 2,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            borderRadius: BorderRadius.circular(10),
            isExpanded: true,
            items:
                _filterOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(value),
                    ),
                  );
                }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedFilter = newValue;
              });
              widget.onFilterChanged?.call(newValue ?? '');
            },
          ),
        ),
      ),
    );
  }
}
