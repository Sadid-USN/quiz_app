import 'package:flutter/material.dart';
import 'package:quizapp/configs/themes/dark_end_light_theme.dart';

class Dialogs {
  static final Dialogs _singlton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() {
    return _singlton;
  }

  static Widget startDialog({
    required VoidCallback onTap,
    required VoidCallback cancel,
  }) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Center(
            child: Text(
              'Отлично!',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: startPrimaryColorLight),
            ),
          ),
          Text(
            'Пожалуйста зарегистрируйтесь, прежде чем начать игру',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: cancel,
          child: const Text('Назад'),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text('Регистрация'),
        ),
      ],
    );
  }
}
