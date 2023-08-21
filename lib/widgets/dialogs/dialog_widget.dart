import 'package:flutter/material.dart';
import 'package:quizapp/configs/themes/dark_end_light_theme.dart';
import 'package:quizapp/generated/l10n.dart';

class Dialogs {
  static final Dialogs _singlton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() {
    return _singlton;
  }

  static Widget startDialog({
    required VoidCallback onTap,
    required VoidCallback cancel,
    required BuildContext context,
  }) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Center(
            child: Text(
              S.of(context).great,
              style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: startPrimaryColorLight),
            ),
          ),
          Text(
            S.of(context).loginAccount,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: cancel,
          child:  Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: onTap,
          child:  Text(S.of(context).login),
        ),
      ],
    );
  }
}
