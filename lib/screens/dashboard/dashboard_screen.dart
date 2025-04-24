import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:mediquick_pbl/widget/dashboard/article_section.dart';
import 'package:mediquick_pbl/widget/dashboard/category_section.dart';
import 'package:mediquick_pbl/widget/dashboard/greeting_section.dart';
import 'package:mediquick_pbl/widget/dashboard/image_carousel.dart';
import 'package:mediquick_pbl/widget/dashboard/mitra_section.dart';
import 'package:mediquick_pbl/widget/dashboard/search_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: const [
            SizedBox(height: 40),
            GreetingSection(),
            SizedBox(height: 30),
            SearchBarWidget(),
            SizedBox(height: 30),
            ImageCarousel(),
            SizedBox(height: 24),
            CategorySection(),
            SizedBox(height: 24),
            ArticleSection(),
            SizedBox(height: 10),
            MitraSection(),
            SizedBox(height: 32),
=======

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediQuick Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header
            const Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Menu Utama
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildMenuCard(
                    icon: Icons.emergency,
                    title: 'Panggil Ambulans',
                    color: Colors.red,
                    onTap: () {},
                  ),
                  _buildMenuCard(
                    icon: Icons.medical_services,
                    title: 'Pertolongan Pertama',
                    color: Colors.green,
                    onTap: () {},
                  ),
                  _buildMenuCard(
                    icon: Icons.school,
                    title: 'Pelatihan K3',
                    color: Colors.blue,
                    onTap: () {},
                  ),
                  _buildMenuCard(
                    icon: Icons.history,
                    title: 'Riwayat',
                    color: Colors.orange,
                    onTap: () {},
                  ),
                ],
              ),
            ),
>>>>>>> 6a68d2e5e24ef7f5805e31a1b1eedeff5cea2469
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 40),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
>>>>>>> 6a68d2e5e24ef7f5805e31a1b1eedeff5cea2469
