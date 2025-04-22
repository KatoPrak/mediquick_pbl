import 'package:flutter/material.dart';

import '../materi k3 dasar/kuis_screen.dart';
import '../materi k3 dasar/materi_apa_itu_k3.dart';
import '../materi k3 dasar/materi_manajemen_k3.dart';
import '../materi k3 dasar/materi_perkenalan.dart';

class ClassK3DasarDetailScreen extends StatelessWidget {
  final String title;
  final String image;

  const ClassK3DasarDetailScreen({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> cardTitles = [
      "Selamat Datang",
      "Apa Itu K3?",
      "Manajemen K3",
      "Kuis",
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF7FA1C3),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF7FA1C3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/logo.png', height: 70),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                      color: const Color(0xFF88A9D3),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'LI',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Section "Uji kemampuanmu"
            Container(
              margin: const EdgeInsets.only(top: 8),
              color: const Color(0xFF7FA1C3),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset('assets/icons/piala.jpg', width: 36, height: 36),
                  const SizedBox(width: 12),
                  const Text(
                    'Uji kemampuanmu',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Konten
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView.separated(
                  itemCount: cardTitles.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Arahkan ke screen sesuai index
                        Widget? nextScreen;

                        switch (index) {
                          case 0:
                            nextScreen = const MateriPerkenalanScreen();
                            break;
                          case 1:
                            nextScreen = const MateriApaItuK3Screen();
                            break;
                          case 2:
                            nextScreen = const MateriManajemenK3Screen();
                            break;
                          case 3:
                            nextScreen = const ClassQuizScreen();
                            break;
                        }

                        if (nextScreen != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => nextScreen!),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                cardTitles[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(12),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Image.asset(
                                    image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 150,
                                  ),
                                  Container(
                                    color: Colors.black45,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          '15 menit',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
