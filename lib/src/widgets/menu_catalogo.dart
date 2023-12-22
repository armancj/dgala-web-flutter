import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_text_style.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';
import 'package:flutter_dgala/src/widgets/menu_collapsed_catalogo.dart';
import 'package:flutter_dgala/src/widgets/on_hover_navbar_menu.dart';

class MenuCatalogo extends StatefulWidget {
  const MenuCatalogo({Key? key}) : super(key: key);

  @override
  State<MenuCatalogo> createState() => _MenuCatalogoState();
}

class _MenuCatalogoState extends State<MenuCatalogo> {
  List<String> optionsMenu = [
    "Todo",
    "Mujer",
    "Hombre",
    "Unisex",
    "Niñas",
    "Niños",
    "Clasicos",
  ];
  List<String> optionsMenuCollapsed = [];

  @override
  Widget build(BuildContext context) {
    Size size = ResponsiveUI.screenSize(context);
    double fixedDiv = 61.5;
    double fixedWidth = (optionsMenu.length + 1) * fixedDiv;
    double result = 0.0;
    int rounded = 0;

    if (size.width <= fixedWidth) {
      result = fixedWidth - size.width;
      result = result / fixedDiv;
      rounded = result.round();
      if (rounded != 0.0) {
        int skip = optionsMenu.length - rounded;
        optionsMenuCollapsed = optionsMenu.skip(skip - 1).toList();
        optionsMenu = optionsMenu.take(skip - 1).toList();
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: _menuItems(optionsMenu),
        ),
        if (optionsMenuCollapsed.isNotEmpty)
          MenuCollapsedCatalogo(
            options: optionsMenuCollapsed,
          ),
      ],
    );
  }

  List<Widget> _menuItems(List<String> items) {
    List<Widget> itemsResult = [];

    for (var item in items) {
      itemsResult.add(
        Container(
          padding: const EdgeInsets.only(right: 12.0),
          child: InkWell(
            onTap: () {},
            child: OnHoverNavBarMenu(
              builder: (isHovered) {
                return Text(
                  item,
                  style: isHovered
                      ? AppTextStyle.menuActiveTextStyle
                      : AppTextStyle.menuTextStyle,
                );
              },
            ),
          ),
        ),
      );
    }

    return itemsResult;
  }
}
