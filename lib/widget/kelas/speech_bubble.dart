import 'package:flutter/material.dart';

class SpeechBubble extends StatelessWidget {
  final String text;

  const SpeechBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: OvalSpeechBubblePainter(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: 240,
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class OvalSpeechBubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bubblePaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final borderPaint =
        Paint()
          ..color = Color(0xFF4A90E2) // warna biru muda seperti desain
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2;

    final double radius = size.height / 2;

    final Rect ovalRect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Path ovalPath =
        Path()..addRRect(
          RRect.fromRectAndRadius(ovalRect, Radius.circular(radius)),
        );

    // Segitiga kecil (ekor bubble)
    final Path trianglePath = Path();
    trianglePath.moveTo(0, size.height * 0.5 - 6); // Titik kiri tengah atas
    trianglePath.lineTo(-10, size.height * 0.5); // Titik luar kiri
    trianglePath.lineTo(0, size.height * 0.5 + 6); // Titik kiri tengah bawah
    trianglePath.close();

    canvas.drawPath(ovalPath, bubblePaint);
    canvas.drawPath(trianglePath, bubblePaint);

    canvas.drawPath(ovalPath, borderPaint);
    canvas.drawPath(trianglePath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
