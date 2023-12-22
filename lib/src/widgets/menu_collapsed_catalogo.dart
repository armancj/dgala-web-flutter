import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/common/app_text_style.dart';

class MenuCollapsedCatalogo extends StatelessWidget {
  final List<String> options;
  const MenuCollapsedCatalogo({Key? key, required this.options})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: "Menú",
      child: _iconCollapsedMenu(),
      itemBuilder: (BuildContext cntx) {
        return _popMenuItems(options);
      },
      onSelected: (value) {},
    );
  }

  ///Devuelve los items del Menú
  List<PopupMenuItem> _popMenuItems(List<String> items) {
    List<PopupMenuItem> popMenuItems = [];

    for (var item in items) {
      popMenuItems.add(
        PopupMenuItem(
          value: item.toLowerCase(),
          onTap: () {},
          child: Text(
            item,
            style: AppTextStyle.menuCollapseTextStyle,
          ),
        ),
      );
    }

    return popMenuItems;
  }

  ///Devuelve el widget que representa el Menú
  Widget _iconCollapsedMenu() {
    return Row(
      children: const <Widget>[
        DottedLine(
          direction: Axis.vertical,
          lineLength: 21,
          dashColor: Colors.white,
          dashLength: 2.0,
          lineThickness: 2.0,
          dashGapLength: 2.0,
        ),
        SizedBox(
          width: 12.0,
        ),
        Text(
          "Más",
          style: AppTextStyle.menuTextStyle,
        ),
      ],
    );
  }
}
