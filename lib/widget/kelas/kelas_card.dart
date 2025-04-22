import 'package:flutter/material.dart';
import 'package:mediquick_pbl/screens/kelas/detail/kelas_k3_dasar_screen.dart';
import 'package:mediquick_pbl/screens/kelas/detail/kelas_k3_proyek_screen.dart';
import 'package:mediquick_pbl/screens/kelas/detail/kelas_k3_industri_screen.dart';
import 'package:mediquick_pbl/screens/kelas/detail/kelas_k3_khusus_screen.dart';

class ClassCardGrid extends StatelessWidget {
  final List<Map<String, String>> classes;

  const ClassCardGrid({super.key, required this.classes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: classes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 12,
        childAspectRatio: 1.8,
      ),
      itemBuilder: (context, index) {
        final item = classes[index];
        final title = item['title']!;
        final image = item['image']!;

        return GestureDetector(
          onTap: () {
            Widget? detailPage;

            switch (title) {
              case "K3 Dasar":
                detailPage = ClassK3DasarDetailScreen(
                  title: title,
                  image: image,
                );
                break;
              case "K3 Proyek":
                detailPage = ClassK3ProyekDetailScreen(
                  title: title,
                  image: image,
                );
                break;
              case "K3 Industri":
                detailPage = ClassK3IndustriDetailScreen(
                  title: title,
                  image: image,
                );
                break;
              case "K3 Khusus":
                detailPage = ClassK3KhususDetailScreen(
                  title: title,
                  image: image,
                );
                break;
              default:
                detailPage = null;
            }

            if (detailPage != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => detailPage!),
              );
            } else {
              showDialog(
                context: context,
                builder:
                    (_) => AlertDialog(
                      title: const Text("Halaman Belum Tersedia"),
                      content: Text("Detail untuk '$title' belum tersedia."),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
              );
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF88A9D3),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.asset(image, height: 150, fit: BoxFit.cover),
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
