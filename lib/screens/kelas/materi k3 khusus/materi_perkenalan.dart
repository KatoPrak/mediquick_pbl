import 'package:flutter/material.dart';
import 'materi_apa_itu_k3.dart';

class MateriPerkenalanScreen extends StatelessWidget {
  const MateriPerkenalanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perkenalan')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(
              child: Text(
                'Ini adalah materi perkenalan tentang K3 Khusus...',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(), // Kosong karena halaman pertama
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MateriApaItuK3Screen(),
                      ),
                    );
                  },
                  child: const Text('Lanjutkan'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
