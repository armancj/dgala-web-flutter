import 'package:animate_do/animate_do.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';
import 'package:flutter_dgala/src/widgets/on_hover_button.dart';

class BtnComprar extends StatelessWidget {
  const BtnComprar({super.key});

  @override
  Widget build(BuildContext context) {
    return /* Positioned(
      bottom: 30,
      right: 100,
      child:  */
        FadeInRight(
      delay: const Duration(milliseconds: 900),
      child: Tooltip(
        message: "Muy pronto",
        child: OnHoverButton(
          builder: (isHovered) {
            return Container(
                /* width: ResponsiveUI.isLessThan1250(context) ? 100 : 120.0, */
                height: ResponsiveUI.isLessThan1250(context) ? 30 : 35.0,
                decoration: BoxDecoration(
                  /* color: isHovered ? AppColors.active : AppColors.atention, */
                  color: AppColors.disabled,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0.0, 10.0),
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.transparent,
                          child: Text(
                            "COMPRAR",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 196, 196, 196),
                              fontWeight: FontWeight.w300,
                              fontSize: ResponsiveUI.isLessThan1250(context)
                                  ? 14
                                  : 16.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            FeatherIcons.chevronRight,
                            color: const Color.fromARGB(255, 196, 196, 196),
                            size: ResponsiveUI.isLessThan1250(context)
                                ? 16
                                : 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
    ); /* , */
    /* ); */
  }
}
