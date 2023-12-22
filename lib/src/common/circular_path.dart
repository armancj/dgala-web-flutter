import 'package:flutter/material.dart';

class CircularPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return _getCirclePath(size);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

  /// Returns a circular path of [size]
  Path _getCirclePath(Size size) {
    double w = size.width;
    double h = size.height;
    double s = size.shortestSide;

    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            w > s ? (w - s) / 2 : 0,
            h > s ? (h - s) / 2 : 0,
            s,
            s,
          ),
          Radius.circular(s / 2),
        ),
      );
  }
}
