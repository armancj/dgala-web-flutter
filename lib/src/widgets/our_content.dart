import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';

class OurContent extends StatelessWidget {
  const OurContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: ResponsiveUI.isLessThan480(context)
                ? 0
                : ResponsiveUI.isLessThan700(context)
                    ? 3
                    : ResponsiveUI.isLessThan900(context)
                        ? 6
                        : 8,
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Expanded(
            flex: ResponsiveUI.isLessThan900(context) ? 6 : 4,
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0),
                ),
                child: Container(
                  /* width: size.width * 0.33, */
                  height: size.height * 0.6,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 4.0,
                          sigmaY: 4.0,
                        ),
                        child: Container(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            bottomLeft: Radius.circular(50.0),
                          ),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.13),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.white.withOpacity(0.15),
                              Colors.white.withOpacity(0.05),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                          left: 30.0,
                          right: 30.0,
                          bottom: 30.0,
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            /* print(
                                    "w: ${constraints.maxWidth} - h: ${constraints.maxHeight}"); */
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            color: Colors.transparent,
                                            alignment: Alignment.centerLeft,
                                            child: const AutoSizeText(
                                              "Sobre nosotros",
                                              style: TextStyle(
                                                fontSize: 40,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w100,
                                                letterSpacing: 3.0,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 1.0,
                                          color: AppColors.atention,
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Container(
                                            color: Colors.transparent,
                                            alignment: Alignment.centerLeft,
                                            child: const AutoSizeText(
                                              "D'GALA",
                                              style: TextStyle(
                                                fontSize: 120,
                                                color: AppColors.atention,
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 7.0,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 9,
                                          child: Container(
                                            color: Colors.transparent,
                                            alignment: Alignment.bottomLeft,
                                            child: const AutoSizeText(
                                              "Lorem, asjjaduywye asdj hhja sdyy,asda sdasd asdasd. Lorem, asjjaduywye asdj hhja sdyy,asda sdasd asdasd. Lorem, asjjaduywye asdj hhja sdyy,asda sdasd asdasd asdas as. ",
                                              minFontSize: 10.0,
                                              maxLines: 8,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w100,
                                                letterSpacing: 1.0,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
