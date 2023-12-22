import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/screens/mobile_screen.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';
import 'package:flutter_dgala/src/screens/web_screen.dart';

class LandingScreem extends StatelessWidget {
  const LandingScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: ResponsiveUI(
        mobile: MobileScreen(),
        web: WebScreen(),
      ),
    );
  }
}
