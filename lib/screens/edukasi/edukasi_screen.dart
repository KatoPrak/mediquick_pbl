import 'package:flutter/material.dart';
import 'package:mediquick_pbl/widget/edukasi/education_card.dart';
import 'package:mediquick_pbl/widget/edukasi/education_filter_buttons.dart';
import 'package:mediquick_pbl/widget/edukasi/education_search_bar.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  String _selectedFilter = '';
  String _searchQuery = '';

  void _onFilterChanged(String value) {
    setState(() {
      _selectedFilter = value;
    });
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchQuery = value.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    final firstAidTitles = [
      'Demam',
      'Patah Tulang',
      'Luka Bakar',
      'Serangan Jantung',
    ];
    final firstAidImages = [
      'demam.jpg',
      'patahtulang.jpg',
      'luka.jpg',
      'demam.jpg',
    ];

    final articleTitles = [
      'Pola Hidup Sehat',
      'Patah Tulang',
      'Diet Seimbang',
      'Mental Health',
    ];
    final articleImages = [
      'artikel1.jpg',
      'artikel2.jpg',
      'artikel1.jpg',
      'artikel2.jpg',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5EDED),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              EducationSearchBar(onChanged: _onSearchChanged),
              const SizedBox(height: 16),
              EducationFilterButtons(onFilterChanged: _onFilterChanged),
              const SizedBox(height: 24),

              if (_selectedFilter == '' ||
                  _selectedFilter == 'Pertolongan Pertama') ...[
                _buildSectionTitle('Pertolongan Pertama'),
                _buildCardGrid(
                  context,
                  titles: firstAidTitles,
                  images: firstAidImages,
                  isArticle: false,
                ),
              ],
              const SizedBox(height: 24),
              if (_selectedFilter == '' || _selectedFilter == 'Artikel') ...[
                _buildSectionTitle('Artikel Kesehatan'),
                _buildCardGrid(
                  context,
                  titles: articleTitles,
                  images: articleImages,
                  isArticle: true,
                ),
              ],
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }

  Widget _buildCardGrid(
    BuildContext context, {
    required List<String> titles,
    required List<String> images,
    required bool isArticle,
  }) {
    final filteredTitles = <String>[];
    final filteredImages = <String>[];

    for (int i = 0; i < titles.length; i++) {
      if (titles[i].toLowerCase().contains(_searchQuery)) {
        filteredTitles.add(titles[i]);
        filteredImages.add(images[i]);
      }
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: filteredTitles.length,
      itemBuilder: (context, index) {
        return EducationCard(
          image: 'assets/images/${filteredImages[index]}',
          title: filteredTitles[index],
          date: '${_getRandomCity()}, ${_getRandomDate()}',
          isArticle: isArticle,
        );
      },
    );
  }

  String _getRandomDate() {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun'];
    final randomDay = 1 + DateTime.now().day % 28;
    final randomMonth = months[DateTime.now().month % months.length];
    return '$randomDay $randomMonth 2024';
  }

  String _getRandomCity() {
    const cities = ['Batam', 'Jakarta', 'Bandung', 'Surabaya', 'Medan'];
    return cities[DateTime.now().second % cities.length];
  }
}
