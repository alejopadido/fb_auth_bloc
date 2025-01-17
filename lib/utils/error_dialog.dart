import 'dart:io';

import 'package:fb_auth_bloc/models/custom_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void errorDialog(BuildContext context, CustomError e) {
  print('code: ${e.code}\nmessage: ${e.message}\nplugin: ${e.plugin}\n');

  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(e.code),
        content: Text(e.plugin + '\n' + e.message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  } else {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(e.code),
        content: Text(e.plugin + '\n' + e.message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
