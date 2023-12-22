import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const OnHoverButton({Key? key, required this.builder}) : super(key: key);

  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    /* final hoverdTransform = Matrix4.identity()
      ..scale(1.05)
      ..translate(0, -4, 0); */
    final hoverdTransform = Matrix4.identity()
      ..scale(1.0)
      ..translate(0, 0, 0);
    final transform = isHovered ? hoverdTransform : Matrix4.identity();

    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }

  onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
