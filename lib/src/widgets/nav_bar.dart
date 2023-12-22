import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';
import 'package:flutter_dgala/src/widgets/logo_navbar.dart';
import 'package:flutter_dgala/src/widgets/menu_collapsed_navbar.dart';
import 'package:flutter_dgala/src/widgets/menu_navbar.dart';
import 'package:flutter_dgala/src/widgets/search_cart.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 80,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUI.isLessThan900(context) ? 30 : 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const LogoNavBar(),
          ResponsiveUI.isLessThan900(context)
              ? const MenuCollapsedNavBar()
              : const MenuNavBar(),
          if (!ResponsiveUI.isLessThan900(context)) const SearchCart(),
        ],
      ),
    );
  }
}
