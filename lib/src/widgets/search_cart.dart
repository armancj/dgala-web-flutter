import 'package:dotted_line/dotted_line.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';

class SearchCart extends StatelessWidget {
  const SearchCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Icon(
          FeatherIcons.search,
          size: 18,
          color: AppColors.atention,
        ),
        SizedBox(
          width: 10.0,
        ),
        DottedLine(
          direction: Axis.vertical,
          lineLength: 28,
          dashColor: AppColors.atention,
          dashLength: 2.0,
          lineThickness: 2.0,
          dashGapLength: 2.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Tooltip(
          message: "Muy pronto",
          child: Icon(
            FeatherIcons.shoppingCart,
            size: 18,
            color: AppColors.disabled,
          ),
        ),
      ],
    );
  }
}
