import 'package:flutter/material.dart';

class PertolonganPatahTulang extends StatelessWidget {
  const PertolonganPatahTulang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDED),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EDED),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Pertolongan Pertama Patah Tulang',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/images/pertolongan.png'),
            const SizedBox(height: 16),
            const Text(
              'Penjelasannya:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Poin 1
            buildPoint(
              number: '1.',
              title: 'Tenangkan Korban',
              description:
                  'Pastikan korban tidak panik. Hindari menggerakkan bagian tubuh yang cedera untuk mencegah kerusakan lebih lanjut.',
            ),

            // Poin 2
            buildPoint(
              number: '2.',
              title: 'Stabilkan Tulang dengan Bidai',
              description:
                  'Gunakan benda keras seperti kayu atau majalah yang digulung sebagai bidai. Ikat dengan kain agar tulang tidak bergerak.',
            ),

            // Poin 3
            buildPoint(
              number: '3.',
              title: 'Kompres dengan Es',
              description:
                  'Tempelkan es yang dibungkus kain ke area yang bengkak untuk mengurangi nyeri dan pembengkakan.',
            ),

            // Poin 4
            buildPoint(
              number: '4.',
              title: 'Segera Bawa ke Rumah Sakit',
              description:
                  'Hubungi layanan medis atau bawa korban ke fasilitas kesehatan terdekat.',
            ),

            const SizedBox(height: 16),
            const Text(
              'Pertolongan Pertama Patah Tulang yang Benar!!!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/videopertolongan.png'),
            ),
            const SizedBox(height: 8),
            const Text(
              'Video diatas merupakan penjelasan lebih detail untuk pertolongan pertama pada patah tulang.',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Widget builder untuk tiap poin
  Widget buildPoint({
    required String number,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text: '$title\n',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: description,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
