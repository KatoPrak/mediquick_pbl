import 'package:flutter/material.dart';
import 'package:mediquick_pbl/screens/detail/artikel/artikel_cpr.dart';
import 'package:mediquick_pbl/screens/detail/artikel/artikel_patah_tulang.dart';

class ArticleSection extends StatelessWidget {
  const ArticleSection({super.key});

  @override
  Widget build(BuildContext context) {
    final articles = [
      {
        "title": "Artikel CPR",
        "location": "Batam",
        "date": "25 Februari 2024",
        "image": "assets/images/artikel1.jpg",
      },
      {
        "title": "Artikel Patah Tulang",
        "location": "Batam",
        "date": "25 Februari 2024",
        "image": "assets/images/artikel2.jpg",
      },
      {
        "title": "Artikel 3",
        "location": "Batam",
        "date": "25 Februari 2024",
        "image": "assets/images/artikel1.jpg",
      },
    ];

    // ambil lebar layar
    final screenWidth = MediaQuery.of(context).size.width;
    const horizontalPadding = 10.0;
    const cardSpacing = 14.0;

    // total padding di kiri dan kanan
    final cardWidth = screenWidth - (2 * horizontalPadding);

    return Container(
      width: double.infinity,
      color: const Color(0xFFE2DAD6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: sectionTitle("Artikel"),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200, // tinggi card
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              itemCount: articles.length,
              separatorBuilder: (_, __) => const SizedBox(width: cardSpacing),
              itemBuilder: (context, index) {
                final article = articles[index];
                return InkWell(
                  onTap: () {
                    Widget detailPage;

                    switch (article["title"]) {
                      case "Artikel CPR":
                        detailPage = ArticleCPR(
                          title: article["title"]!,
                          image: article["image"]!,
                          location: article["location"]!,
                          date: article["date"]!,
                        );
                        break;
                      case "Artikel Patah Tulang":
                        detailPage = ArticlePatahTulang(
                          title: article["title"]!,
                          image: article["image"]!,
                          location: article["location"]!,
                          date: article["date"]!,
                        );
                        break;
                      case "Artikel 3":
                      default:
                        detailPage = ArticlePatahTulang(
                          title: article["title"]!,
                          image: article["image"]!,
                          location: article["location"]!,
                          date: article["date"]!,
                        );
                        break;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => detailPage),
                    );
                  },

                  child: Container(
                    width: cardWidth * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.asset(
                            article["image"]!,
                            width: cardWidth * 0.8,
                            height: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article["title"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                "${article["location"]}, ${article["date"]}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
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
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        Row(
          children: const [
            Text("Lihat semua", style: TextStyle(color: Colors.black)),
            SizedBox(width: 4),
            Icon(Icons.arrow_forward, size: 16, color: Colors.black),
          ],
        ),
      ],
    );
  }
}
