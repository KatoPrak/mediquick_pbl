import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halo, Selamat Datang",
              style: TextStyle(fontSize: 24, color: Color(0xFF6482AD)),
            ),
            Text(
              "Lorem Ipsum",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF6482AD),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Icon(Icons.notifications, size: 28, color: Color(0xFF6482AD)),
      ],
    );
  }
}
