import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dgala/src/common/app_text_style.dart';
import 'package:flutter_dgala/src/providers/model_sections.dart';
import 'package:flutter_dgala/src/widgets/on_hover_navbar_menu.dart';

class MenuNavBar extends StatelessWidget {
  const MenuNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final modelSections = Provider.of<ModelSections>(context);

    return Row(
      children: <Widget>[
        const Text(
          "Inicio",
          style: AppTextStyle.menuActiveTextStyle,
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {
            modelSections.scrollToItem(modelSections.itemKeyNosotros);
          },
          child: OnHoverNavBarMenu(
            builder: (isHovered) {
              return Text(
                "Nosotros",
                style: isHovered
                    ? AppTextStyle.menuActiveTextStyle
                    : AppTextStyle.menuTextStyle,
              );
            },
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {
            modelSections.scrollToItem(modelSections.itemKeyCatalogo);
          },
          child: OnHoverNavBarMenu(
            builder: (isHovered) {
              return Text(
                "Catálogo",
                style: isHovered
                    ? AppTextStyle.menuActiveTextStyle
                    : AppTextStyle.menuTextStyle,
              );
            },
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: () {
            modelSections.scrollToItem(modelSections.itemKeyContacto);
          },
          child: OnHoverNavBarMenu(
            builder: (isHovered) {
              return Text(
                "Contacto",
                style: isHovered
                    ? AppTextStyle.menuActiveTextStyle
                    : AppTextStyle.menuTextStyle,
              );
            },
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: (() {
            _showRegisterScreen(context);
          }),
          child: OnHoverNavBarMenu(
            builder: (isHovered) {
              return Text(
                "Entrar",
                style: isHovered
                    ? AppTextStyle.menuActiveTextStyle
                    : AppTextStyle.menuAtentionTextStyle,
              );
            },
          ),
        ),
      ],
    );
  }

  ///mostrar otra vista
  void _showRegisterScreen(BuildContext context) {
    Navigator.of(context).pushNamed("/entrar");
  }
}
