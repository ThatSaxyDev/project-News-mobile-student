import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';

void showAlert(BuildContext context, String text) {
  CherryToast.info(
          title: Text(text),
          animationDuration: const Duration(milliseconds: 1000),
          autoDismiss: true)
      .show(context);
}