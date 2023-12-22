import 'package:flutter/material.dart';

class OnHoverSocialNetworks extends StatefulWidget {
  final Widget Function(bool isHovered) builder;
  const OnHoverSocialNetworks({Key? key, required this.builder})
      : super(key: key);

  @override
  State<OnHoverSocialNetworks> createState() => _OnHoverSocialNetworksState();
}

class _OnHoverSocialNetworksState extends State<OnHoverSocialNetworks> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoverdTransform = Matrix4.identity()
      ..scale(1.05)
      ..translate(4, 0, 0);
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
