import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/common/app_text_style.dart';
import 'package:flutter_dgala/src/providers/model_sections.dart';
import 'package:flutter_dgala/src/screens/register_screen.dart';
import 'package:provider/provider.dart';

class MenuCollapsedNavBar extends StatelessWidget {
  const MenuCollapsedNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modelSections = Provider.of<ModelSections>(context);
    return PopupMenuButton(
      tooltip: "Menú",
      child: const Icon(
        Icons.menu,
        color: AppColors.atention,
        size: 35,
      ),
      itemBuilder: (BuildContext cntx) {
        return <PopupMenuItem>[
          const PopupMenuItem(
            value: 'inicio',
            child: Text(
              "Inicio",
              style: AppTextStyle.menuCollapseTextStyle,
            ),
          ),
          PopupMenuItem(
            value: 'nosotros',
            onTap: () {
              modelSections.scrollToItem(modelSections.itemKeyNosotros);
            },
            child: const Text(
              "Nosotros",
              style: AppTextStyle.menuCollapseTextStyle,
            ),
          ),
          PopupMenuItem(
            value: 'catalogo',
            onTap: () {
              modelSections.scrollToItem(modelSections.itemKeyCatalogo);
            },
            child: const Text(
              "Catálogo",
              style: AppTextStyle.menuCollapseTextStyle,
            ),
          ),
          PopupMenuItem(
            value: 'contacto',
            onTap: () {
              modelSections.scrollToItem(modelSections.itemKeyContacto);
            },
            child: const Text(
              "Contacto",
              style: AppTextStyle.menuCollapseTextStyle,
            ),
          ),
          PopupMenuItem(
            value: 'entrar',
            onTap: () {},
            child: const Text(
              "Entrar",
              style: AppTextStyle.menuCollapseTextStyle,
            ),
          ),
          /* PopupMenuItem(
            value: 'buscar',
            child: Text(
              "Buscar",
              style: AppTextStyle.menuCollapseTextStyle,
            ),
          ), */
          const PopupMenuItem(
            value: 'carrito',
            child: Text(
              "Carrito",
              style: AppTextStyle.menuCollapseDisabledTextStyle,
            ),
          ),
        ];
      },
      onSelected: (value) {
        if (value == "entrar") {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const RegisterScreen();
            },
          ));
        }
      },
    );
  }

  ///mostrar otra vista
  void _showRegisterScreen(BuildContext context) {
    Navigator.of(context).pushNamed("/entrar");
  }
}
