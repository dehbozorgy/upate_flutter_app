import 'package:flutter/material.dart';

Future showMessageBox(context,child) async {

  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    insetPadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    elevation: 0,
    content: child,
  );

  return await showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: true,
      builder: (context){
        return alertDialog;
      }
  );

}