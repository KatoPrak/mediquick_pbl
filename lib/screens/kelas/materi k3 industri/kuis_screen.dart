import 'package:flutter/material.dart';
import 'package:mediquick_pbl/screens/kelas/kelas_screen.dart';

class ClassQuizScreen extends StatelessWidget {
  const ClassQuizScreen({super.key});

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Selamat!"),
            content: const Text("Anda telah menyelesaikan kelas."),
            actions: [
              TextButton(
                onPressed: () {
                  // Aksi untuk melihat sertifikat
                  Navigator.pop(context);
                  // Tambahkan logika ke halaman sertifikat jika sudah dibuat
                },
                child: const Text("Lihat Sertifikat"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const KelasScreen()),
                    (route) => false,
                  );
                },
                child: const Text("Nanti Saja"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kuis")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Kuis ada di sini..."),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed:
                      () => Navigator.pop(context), // ke halaman Manajemen K3
                  child: const Text("Kembali"),
                ),
                ElevatedButton(
                  onPressed: () => _showCompletionDialog(context),
                  child: const Text("Selesai"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
