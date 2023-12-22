/* import 'dart:html';
import 'dart:ui'; */

import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/api/error_handling_api.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/common/app_text_style.dart';
/* import 'package:flutter_dgala/src/data/data.dart'; */
/* import 'package:flutter_dgala/src/models/model_shoes_catalogo.dart'; */
import 'package:flutter_dgala/src/providers/model_shoes_ofer.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';
import 'package:flutter_dgala/src/widgets/custom_dialog.dart';
import 'package:flutter_dgala/src/widgets/menu_catalogo.dart';
import 'package:flutter_dgala/src/widgets/on_hover_navbar_menu.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/products_api.dart';
import 'package:flutter_dgala/src/models/product_reqres_model.dart';

class CatalogoBox extends StatefulWidget {
  const CatalogoBox({Key? key}) : super(key: key);

  @override
  State<CatalogoBox> createState() => _CatalogoBoxState();
}

class _CatalogoBoxState extends State<CatalogoBox> {
  final ProductsApi productsApi = ProductsApi();
  final _scrollController = ScrollController();
  late int selectedCategory;

  TextEditingController? _searchQuery;
  final bool _isSearching = false;

  late ModelShoesOfer productsProvider;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero).then((value) {
      selectedCategory = 0;
      productsProvider = Provider.of<ModelShoesOfer>(context, listen: false);

      // Carga la lista de categorias y la primera pagina de productos
      //aun no estoy cargando las categorias...
      /* _productsController.loadCategories(); */
      listProducts();

      _scrollController.addListener(() {
        if (_scrollController.position.atEdge) {
          bool isTop = _scrollController.position.pixels == 0;
          if (isTop) {
            print('At the top');
            listProducts(paginated: false);
          } else {
            print('next page');
            if (!productsProvider.allLoadedCtlg) {
              listProducts(paginated: true);
            }
          }
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void listProducts({bool paginated = false}) async {
    try {
      await productsProvider.getProductsCtlg(context, paginated: paginated);
    } on DioException catch (dioError) {
      final errorMessage = DioExceptionApi.fromDioError(dioError).message;
      showCustomDialog(context, errorMessage[0], errorMessage[1]);
      throw Exception("NUNCA SE DEBERIA MANDAR???");
    } catch (e) {
      throw Exception("PQ LLEGO AKI????");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ModelShoesOfer productsCtlgProvider =
        Provider.of<ModelShoesOfer>(context, listen: true);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUI.isLessThan900(context) ? 30 : 60,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              height: size.height,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 4,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: <Widget>[
                                Container(
                                  width: size.width * 0.45,
                                  height: 30.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(900.0),
                                    ),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Color.fromARGB(186, 0, 0, 0),
                                        offset: Offset(0.0, 6.0),
                                        blurRadius: 9.0,
                                        spreadRadius: 3.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.03,
                                  height: 30.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(900.0),
                                      bottomLeft: Radius.circular(900.0),
                                    ),
                                  ),
                                  child: InkWell(
                                    child: const Icon(Ionicons.search),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                ),
                                child: MenuCatalogo(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 10,
                    child: Stack(
                      children: <Widget>[
                        productsCtlgProvider.productsCatalogoList.length > 0
                            ? Container(
                                color: Colors.transparent,
                                child: Catalogo(
                                    scrollController: _scrollController),
                              )
                            : const Text(
                                "No se ha podido cargar ningún dato",
                                style: AppTextStyle.menuTextStyle,
                              ),
                        if (productsCtlgProvider.loadingCtlg)
                          const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.transparent,
                              color: AppColors.atention,
                            ),
                          ),
                      ],
                      /* child: const Center(
                          child: Text(
                            "TODO: esto es solo para que no se hagan las peticiones",
                            style: AppTextStyle.menuTextStyle,
                          ),
                        ), */
                      /* child: FutureBuilder(
                          future: productsProvider.getProductsCatalogo(context),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Product>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                      "No hay datos...!",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 40.0, color: Colors.grey),
                                    ),
                                  ),
                                );
                              } else {
                                return Catalogo(products: snapshot.data!);
                              }
                            }
                          },
                        ), */
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Catalogo extends StatelessWidget {
  final ScrollController scrollController;
  const Catalogo({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const int kbreackPoint = 1088;
    int numCards = size.width < kbreackPoint ? 4 : 5;
    ModelShoesOfer productsCtlgProvider =
        Provider.of<ModelShoesOfer>(context, listen: true);

    return GridView.builder(
      controller: scrollController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: numCards,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.65,
      ),
      itemCount: productsCtlgProvider.productsCatalogoList.length,
      itemBuilder: (context, int index) {
        final product = productsCtlgProvider.productsCatalogoList[index];
        final imgUrl = product.photo[0].url;

        String colorDefault = product.colorDefault.trim();
        colorDefault = colorDefault.substring(1);
        colorDefault = "0xFF$colorDefault";
        int colorPrice = int.parse(colorDefault);

        String gender = product.gender;
        switch (gender) {
          case "men":
            gender = "Hombre";
            break;
          case "women":
            gender = "Mujer";
            break;
          case "unisex":
            gender = "Unisex";
            break;
          default:
            "Indefinido";
        }
        return Container(
          margin: const EdgeInsets.all(10.0),
          width: 700,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromARGB(186, 0, 0, 0),
                offset: Offset(0.0, 6.0),
                blurRadius: 9.0,
                spreadRadius: 3.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Flexible(
                  flex: 8,
                  child: InkWell(
                    onTap: () {
                      final Map<String, dynamic> arguments = {
                        'id': product.id,
                        'color': product.colorDefault,
                      };
                      setPreferences(arguments);
                      Navigator.pushNamed(
                        context,
                        '/detalles',
                        arguments: arguments,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 242, 242, 242),
                        image: DecorationImage(
                          image: NetworkImage(imgUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 3.0,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            "${product.price.toString()} cup",
                            maxLines: 1,
                            minFontSize: 14,
                            stepGranularity: 1,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(colorPrice),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(child: Container()),
                        Expanded(
                          child: AutoSizeText(
                            product.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 12,
                            stepGranularity: 1,
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 75, 75, 75),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            gender,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 8.0,
                            style: const TextStyle(
                              fontSize: 10.0,
                              color: Color.fromARGB(255, 75, 75, 75),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  textBaseline: TextBaseline.alphabetic,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  children: <Widget>[
                                    const Icon(
                                      Ionicons.heart,
                                      color: AppColors.active,
                                      size: 12.0,
                                    ),
                                    const SizedBox(
                                      width: 3.0,
                                    ),
                                    AutoSizeText(
                                      product.reviewsTotal.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      minFontSize: 8.0,
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const <Widget>[
                                    Icon(
                                      Ionicons.pencil,
                                      size: 13.0,
                                      color: Color.fromARGB(255, 220, 220, 220),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Icon(
                                      Ionicons.cart,
                                      size: 15.0,
                                      color: Color.fromARGB(255, 220, 220, 220),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void setPreferences(Map<String, dynamic> arguments) async {
    final sharedP = await SharedPreferences.getInstance();
    sharedP.setString('arguments', json.encode(arguments));
  }
}
