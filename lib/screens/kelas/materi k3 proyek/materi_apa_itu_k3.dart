import 'package:flutter/material.dart';
import 'materi_manajemen_k3.dart';

class MateriApaItuK3Screen extends StatelessWidget {
  const MateriApaItuK3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apa Itu K3 Proyek')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(
              child: Text(
                'Penjelasan lengkap tentang Apa itu K3 Proyek...',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MateriManajemenK3Screen(),
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
