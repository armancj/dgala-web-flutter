import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/common/app_colors.dart';
import 'package:flutter_dgala/src/providers/model_sections.dart';
import 'package:flutter_dgala/src/screens/detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dgala/src/providers/model_shoes_ofer.dart';
import 'package:flutter_dgala/src/screens/landing_page_screen.dart';
import 'package:flutter_dgala/src/screens/register_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ModelShoesOfer()),
        ChangeNotifierProvider(create: (context) => ModelSections()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Netverbatim",
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(AppColors.atention),
          ),
        ),
        title: "D'GALA",
        initialRoute: "inicio",
        routes: {
          "inicio": (BuildContext context) => const LandingScreem(),
          "/entrar": (BuildContext context) => const RegisterScreen(),
          "/registro": (BuildContext context) => const RegisterScreen(),
          "/detalles": (BuildContext context) => const DetailScreen(),
        },
      ),
    );
  }
}
