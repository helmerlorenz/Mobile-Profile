import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedParticle extends StatefulWidget {
  final int index;

  const AnimatedParticle({super.key, required this.index});

  @override
  State<AnimatedParticle> createState() => _AnimatedParticleState();
}

class _AnimatedParticleState extends State<AnimatedParticle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double left;
  late double top;
  late double size;

  @override
  void initState() {
    super.initState();
    final random = math.Random(widget.index);
    left = random.nextDouble() * 100;
    top = random.nextDouble() * 100;
    size = random.nextDouble() * 4 + 2;
    _controller = AnimationController(
      duration: Duration(seconds: 3 + random.nextInt(4)),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: MediaQuery.of(context).size.width * (left / 100),
          top: MediaQuery.of(context).size.height * (top / 100) +
              (_controller.value * 50),
          child: Opacity(
            opacity: 0.3 + (_controller.value * 0.4),
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.5),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}