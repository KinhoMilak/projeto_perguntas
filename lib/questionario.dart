import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'dart:ui';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> pergunta;
  final void Function(int) onResponder;

  bool get temPerguntaSel {
    return perguntaSelecionada < pergunta.length;
  }

  Questionario(
      {required this.pergunta,
      required this.perguntaSelecionada,
      required this.onResponder});
  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSel
        ? pergunta[perguntaSelecionada].cast()['resposta']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: <Widget>[
        Questao(pergunta[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((e) {
          return Resposta(
            e['texto'] as String,
            () => onResponder(int.parse(e['nota'].toString())),
          );
        }),
      ],
    );
  }
}
