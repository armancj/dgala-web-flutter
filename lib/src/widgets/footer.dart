import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dgala/src/widgets/logo_navbar.dart';
import 'package:ionicons/ionicons.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //*************** variables para la seccion 4 */
    final size = MediaQuery.of(context).size;
    int kbreackPoint = 900;
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
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          flex: 10,
          child: Container(
            color: Colors.transparent,
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
    //*************** variables para la seccion 4 */

    return Container(
      color: Colors.transparent,
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
                color: Colors.transparent,
                child: Flex(
                  direction: landscape ? Axis.horizontal : Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                        height: landscape ? 1200 : 1500.0,
                        child: _getContacto(),
                      ),
                    ),
                    SizedBox(
                      width: landscape ? size.width * 0.03 : 0,
                      height: landscape ? 0 : 10.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                        child: _getCEOS(),
                      ),
                    ),
                    SizedBox(
                      width: landscape ? size.width * 0.03 : 0,
                      height: landscape ? 0 : 10.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.transparent,
                        child: _getLawAdvice(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: FittedBox(
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: const LogoNavBar(),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        alignment: Alignment.center,
                        child: const AutoSizeText(
                          "D'Gala.SA - 2023 v1.0.1 © derechos reservados.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 8.0,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getContacto() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          flex: 10,
          child: Container(
            color: Colors.transparent,
            child: ListView(
              children: const <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  title: Text(
                    "Direccion:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "Calle Ramón Ortuño / Rafael Martinez y José Mastrapa, Rpto. El Pueblo, Las Tunas Cuba.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Ionicons.logo_google,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  title: Text(
                    "Coordenadas googlemaps",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "#0505050505-5050789990",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  title: Text(
                    "Correo electrónico",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "dgala@gmail.com",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Ionicons.logo_facebook,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  title: Text(
                    "Faceboock",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "dgala@faceboock.com",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Ionicons.logo_instagram,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  title: Text(
                    "Instagram",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "dgala@instagram.com",
                    style: TextStyle(
                      fontSize: 12,
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
  }

  Widget _getCEOS() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child: const AutoSizeText(
              "CEOs",
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
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          flex: 10,
          child: Container(
            color: Colors.transparent,
            child: ListView(
              children: const <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.manage_accounts,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  title: Text(
                    "Jefe de Marketing:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "Jose Loverlan Martello",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.manage_accounts,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  title: Text(
                    "Jefe de Logística",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "Armando Lumiere Levons",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.manage_accounts,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  title: Text(
                    "Jefe de RR.HH",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "Amalaia Larabel Studemark",
                    style: TextStyle(
                      fontSize: 12,
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
  }

  Widget _getLawAdvice() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child: const AutoSizeText(
              "Avizo legal",
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
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          flex: 10,
          child: Container(
            color: Colors.transparent,
            child: ListView(
              children: const <Widget>[
                ListTile(
                  title: Text(
                    "Pasarela de pago:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "ENZONA",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Uso de Cookies:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "Configuración de cookies",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Política de privacidad:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "D'Gala company.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,
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
  }
}
