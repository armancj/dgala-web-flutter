import 'package:flutter/material.dart';

class ShoesOfer extends StatelessWidget {
  final Color? color;
  final double? top;
  final double? width;
  final double? height;
  final Duration duration;

  const ShoesOfer({
    super.key,
    this.color,
    this.top,
    this.width,
    this.height,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      curve: Curves.easeInOut,
      top: top,
      right: 0,
      left: 0,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }
}
