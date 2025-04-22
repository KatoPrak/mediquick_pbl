import 'package:flutter/material.dart';
import 'package:mediquick_pbl/screens/detail/artikel/artikel_patah_tulang.dart';
import 'package:mediquick_pbl/screens/detail/pertolongan/patah_tulang.dart';

class EducationCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final bool isArticle;

  const EducationCard({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.isArticle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Arahkan ke halaman detail berdasarkan jenis dan judul
        if (isArticle && title.toLowerCase() == "patah tulang") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => ArticlePatahTulang(
                    title: title,
                    image: image,
                    location: _getRandomCity(),
                    date: date,
                  ),
            ),
          );
        } else if (!isArticle && title.toLowerCase() == "patah tulang") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PertolonganPatahTulang(),
            ),
          );
        } else {
          // Jika belum ada halaman detail
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Detail untuk '$title' belum tersedia."),
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: Card(
        color: const Color(0xFF88A9D3),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getRandomCity() {
    final cities = ['Jakarta', 'Bandung', 'Surabaya', 'Yogyakarta'];
    cities.shuffle();
    return cities.first;
  }
}
