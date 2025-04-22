import 'package:flutter/material.dart';
import 'kuis_screen.dart';

class MateriManajemenK3Screen extends StatelessWidget {
  const MateriManajemenK3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manajemen K3 Industri')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Expanded(
              child: Text(
                'Ini adalah materi terakhir sebelum kuis...',
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
                        builder: (_) => const ClassQuizScreen(),
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
