import 'package:flutter/material.dart';

class ResponsiveUI extends StatelessWidget {
  final Widget? mobile;
  final Widget? web;

  const ResponsiveUI({Key? key, this.mobile, this.web}) : super(key: key);

  ///Métodos respecto al view-width
  static bool isLessThan1250(BuildContext context) {
    return MediaQuery.of(context).size.width < 1250;
  }

  static bool isLessThan1100(BuildContext context) {
    return MediaQuery.of(context).size.width < 1100;
  }

  static bool isLessThan900(BuildContext context) {
    return MediaQuery.of(context).size.width < 900;
  }

  static bool isLessThan700(BuildContext context) {
    return MediaQuery.of(context).size.width < 700;
  }

  static bool isLessThan480(BuildContext context) {
    return MediaQuery.of(context).size.width < 480;
  }

  ///Métodos respecto al view-height
  static bool isHeightLessThan657(BuildContext context) {
    return MediaQuery.of(context).size.height < 657;
  }

  static bool isHeightLessThan455(BuildContext context) {
    return MediaQuery.of(context).size.height < 455;
  }

  ///Get screen size
  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) {
        if (cons.maxWidth >= 900) {
          return web!;
        } else {
          return mobile!;
        }
      },
    );
  }
}
