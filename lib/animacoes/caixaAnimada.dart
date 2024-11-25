import 'dart:ui';

import 'package:flutter/material.dart';

class CaixaAnimada extends StatefulWidget {
  @override
  _CaixaAnimadaState createState() => _CaixaAnimadaState();
}

class _CaixaAnimadaState extends State<CaixaAnimada>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // Faz a animação repetir
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Transform.translate(
            offset: const Offset(0, -100),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4 * 3,
              height: MediaQuery.of(context).size.width / 4 * 3,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: LinePainter(_controller.value),
                  );
                },
              ),
            ),
          ),
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height,
        //   // color: Colors.amber,
        //   color: Color.fromARGB(255, 158, 158, 158),
        // ),
        Center(
          child: Transform.translate(
            offset: Offset(0, -100),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Color.alphaBlend(Colors.grey, Colors.transparent),
                  BlendMode.clear),
              child: Container(
                width: MediaQuery.of(context).size.width / 4 * 3,
                height: MediaQuery.of(context).size.width / 4 * 3,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0),
                  border: Border.all(width: 0),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: Offset(0, -100),
            child: Container(
              width: MediaQuery.of(context).size.width / 4 * 3,
              height: MediaQuery.of(context).size.width / 4 * 3,
              decoration: BoxDecoration(
                // color: Colors.transparent,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  final double progress;

  LinePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final y = size.height * (1 - progress);

    canvas.drawLine(
      Offset(0, y),
      Offset(size.width, y),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
