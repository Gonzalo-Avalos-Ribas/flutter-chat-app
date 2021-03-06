import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostrarAlerta(BuildContext context, String titulo, String subtitulo) {
  if (Platform.isAndroid) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(titulo),
              content: Text(subtitulo),
              actions: [
                MaterialButton(
                  elevation: 5,
                  child: Text('Ok'),
                  textColor: Colors.blue,
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ));
  } else {
    showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
                title: Text(titulo),
                content: Text(subtitulo),
                actions: [
                  CupertinoDialogAction(
                    child: Text('OK'),
                    isDefaultAction: true,
                    onPressed: () => Navigator.pop(context),
                  )
                ]));
  }
}
