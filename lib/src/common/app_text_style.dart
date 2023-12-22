import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';

abstract class AppTextStyle {
  static const TextStyle logoDTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 30.0,
  );

  static const TextStyle logoTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
  );

  static const TextStyle menuTextStyle = TextStyle(
    color: Colors.white,
  );

  static const TextStyle menuActiveTextStyle = TextStyle(
    color: AppColors.active,
  );

  static const TextStyle menuAtentionTextStyle = TextStyle(
    color: AppColors.atention,
  );

  static const TextStyle menuCollapseTextStyle = TextStyle(
    color: Colors.black,
  );

  static const TextStyle menuCollapseDisabledTextStyle = TextStyle(
    color: Colors.grey,
  );

  static const TextStyle tagAvatarTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 9.0,
  );

  static const TextStyle tagLabelTextStyle = TextStyle(
    color: Colors.black,
  );
}
