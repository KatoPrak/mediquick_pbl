import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MitraSection extends StatefulWidget {
  const MitraSection({super.key});

  @override
  State<MitraSection> createState() => _MitraSectionState();
}

class _MitraSectionState extends State<MitraSection> {
  final PageController _controller = PageController(viewportFraction: 0.3);

  final List<String> mitraList = [
    'Apotek A',
    'Apotek B',
    'Apotek C',
    'Apotek D',
    'Apotek E',
    'Apotek F',
    'Apotek G',
    'Apotek H',
    'Apotek I',
  ];

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 2.0;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mitra',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 50,
            child: PageView.builder(
              controller: _controller,
              itemCount: mitraList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6A87B3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      mitraList[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: SmoothPageIndicator(
              controller: _controller,
              count: mitraList.length,
              effect: const WormEffect(
                dotColor: Colors.white,
                activeDotColor: Color(0xFF6A87B3),
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
