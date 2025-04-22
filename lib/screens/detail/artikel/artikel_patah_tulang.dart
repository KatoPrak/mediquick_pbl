import 'package:flutter/material.dart';

class ArticlePatahTulang extends StatelessWidget {
  final String title;
  final String image;
  final String location;
  final String date;

  const ArticlePatahTulang({
    super.key,
    required this.title,
    required this.image,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F3F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F3F1),
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Text(
              "$location, $date",
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),
            Text(
              "Patah Tulang",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              "Patah tulang terjadi ketika salah satu tulang atau lebih retak atau pecah menjadi beberapa bagian. Hal ini bisa terjadi akibat cedera olahraga, kecelakaan, atau tindak kekerasan. Untuk mencegah kondisi patah tulang makin parah, pertolongan pertama perlu dilakukan.\nPatah tulang biasanya tidak mengancam nyawa, tetapi membutuhkan perawatan medis segera dan penanganan awal yang benar agar kondisinya tidak makin parah.\nOleh karena itu, penting untuk memahami cara memberikan pertolongan pertama pada korban patah tulang agar Anda tahu tindakan apa saja yang perlu dilakukan dan jangan dilakukan.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            const Text(
              "Ciri-Ciri Patah Tulang",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const BulletList(
              items: [
                "Rasa sakit di area cedera dan makin memburuk saat digerakkan",
                "Area yang cedera tampak kebiruan, bengkak, atau berubah bentuk",
                "Mati rasa di area yang cedera",
                "Tulang tampak menembus kulit",
                "Perdarahan hebat di lokasi cedera",
              ],
              fontSize: 16,
            ),
            const SizedBox(height: 12),
            const Text(
              "Cara Memberikan Pertolongan Pertama pada Patah Tulang",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Ketika ada orang di sekitar Anda dicurigai mengalami patah tulang, janganlah menggerakkan atau memindahkan orang tersebut ke tempat lain, kecuali untuk menghindari cedera lebih lanjut.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> items;
  final double fontSize;

  const BulletList({super.key, required this.items, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          items.map((text) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    child: Text(
                      '•',
                      style: TextStyle(fontSize: fontSize + 14, height: 0.5),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(fontSize: fontSize, height: 1.5),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
