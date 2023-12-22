import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/common/app_text_style.dart';

class Tag extends StatelessWidget {
  final String measure;
  final String num;

  const Tag({
    Key? key,
    required this.measure,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: AppColors.atention,
        child: Text(
          num,
          style: AppTextStyle.tagAvatarTextStyle,
        ),
      ),
      label: Text(
        measure,
        style: AppTextStyle.tagLabelTextStyle,
      ),
      backgroundColor: AppColors.normal,
    );
  }
}
