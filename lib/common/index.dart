import 'package:flutter/material.dart';

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(label: '关闭', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
}
