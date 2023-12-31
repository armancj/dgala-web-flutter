import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          InkWell(
            child: const Icon(Icons.close),
            onTap: () {
              return Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
