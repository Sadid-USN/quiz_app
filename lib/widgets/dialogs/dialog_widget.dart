import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singlton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() {
    return _singlton;
  }

  static Widget startDialog({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Отлично!',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          Text(
            'Пожалуйста войдите в систему, прежде чем начать',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onTap,
          child: const Text('Подтвердить '),
        ),
      ],
    );
  }
}
