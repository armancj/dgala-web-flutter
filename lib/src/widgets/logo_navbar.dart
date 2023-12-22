import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/common/app_text_style.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';

class LogoNavBar extends StatelessWidget {
  const LogoNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: ResponsiveUI.isLessThan900(context) ? 40 : 45,
          width: ResponsiveUI.isLessThan900(context) ? 40 : 45,
          decoration: BoxDecoration(
            color: AppColors.active,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 63, 1, 0), AppColors.active],
            ),
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: const Center(
            child: Text(
              "D",
              style: AppTextStyle.logoDTextStyle,
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        const Text(
          "de gala",
          style: AppTextStyle.logoTextStyle,
        ),
      ],
    );
  }
}
