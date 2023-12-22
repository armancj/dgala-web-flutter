import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/providers/model_sections.dart';
import 'package:flutter_dgala/src/widgets/btn_comprar.dart';
import 'package:flutter_dgala/src/widgets/catalogo_box.dart';
import 'package:flutter_dgala/src/widgets/footer.dart';
import 'package:flutter_dgala/src/widgets/liquid_box.dart';
import 'package:flutter_dgala/src/widgets/nav_bar.dart';
import 'package:flutter_dgala/src/widgets/our_content.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final modelSections = Provider.of<ModelSections>(context);
    late AnimationController _goTopNosotrosController;
    late AnimationController _goTopCatalogoController;
    late AnimationController _goTopContactoController;

    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          if (notification.scrollDelta == null) {
            return true;
          }
          if (notification.scrollDelta! > 0) {
            _goTopNosotrosController.forward(from: 0.0);
            _goTopCatalogoController.forward(from: 0.0);
            _goTopContactoController.forward(from: 0.0);
          }
          /* modelShoes.top -= notification.scrollDelta! / 1.5; */
        }
        return true;
      },
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /*** Seccion Inicio ***/
            Container(
              key: modelSections.itemKeyInicio,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('homecatalogo.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FadeInDown(child: const NavBar()),
                      FadeInUp(child: const LiquidBox()),
                    ],
                  ),
                ],
              ),
            ),

            /*** Seccion 2 test ***/
            Container(
              key: modelSections.itemKeyNosotros,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage('nosotros.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const OurContent(),
                  Positioned(
                    right: size.width * 0.02,
                    bottom: 0.0,
                    child: InkWell(
                      onTap: () {
                        modelSections.scrollToItem(modelSections.itemKeyInicio);
                      },
                      child: BounceInUp(
                        controller: (controller) {
                          _goTopNosotrosController = controller;
                        },
                        child: Container(
                          width: size.height * 0.09,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(9),
                              topRight: Radius.circular(9),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Ionicons.chevron_up_outline,
                              color: Colors.black38,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /*** Seccion 3 test ***/
            Container(
              key: modelSections.itemKeyCatalogo,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage('homecatalogo.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      CatalogoBox(),
                    ],
                  ),
                  Positioned(
                    right: size.width * 0.02,
                    bottom: 0.0,
                    child: InkWell(
                      onTap: () {
                        modelSections.scrollToItem(modelSections.itemKeyInicio);
                      },
                      child: BounceInUp(
                        controller: (controller) {
                          _goTopCatalogoController = controller;
                        },
                        child: Container(
                          width: size.height * 0.09,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(9),
                              topRight: Radius.circular(9),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Ionicons.chevron_up_outline,
                              color: Colors.black38,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /*** Seccion 4 test ***/
            Container(
              key: modelSections.itemKeyContacto,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 23, 23, 23),
                          Color.fromARGB(255, 7, 7, 7),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.transparent,
                    child: const Footer(),
                  ),
                  Positioned(
                    right: size.width * 0.02,
                    bottom: 0.0,
                    child: InkWell(
                      onTap: () {
                        modelSections.scrollToItem(modelSections.itemKeyInicio);
                      },
                      child: BounceInUp(
                        controller: (controller) {
                          _goTopContactoController = controller;
                        },
                        child: Container(
                          width: size.height * 0.09,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(9),
                              topRight: Radius.circular(9),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Ionicons.chevron_up_outline,
                              color: Colors.black38,
                              size: 30.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
