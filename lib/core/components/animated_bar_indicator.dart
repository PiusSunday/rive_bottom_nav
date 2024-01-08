import 'package:flutter/material.dart';

class AnimatedBarIndicator extends StatelessWidget {
  const AnimatedBarIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: BoxDecoration(
        color: const Color(0xFF8184FF),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
