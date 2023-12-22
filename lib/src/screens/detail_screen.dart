import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
/* import 'dart:html' as html; */
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_dgala/src/api/error_handling_api.dart';
import 'package:flutter_dgala/src/common/app_text_style.dart';
import 'package:flutter_dgala/src/models/detail_reqres_model.dart';
import 'package:flutter_dgala/src/providers/model_shoes_ofer.dart';
import 'package:flutter_dgala/src/widgets/custom_dialog.dart';
import 'package:flutter_dgala/src/widgets/tag.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final sliderController = CarouselController();
  int activeIndex = 0;
  Map<String, dynamic> arguments = {};
  List<String> images = [
    "shoes1grises.png",
    "shoes1naranja.png",
    "shoes1.png",
    "shoes3.png",
    "shoes4.png",
  ];
  List<int> colors = [
    0xffdfa18c,
    0xFF191513,
    0xFF8CAFDF,
    0xFFD5DF8C,
    0xFF89442D,
    0xffdfa18c,
    0xFF191513,
  ];
  List<String> nums = [
    "38.5",
    "39",
    "40",
    "41",
    "42",
    "42.5",
    "43",
    "44",
    "44.5",
    "45",
    "45.5",
    "46",
    "47",
    "47.5",
    "48"
  ];
  late ModelShoesOfer prodctDtlProv;

  /* bool initializingProv = true; */

  /* @override
  void didChangeDependencies() {
    read();
    productDetailProvider = Provider.of<ModelShoesOfer>(context, listen: false);
    listProductDetails();
    super.didChangeDependencies();
  } */

  @override
  void initState() {
    super.initState();

    read();

    Future.delayed(Duration.zero).then((value) {
      prodctDtlProv = Provider.of<ModelShoesOfer>(context, listen: false);
      listProductDetails();
    });
  }

  void listProductDetails() async {
    try {
      await prodctDtlProv.getProductDetails(
        context,
        arguments['id'],
        arguments['color'],
      );
    } on DioException catch (dioError) {
      final errorMessage = DioExceptionApi.fromDioError(dioError).message;
      showCustomDialog(context, errorMessage[0], errorMessage[1]);
      throw Exception("NUNCA SE DEBERIA MANDAR???");
    } catch (e) {
      throw Exception("PQ LLEGO AKI????");
    }
  }

  @override
  void dispose() {
    //aki
    super.dispose();
  }

  Future<void> read() async {
    final sharedP = await SharedPreferences.getInstance();
    final jsonMap = sharedP.getString('arguments');
    if (jsonMap != null) {
      setState(() {
        arguments = json.decode(jsonMap);
      });
    } else {
      arguments = {};
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = ResponsiveUI.screenSize(context);
    double padding = ResponsiveUI.isLessThan900(context) ? 30 : 60;
    double viewPortFraction = ResponsiveUI.isLessThan480(context) ? 0.8 : 0.5;
    ModelShoesOfer detailProv =
        Provider.of<ModelShoesOfer>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Detalles: ${arguments['id']}"),
          backgroundColor: const Color(0xFF232323),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* FutureBuilder(
                future:
                    productsProvider.getProductDetails(context, 163, "#FFFF00"),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ProductDetail>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.atention,
                      ),
                    );
                  } else {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Bounce(
                          from: 15.0,
                          infinite: true,
                          child: const AutoSizeText(
                            "No hay detalles...!",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 40.0, color: Colors.grey),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CarouselSlider.builder(
                              carouselController: sliderController,
                              itemCount: images.length,
                              options: CarouselOptions(
                                height: ResponsiveUI.isLessThan900(context)
                                    ? size.height * 0.6
                                    : size.height * 0.7,
                                viewportFraction: viewPortFraction,
                                initialPage: 0,
                                autoPlay: false,
                                autoPlayInterval: const Duration(seconds: 3),
                                enlargeCenterPage: true,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.scale,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                },
                              ),
                              itemBuilder: (context, index, realIndex) {
                                final image = images[index];
                                return buildImage(image, index);
                              },
                            ),
                            const SizedBox(
                              height: 18.0,
                            ),
                            Center(
                              child: buildIndicator(),
                            ),
                            const SizedBox(
                              height: 36.0,
                            ),
                            Center(
                              child: buildColors(),
                            ),
                            const SizedBox(
                              height: 36.0,
                            ),
                            Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: padding),
                              child: const Text(
                                "Talla Americana/Europea:",
                                style: AppTextStyle.menuTextStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 18.0,
                            ),
                            Container(
                              width: ResponsiveUI.isLessThan900(context)
                                  ? size.width
                                  : size.width / 2,
                              padding:
                                  EdgeInsets.symmetric(horizontal: padding),
                              child: buildTags(),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
              ), */
              CarouselSlider.builder(
                carouselController: sliderController,
                itemCount: detailProv.pohtosDetail.length,
                options: CarouselOptions(
                  height: ResponsiveUI.isLessThan900(context)
                      ? size.height * 0.6
                      : size.height * 0.7,
                  viewportFraction: viewPortFraction,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, realIndex) {
                  /* final image = images[index]; */
                  final Photo image = detailProv.pohtosDetail[index];
                  return buildImage(image.url, index);
                },
              ),
              const SizedBox(
                height: 18.0,
              ),
              Center(
                child: buildIndicator(),
              ),
              const SizedBox(
                height: 36.0,
              ),
              Center(
                child: buildColors(),
              ),
              const SizedBox(
                height: 36.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: const Text(
                  "Talla Americana/Europea:",
                  style: AppTextStyle.menuTextStyle,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                width: ResponsiveUI.isLessThan900(context)
                    ? size.width
                    : size.width / 2,
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: buildTags(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Container(
      color: Colors.transparent,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: prodctDtlProv.pohtosDetail.length,
      effect: const ExpandingDotsEffect(
        dotWidth: 10.0,
        dotHeight: 10.0,
        dotColor: AppColors.atention,
        activeDotColor: AppColors.active,
      ),
      onDotClicked: (index) {
        sliderController.animateToPage(
          index,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  Widget buildColors() {
    List<Widget> children = [];
    for (var valor in prodctDtlProv.colors) {
      var color = Color(valor);
      children.add(
        InkWell(
          onTap: () {
            //TODO: recargar la lista de productos con este color
          },
          child: Container(
            width: 21.0,
            height: 21.0,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.white, width: 3.0),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      );
    }

    return Wrap(
      spacing: 12.0,
      runSpacing: 12.0,
      children: children,
    );
  }

  Widget buildTags() {
    List<Widget> children = [];
    String measure = "";

    for (var num in nums) {
      switch (num) {
        case "38.5":
          measure = "5/2";
          break;
        case "39":
          measure = "6";
          break;
        case "40":
          measure = "6";
          break;
        case "40.5":
          measure = "6/2";
          break;
        case "41":
          measure = "7";
          break;
        case "42":
          measure = "7/2";
          break;
        case "42.5":
          measure = "8";
          break;
        case "43":
          measure = "8/2";
          break;
        case "44":
          measure = "9";
          break;
        case "44.5":
          measure = "9/2";
          break;
        case "45":
          measure = "10";
          break;
        case "45.5":
          measure = "10/2";
          break;
        case "46":
          measure = "11";
          break;
        case "47":
          measure = "11/2";
          break;
        case "47.5":
          measure = "12";
          break;
        case "48":
          measure = "12/2";
          break;
        default:
      }

      children.add(
        Tag(measure: measure, num: num),
      );
    }

    return Wrap(
      spacing: 12.0,
      runSpacing: 12.0,
      children: children,
    );
  }
}
