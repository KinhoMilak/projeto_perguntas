import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() reIniQuestionario;

  Resultado(this.nota, this.reIniQuestionario);

  String get fraseResult {
    if (nota < 5) {
      return 'Péssimo';
    } else if (nota < 10) {
      return 'Nada mal';
    } else if (nota < 50) {
      return 'Muito bem';
    } else {
      return 'Extreme Victory';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResult,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: reIniQuestionario,
          child: const Text(
            'Reiniciar',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
