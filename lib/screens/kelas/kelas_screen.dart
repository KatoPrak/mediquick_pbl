import 'package:flutter/material.dart';
import 'package:mediquick_pbl/widget/kelas/kelas_card.dart';
import 'package:mediquick_pbl/widget/kelas/kelas_search_bar.dart';

class KelasScreen extends StatefulWidget {
  const KelasScreen({super.key});

  @override
  State<KelasScreen> createState() => _KelasScreenState();
}

class _KelasScreenState extends State<KelasScreen> {
  final List<Map<String, String>> allClasses = [
    {"title": "K3 Dasar", "image": "assets/images/k3_dasar.jpeg"},
    {"title": "K3 Proyek", "image": "assets/images/k3_proyek.jpeg"},
    {"title": "K3 Industri", "image": "assets/images/k3_industri.jpeg"},
    {"title": "K3 Khusus", "image": "assets/images/k3_khusus.jpeg"},
  ];

  List<Map<String, String>> filteredClasses = [];

  @override
  void initState() {
    super.initState();
    filteredClasses = allClasses;
  }

  void _onSearchChanged(String query) {
    setState(() {
      filteredClasses =
          allClasses
              .where(
                (item) =>
                    item["title"]!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDED),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              ClassSearchBar(onChanged: _onSearchChanged),
              const SizedBox(height: 24),
              ClassCardGrid(classes: filteredClasses),
            ],
          ),
        ),
      ),
    );
  }
}
