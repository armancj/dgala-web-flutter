import 'package:flutter/material.dart';

class ModelSections with ChangeNotifier {
  GlobalKey<State<StatefulWidget>> itemKeyInicio = GlobalKey();
  GlobalKey<State<StatefulWidget>> itemKeyNosotros = GlobalKey();
  GlobalKey<State<StatefulWidget>> itemKeyCatalogo = GlobalKey();
  GlobalKey<State<StatefulWidget>> itemKeyContacto = GlobalKey();

  Future scrollToItem(itemKey) async {
    final context = itemKey.currentContext!;

    await Scrollable.ensureVisible(
      context,
      alignment: 0.5,
      duration: const Duration(milliseconds: 1400),
      curve: Curves.easeInOut,
    );
  }
}
