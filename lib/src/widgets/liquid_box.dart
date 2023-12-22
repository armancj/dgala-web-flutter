import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter_dgala/src/api/products_api.dart';
import 'package:flutter_dgala/src/common/circular_path.dart';
import 'package:flutter_dgala/src/providers/model_shoes_ofer.dart';
import 'package:flutter_dgala/src/widgets/btn_comprar.dart';
import 'package:flutter_dgala/src/widgets/btn_comprar2.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_dgala/src/widgets/on_hover_socials_networks.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/data/data.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';
import 'package:provider/provider.dart';

class LiquidBox extends StatefulWidget {
  const LiquidBox({super.key});

  @override
  State<LiquidBox> createState() => _LiquidBoxState();
}

class _LiquidBoxState extends State<LiquidBox> {
  PageController _pageCmpController = PageController();
  PageController _pageImgController = PageController();
  PageController _pageClrController = PageController();
  PageController _pageNumController = PageController();
  late AnimationController _fadeInController;
  int currentPage = 0;
  String currentImg = "";
  final ProductsApi productsApi = ProductsApi();

  @override
  void initState() {
    _pageCmpController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1.0,
    );

    _pageImgController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1.0,
    );

    _pageClrController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1.0,
    );

    _pageNumController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1.0,
    );

    if (carouselShoes[0].variantes.isNotEmpty) {
      imageList = carouselShoes[0].variantes;
    }
    if (carouselShoes[0].colors.isNotEmpty) {
      colorList = carouselShoes[0].colors;
    }
    /* productsApi.productsCtlg(); */

    super.initState();
  }

  @override
  void dispose() {
    _pageCmpController.dispose();
    _pageImgController.dispose();
    _pageClrController.dispose();
    _pageNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vheight = MediaQuery.of(context).size.height;
    final modelShoes = Provider.of<ModelShoesOfer>(context, listen: true);

    Color leftArrowColor =
        (currentPage == 0) ? AppColors.disabled : AppColors.atention;
    Color rightArrowColor = (currentPage == (carouselShoes.length - 1))
        ? AppColors.disabled
        : AppColors.atention;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUI.isLessThan900(context) ? 30 : 60,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Flexible(
            flex: ResponsiveUI.isLessThan900(context) ? 0 : 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: vheight - 100,
              padding: const EdgeInsets.only(
                bottom: 10.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: ResponsiveUI.isLessThan900(context)
                    ? <Widget>[]
                    : <Widget>[
                        OnHoverSocialNetworks(
                          builder: (isHovered) {
                            return Icon(
                              Ionicons.logo_facebook,
                              size: 20.0,
                              color:
                                  isHovered ? AppColors.active : Colors.white,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        OnHoverSocialNetworks(
                          builder: (isHovered) {
                            return Icon(
                              Ionicons.logo_instagram,
                              size: 20.0,
                              color:
                                  isHovered ? AppColors.active : Colors.white,
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        OnHoverSocialNetworks(
                          builder: (isHovered) {
                            return Icon(
                              Ionicons.logo_twitter,
                              size: 20.0,
                              color:
                                  isHovered ? AppColors.active : Colors.white,
                            );
                          },
                        ),
                      ],
              ),
            ),
          ),
          Flexible(
            flex: 20,
            child: Container(
              height: vheight - 100,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: OrientationBuilder(
                builder: (context, orientation) {
                  return Column(
                    children: <Widget>[
                      Flexible(
                        flex: ResponsiveUI.isLessThan900(context) ? 6 : 10,
                        child: Container(
                          height: vheight - 100,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      _pageImgController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 1500),
                                        curve: Curves.easeInOut,
                                      );
                                      _pageNumController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 1800),
                                        curve: Curves.easeInOut,
                                      );
                                      _pageClrController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 1700),
                                        curve: Curves.easeInOut,
                                      );
                                      _pageCmpController.previousPage(
                                        duration:
                                            const Duration(milliseconds: 1700),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Icon(
                                      FeatherIcons.chevronLeft,
                                      size: 30.0,
                                      color: leftArrowColor,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 10,
                                child: Container(
                                  height: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return Stack(
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            ResponsiveUI.isLessThan700(context)
                                                ? Container()
                                                : PageView.builder(
                                                    controller:
                                                        _pageCmpController,
                                                    itemCount:
                                                        carouselShoes.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return AnimatedOpacity(
                                                        duration:
                                                            const Duration(
                                                          milliseconds: 300,
                                                        ),
                                                        opacity: (currentPage ==
                                                                index)
                                                            ? 1.0
                                                            : 0.0,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children:
                                                              _productComponents2(
                                                            carouselShoes[index]
                                                                .components,
                                                            context,
                                                            constraints,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                            ResponsiveUI.isLessThan700(context)
                                                ? Container()
                                                : PageView.builder(
                                                    controller:
                                                        _pageClrController,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        carouselShoes.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return AnimatedOpacity(
                                                        duration:
                                                            const Duration(
                                                          milliseconds: 300,
                                                        ),
                                                        opacity: (currentPage ==
                                                                index)
                                                            ? 1.0
                                                            : 0.0,
                                                        child: Container(
                                                          color: Colors
                                                              .transparent,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: _productColors2(
                                                                (currentPage ==
                                                                        index)
                                                                    ? colorList
                                                                    : carouselShoes[
                                                                            index]
                                                                        .colors,
                                                                modelShoes,
                                                                constraints),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                            IgnorePointer(
                                              child: LayoutBuilder(
                                                builder:
                                                    (context, constraints) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: constraints
                                                                    .maxHeight *
                                                                0.1),
                                                    child: ClipPath(
                                                      clipper:
                                                          CircularPathClipper(),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: <
                                                              BoxShadow>[
                                                            BoxShadow(
                                                              offset: Offset(
                                                                  0.0, 10.0),
                                                              blurRadius: 20.0,
                                                            ),
                                                          ],
                                                        ),
                                                        child: DottedBorder(
                                                          borderType:
                                                              BorderType.Circle,
                                                          strokeWidth: 1.0,
                                                          dashPattern: const [
                                                            6,
                                                            3
                                                          ],
                                                          child: Container(),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              /* child: LayoutBuilder(
                                            builder: (context, constraints) {
                                              double circleH =
                                                  constraints.maxHeight * 0.75;
                                              double circleW =
                                                  constraints.maxHeight * 0.75;
                                              if (ResponsiveUI.isLessThan700(
                                                  context)) {
                                                circleH = circleH * 0.80;
                                                circleW = circleH;
                                              } else if (ResponsiveUI
                                                  .isLessThan900(context)) {
                                                circleH = circleH * 0.85;
                                                circleW = circleH;
                                              } else if (ResponsiveUI
                                                  .isLessThan1100(context)) {
                                                circleH = circleH * 0.90;
                                                circleW = circleH;
                                              }
                                              return Container(
                                                height: circleH,
                                                width: circleW,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          800),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      offset: Offset(0.0, 10.0),
                                                      blurRadius: 20.0,
                                                    ),
                                                  ],
                                                ),
                                                child: DottedBorder(
                                                  borderType: BorderType.Circle,
                                                  strokeWidth: 1.0,
                                                  radius: const Radius.circular(
                                                      800),
                                                  dashPattern: const [6, 3],
                                                  child: LayoutBuilder(
                                                    builder:
                                                        (context, constraints) {
                                                      return Container(
                                                        height: constraints
                                                                .maxHeight *
                                                            0.95,
                                                        width: constraints
                                                                .maxHeight *
                                                            0.95,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      800),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ), */
                                            ),
                                            IgnorePointer(
                                              child: OrientationBuilder(
                                                builder:
                                                    (context, orientation) {
                                                  bool isLandScape =
                                                      (orientation.name ==
                                                              "landscape"
                                                          ? true
                                                          : false);
                                                  return LayoutBuilder(
                                                    builder:
                                                        (context, constraints) {
                                                      double imgH =
                                                          (isLandScape)
                                                              ? constraints
                                                                  .maxHeight
                                                              : constraints
                                                                  .maxWidth;
                                                      return SizedBox(
                                                        height: imgH * 0.90,
                                                        child: PageView.builder(
                                                          controller:
                                                              _pageImgController,
                                                          onPageChanged:
                                                              (newpage) {
                                                            imageList =
                                                                carouselShoes[
                                                                        newpage]
                                                                    .variantes;
                                                            modelShoes
                                                                .changeImage(0);

                                                            setState(() {
                                                              currentPage =
                                                                  newpage;
                                                            });

                                                            colorList =
                                                                carouselShoes[
                                                                        newpage]
                                                                    .colors;
                                                          },
                                                          itemCount:
                                                              carouselShoes
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return AnimatedOpacity(
                                                              duration:
                                                                  const Duration(
                                                                milliseconds:
                                                                    300,
                                                              ),
                                                              opacity:
                                                                  (currentPage ==
                                                                          index)
                                                                      ? 1.0
                                                                      : 0.0,
                                                              child:
                                                                  _productImgs(
                                                                modelShoes,
                                                                index,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  height: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      _pageImgController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 1500),
                                        curve: Curves.easeInOut,
                                      );
                                      _pageNumController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 1800),
                                        curve: Curves.easeInOut,
                                      );
                                      _pageClrController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 1700),
                                        curve: Curves.easeInOut,
                                      );
                                      _pageCmpController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 1700),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Icon(
                                      FeatherIcons.chevronRight,
                                      size: 30.0,
                                      color: rightArrowColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Flex(
                          direction: ResponsiveUI.isLessThan900(context)
                              ? Axis.vertical
                              : Axis.horizontal,
                          children: <Widget>[
                            Expanded(
                              flex: ResponsiveUI.isLessThan900(context) ? 0 : 1,
                              child: Container(
                                color: Colors.transparent,
                              ),
                            ),
                            Expanded(
                              flex: ResponsiveUI.isLessThan900(context) ? 3 : 5,
                              child: Container(
                                color: Colors.transparent,
                                child: PageView.builder(
                                  controller: _pageNumController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: carouselShoes.length,
                                  itemBuilder: (context, index) {
                                    return AnimatedOpacity(
                                      duration: const Duration(
                                        milliseconds: 600,
                                      ),
                                      opacity:
                                          (currentPage == index) ? 1.0 : 0.0,
                                      child: Container(
                                        height: double.infinity,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              children: [
                                                Flexible(
                                                  flex: 7,
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5.0),
                                                      child: Text(
                                                        "\$",
                                                        style: TextStyle(
                                                          fontSize: ResponsiveUI
                                                                  .isHeightLessThan657(
                                                                      context)
                                                              ? (ResponsiveUI
                                                                      .isHeightLessThan455(
                                                                          context)
                                                                  ? 40.0
                                                                  : 60.0)
                                                              : 70.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Color(
                                                              carouselShoes[
                                                                      index]
                                                                  .colorNewPrice),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Flexible(
                                                  flex: 3,
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 5.0,
                                                      ),
                                                      child: Text(
                                                        carouselShoes[index]
                                                            .oldPrice,
                                                        style: TextStyle(
                                                          fontSize: ResponsiveUI
                                                                  .isHeightLessThan657(
                                                                      context)
                                                              ? (ResponsiveUI
                                                                      .isHeightLessThan455(
                                                                          context)
                                                                  ? 15.0
                                                                  : 25.0)
                                                              : 30.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 4,
                                                  child: FittedBox(
                                                    fit: BoxFit.cover,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      child: Text(
                                                        carouselShoes[index]
                                                            .newPrice,
                                                        style: TextStyle(
                                                          fontSize: ResponsiveUI
                                                                  .isHeightLessThan657(
                                                                      context)
                                                              ? (ResponsiveUI
                                                                      .isHeightLessThan455(
                                                                          context)
                                                                  ? 25.0
                                                                  : 35.0)
                                                              : 40.0,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              carouselShoes[
                                                                      index]
                                                                  .colorNewPrice),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: FittedBox(
                                child: Container(
                                  color: Colors.transparent,
                                  child: const BtnComprar2(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///funcion que devuelve los colores de los zapatos...
  List<Widget> _productColors(List<int> colors, ModelShoesOfer modelShoes) {
    List<Widget> listColors = [];
    int miliseconds = 1100;

    bool isMatch = (colorList.length == imageList.length) ? true : false;
    /* double isLessBG = ResponsiveUI.isLessThan1250(context) ? 50.0 : 100.0;
    double isLessCircle = ResponsiveUI.isLessThan1250(context) ? 65 : 120; */
    double isLessHBg = ResponsiveUI.isLessThan1250(context) ? 30.0 : 40.0;

    if (colors.isNotEmpty & isMatch) {
      for (var i = 0; i < colors.length; i++) {
        miliseconds += 100;
        var element = colors[i];

        listColors.add(Transform(
          transform: Matrix4.identity()..translate(150, 0, 0),
          child: FadeInLeft(
            delay: Duration(milliseconds: miliseconds),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  modelShoes.changeImage(i);
                  _fadeInController.forward(
                    from: 0.0,
                  );
                },
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      height: isLessHBg,
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      /* transform: Matrix4.identity()..translate(isLessBG, 0, 0), */
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromARGB(0, 255, 255, 255),
                            Color.fromARGB(255, 255, 255, 255)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: isLessHBg,
                      height: isLessHBg,
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      /* transform: Matrix4.identity()
                        ..translate(isLessCircle, 0, 0), */
                      decoration: BoxDecoration(
                        color: Color(element),
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          width: 5.0,
                          color: (Colors.white == Color(element)
                              ? const Color.fromARGB(255, 237, 237, 237)
                              : Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
      }
    }
    return listColors;
  }

  ///funcion que devuelve los componentes de los zapatos...
  List<Widget> _productComponents(List<String> components, context) {
    List<Widget> listComponents = [];
    int miliseconds = 1100;
    int isLess = ResponsiveUI.isLessThan1250(context) ? -260 : -310;
    double fontSize = ResponsiveUI.isLessThan1250(context) ? 10.0 : 12.0;

    for (var element in components) {
      miliseconds += 50;
      listComponents.add(FadeInRight(
        delay: Duration(milliseconds: miliseconds),
        child: Container(
          width: 250.0,
          alignment: Alignment.centerLeft,
          transform: Matrix4.identity()..translate(isLess, 0, 0),
          margin: const EdgeInsets.only(bottom: 15.0),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 10.0,
                height: 10.0,
                margin: const EdgeInsets.only(
                  right: 5.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(width: 1.0, color: Colors.white),
                ),
              ),
              Text(
                element,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ));
    }

    return listComponents;
  }

  ///funcion de prueba que devuelve los componentes de los zapatos...
  List<Widget> _productComponents2(
      List<String> components, context, constraintsParent) {
    List<Widget> listComponents = [];
    int miliseconds = 1100;
    double fontSize = ResponsiveUI.isLessThan900(context) ? 10.0 : 12.0;

    for (var element in components) {
      miliseconds += 50;
      listComponents.add(FadeInRight(
        delay: Duration(milliseconds: miliseconds),
        child: LayoutBuilder(
          builder: (context, constraints) {
            var separation = (constraints.maxWidth * 0.76) * -1;
            return Container(
              alignment: Alignment.centerLeft,
              transform: Matrix4.identity()..translate(separation, 0, 0),
              margin: const EdgeInsets.only(bottom: 15.0),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.only(
                      right: 5.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(width: 1.0, color: Colors.white),
                    ),
                  ),
                  Text(
                    element,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ));
    }

    return listComponents;
  }

  ///funcion que devuelve los colores de los zapatos...
  List<Widget> _productColors2(
      List<int> colors, ModelShoesOfer modelShoes, constraints) {
    List<Widget> listColors = [];
    int miliseconds = 1100;

    bool isMatch = (colorList.length == imageList.length) ? true : false;
    /* double isLessBG = ResponsiveUI.isLessThan1250(context) ? 50.0 : 100.0;
    double isLessCircle = ResponsiveUI.isLessThan1250(context) ? 65 : 120; */
    /* double isLessHBg = ResponsiveUI.isLessThan900(context) ? 30.0 : 35.0; */
    /*  double positionX = (constraints.maxWidth * 0.06); */
    /* Size screenSize = ResponsiveUI.screenSize(context); */

    if (colors.isNotEmpty & isMatch) {
      for (var i = 0; i < colors.length; i++) {
        miliseconds += 100;
        var element = colors[i];

        listColors.add(Transform(
          transform: Matrix4.identity()
            ..translate(constraints.maxHeight / 3, 0, 0),
          child: FadeInLeft(
            delay: Duration(milliseconds: miliseconds),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  modelShoes.changeImage(i);
                  _fadeInController.forward(
                    from: 0.0,
                  );
                },
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      height: 35.0,
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        gradient: const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromARGB(0, 255, 255, 255),
                            Color.fromARGB(255, 255, 255, 255)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(element),
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          width: 5.0,
                          color: (Colors.white == Color(element)
                              ? const Color.fromARGB(255, 237, 237, 237)
                              : Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
      }
    }
    return listColors;
  }

  ///funcion que devuelve las imagenes de los zapatos...
  Widget _productImgs(ModelShoesOfer modelShoes, int index) {
    return FadeIn(
      controller: (controller) {
        _fadeInController = controller;
      },
      child: Image.asset(
        (currentPage == index) ? modelShoes.img : carouselShoes[index].img,
      ),
    );
  }
}
