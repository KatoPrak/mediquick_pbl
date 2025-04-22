import 'package:flutter/material.dart';
import 'package:mediquick_pbl/screens/detail/pertolongan/demam.dart';
import 'package:mediquick_pbl/screens/detail/pertolongan/patah_tulang.dart';
import 'package:mediquick_pbl/screens/detail/pertolongan/luka.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"title": "Demam", "image": "assets/images/demam.jpg"},
      {"title": "Patah Tulang", "image": "assets/images/patahtulang.jpg"},
      {"title": "Luka", "image": "assets/images/luka.jpg"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: sectionTitle("Pertolongan Pertama"),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 170,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final item = categories[index];
              return GestureDetector(
                onTap: () {
                  _navigateToDetail(context, item["title"]!);
                },
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    color: const Color(0xFF88A9D3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          item["image"]!,
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          item["title"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _navigateToDetail(BuildContext context, String title) {
    Widget page;

    switch (title.toLowerCase()) {
      case "demam":
        page = const PertolonganDemam();
        break;
      case "patah tulang":
        page = const PertolonganPatahTulang();
        break;
      case "luka":
        page = const PertolonganLuka();
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Halaman untuk '$title' belum tersedia.")),
        );
        return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          children: const [
            Text("Lihat semua", style: TextStyle(color: Colors.black)),
            SizedBox(width: 4),
            Icon(Icons.arrow_forward, size: 18, color: Colors.black),
          ],
        ),
      ],
    );
  }
}
