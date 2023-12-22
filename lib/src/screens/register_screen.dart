import 'dart:convert';
import 'dart:html';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/circular_path.dart';
import 'package:flutter_dgala/src/screens/detail_screen.dart';
import 'package:flutter_dgala/src/screens/responsive_ui.dart';
import 'package:flutter_dgala/src/widgets/logo_navbar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_dgala/src/data/data.dart';
import 'package:flutter_dgala/src/models/product_reqres_model.dart';
import 'package:flutter_dgala/src/providers/model_sections.dart';
import 'package:flutter_dgala/src/providers/model_shoes_ofer.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

Future<CatalogoResponse> getData() async {
  final CatalogoResponse catalogoResponse;

  final response =
      await dio.Dio().get('http://10.11.14.4:5000/api/rest/v1/products');
  catalogoResponse = CatalogoResponse.fromJson(response.data);
  return catalogoResponse;
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;
  Color currentColor = Colors.transparent;
  int number = 0;
  late AnimationController _bounceController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 0.5,
    );

    if (carouselShoes[0].colors.isNotEmpty) {
      colorList = carouselShoes[0].colors;
      currentColor = Color(carouselShoes[0].colorNewPrice);
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /* final modelShoes = Provider.of<ModelShoesOfer>(context, listen: true); */
    List<int> productsId = [
      1,
      2,
      3,
    ];

    ///Details Screen
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register Screen',
        ),
      ),
      body: Stack(
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            width: 600.0,
            color: Colors.amber,
            child: ListView.builder(
              itemCount: productsId.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    final Map<String, dynamic> arguments = {
                      'id': productsId[index],
                      'pos': 'EL $index',
                    };
                    setPreferences(arguments);
                    /* Navigator.of(context).push(MaterialPageRoute(
                      settings: RouteSettings(arguments: {
                        'id': productsId[index],
                        'pos': 'EL $index',
                      }),
                      builder: (context) {
                        return const DetailScreen();
                      },
                    )); */
                    Navigator.pushNamed(
                      context,
                      '/detalles',
                      arguments: arguments,
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Text("ID: ${productsId[index]}"),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Hero(
              tag: "1",
              child: Container(
                width: 250.0,
                height: 200.0,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );

    ///tests Organizando mejor el zapato
    /* return Scaffold(
      appBar: AppBar(
        title: const Text("Organizando mejor el zapato"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 10,
                child: Container(
                  color: Colors.red,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.blueGrey,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          color: Colors.amber,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 9,
                                        child: Container(
                                          color: Colors.red,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const <Widget>[
                                              Text("data 1"),
                                              Text("data 2"),
                                              Text("data 3"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 9,
                                        child: Container(
                                          color: Colors.green,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const <Widget>[
                                              Text("data 1"),
                                              Text("data 2"),
                                              Text("data 3"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IgnorePointer(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: constraints.maxHeight * 0.1,
                                      ),
                                      child: LayoutBuilder(
                                        builder: (context, constraints) {
                                          return ClipPath(
                                            clipper: CircularPathClipper(),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                    offset: Offset(0.0, 10.0),
                                                    blurRadius: 20.0,
                                                  ),
                                                ],
                                              ),
                                              child: DottedBorder(
                                                borderType: BorderType.Circle,
                                                strokeWidth: 1.0,
                                                dashPattern: const [6, 3],
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.transparent,
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          "shoes4.png"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    ); */

    ///Ejemplo de consejos responsives, seccion 4
    /* int kbreackPoint = 900;
    bool landscape = size.width > kbreackPoint ? true : false;
    Widget child = Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child: const AutoSizeText(
              "Contacto",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: 2.0,
          color: Colors.red,
        ),
        Expanded(
          flex: 10,
          child: Container(
            color: Colors.black,
            child: ListView(
              children: const <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "subtitle asdasdjasd aksd jaks djkas dkajs djaskakjsd aks jkasdjd",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "subtitle asdasdjasd aksd jaks djkas dkajs djaskakjsd aks jkasdjd",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "subtitle asdasdjasd aksd jaks djkas dkajs djaskakjsd aks jkasdjd",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "subtitle asdasdjasd aksd jaks djkas dkajs djaskakjsd aks jkasdjd",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "subtitle asdasdjasd aksd jaks djkas dkajs djaskakjsd aks jkasdjd",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test responsive"),
      ),
      body: Container(
        color: Colors.yellow,
        child: Padding(
          padding: landscape
              ? EdgeInsets.only(
                  top: size.height * 0.08,
                  left: size.height * 0.08,
                  right: size.height * 0.08,
                  bottom: 0.0,
                )
              : EdgeInsets.only(
                  top: size.height * 0.08,
                  left: size.height * 0.08,
                  right: size.height * 0.08,
                  bottom: 0.0,
                ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 15,
                child: Container(
                  color: Colors.amber,
                  child: Flex(
                    direction: landscape ? Axis.horizontal : Axis.vertical,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.green,
                          height: landscape ? 1200 : 1500.0,
                          child: child,
                        ),
                      ),
                      SizedBox(
                        width: landscape ? size.width * 0.03 : 0,
                        height: landscape ? 0 : 10.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.red,
                          child: child,
                        ),
                      ),
                      SizedBox(
                        width: landscape ? size.width * 0.03 : 0,
                        height: landscape ? 0 : 10.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.blueGrey,
                          child: child,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: const LogoNavBar(),
                ),
              ),
            ],
          ),
        ),
      ),
    ); */

    ///ejemplo de FutureBuilder consumiendo de un api
    /* return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("FutureBuilder"),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder:
              (BuildContext context, AsyncSnapshot<CatalogoResponse> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              /* print(snapshot.data!.data.result); */
              return Catalogo(products: snapshot.data!.data.result);
            }
          },
        ),
      ),
    ); */

    ///Ejemplo de transform mousehover
    /* return Scaffold(
      appBar: AppBar(
        title: Text("transform"),
      ),
      body: Center(
        child: Transform(
          transform: Matrix4.identity()..translate(200, 200, 0),
          child: GestureDetector(
            onTap: () {
              _showInicioScreen(context);
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                width: 100.0,
                height: 50.0,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ); */

    ///Ejemplo de como el expanded es el widget perfecto para encerrar un Flex
    /* return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.amberAccent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.blue,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ); */

    ///ejemplo de animaciones
    /* return Scaffold(
      appBar: AppBar(
        title: const Text("Animations"),
      ),
      body: Center(
        child: FadeIn(
          delay: const Duration(milliseconds: 1000),
          animate: true,
          /* animate: (number > 0) ? true : false, */
          child: Bounce(
            duration: const Duration(milliseconds: 800),
            controller: (controller) {
              _bounceController = controller;
            },
            child: Container(
              width: 108.0,
              height: 108.0,
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Center(
                child: Text(
                  "$number",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FadeInRight(
        delay: const Duration(milliseconds: 1200),
        child: FloatingActionButton(
          onPressed: () {
            increment();
          },
          child: const Icon(
            Icons.add,
          ),
        ),
      ),
    ); */

    ///ejemplo de pageview con cambio de estado
    /* return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: size.height / 3,
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 300.0),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (newPage) {
                  setState(() {
                    currentPage = newPage;
                  });
                  /* setState(() {
                    currentColor = Color(carouselShoes[newPage].colorNewPrice);
                  }); */
                  colorList = carouselShoes[newPage].colors;
                  modelShoes.changeColor(0);
                },
                itemCount: carouselShoes.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 80.0),
                    decoration: BoxDecoration(
                      color: (currentPage == index)
                          ? modelShoes.color
                          : Color(carouselShoes[index].colorNewPrice),
                      /* color: (currentPage == index)
                          ? currentColor
                          : Color(carouselShoes[index].colorNewPrice), */
                    ),
                    child: Center(
                      child: Text(
                        "$currentPage",
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(Ionicons.chevron_back),
                ),
                const SizedBox(
                  width: 200.0,
                ),
                InkWell(
                  onTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(Ionicons.chevron_forward),
                ),
              ],
            ),
            Container(
              height: size.height / 3,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _controlList(modelShoes),
              ),
            ),
          ],
        ),
      ),
    ); */
  }

  /* List<Widget> _controlList(ModelShoesOfer modelShoes) {
    List<Widget> controlList = [];

    for (var i = 0; i < colorList.length; i++) {
      var element = colorList[i];
      controlList.add(MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            modelShoes.changeColor(i);
            /* setState(() {
              currentColor = Color(element);
            }); */
          },
          child: Container(
            width: 50.0,
            height: 50.0,
            margin: const EdgeInsets.only(right: 20.0),
            decoration: BoxDecoration(
                color: Color(element),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ));
    }

    return controlList;
  } */

  ///mostrar la pantalla inicio
  void _showInicioScreen(BuildContext context) {
    Navigator.of(context).pushNamed("inicio");
  }

  void increment() {
    setState(() {
      number++;

      if (number >= 1) {
        _bounceController.forward(
          from: 0.0,
        );
      }
    });
  }

  void setPreferences(Map<String, dynamic> arguments) async {
    final sharedP = await SharedPreferences.getInstance();
    sharedP.setString('arguments', json.encode(arguments));
  }
}

class Catalogo extends StatelessWidget {
  final List<Product> products;

  const Catalogo({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return BounceInDown(
          delay: Duration(milliseconds: 100 * index),
          child: ListTile(
            title: Text(product.name),
            subtitle: Text(product.gender.toString()),
          ),
        );
      },
    );
  }
}
