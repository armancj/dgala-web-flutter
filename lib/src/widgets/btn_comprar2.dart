import 'package:animate_do/animate_do.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';
import 'package:flutter_dgala/src/widgets/on_hover_button.dart';

class BtnComprar2 extends StatelessWidget {
  const BtnComprar2({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: const Duration(milliseconds: 900),
      child: Tooltip(
        message: "Muy pronto",
        child: OnHoverButton(
          builder: (isHovered) {
            return Center(
              child: Container(
                  width: 135,
                  height: 35,
                  decoration: BoxDecoration(
                    /* color: isHovered ? AppColors.active : AppColors.atention, */
                    color: AppColors.disabled,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0.0, 5.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerRight,
                        color: Colors.transparent,
                        child: const Text(
                          "COMPRAR",
                          style: TextStyle(
                            color: Color.fromARGB(255, 196, 196, 196),
                            fontWeight: FontWeight.w300,
                            fontSize: 12.0,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Icon(
                          FeatherIcons.chevronRight,
                          color: Color.fromARGB(255, 196, 196, 196),
                          size: 16,
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
