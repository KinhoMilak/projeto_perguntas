import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

main() => runApp(PreguntaApp());

class _PerguntaAppState extends State<PreguntaApp> {
  var _perguntaSelecionada = 0;
  var _notaTotal = 0;
  final List<Map<String, Object>> _pergunta = const [
    {
      'texto': 'Qual sua cor favorita?',
      'resposta': [
        {'texto': 'Azul', 'nota': 2},
        {'texto': 'Amarelo', 'nota': 5},
        {'texto': 'Vermelho', 'nota': 10},
        {'texto': 'Verde', 'nota': 11},
      ]
    },
    {
      'texto': 'Qual seu animal favorito',
      'resposta': [
        {'texto': 'Turtle', 'nota': 12},
        {'texto': 'Coelho', 'nota': 6},
        {'texto': 'gato', 'nota': 2},
        {'texto': 'Cachorro', 'nota': 1},
      ]
    },
    {
      'texto': 'Numero da sorte',
      'resposta': [
        {'texto': '1', 'nota': 15},
        {'texto': '2', 'nota': 100},
        {'texto': '3', 'nota': 06},
        {'texto': '4', 'nota': 2},
      ]
    },
    {
      'texto': 'Em que ano nasceu Jasmine?',
      'resposta': [
        {'texto': '1998', 'nota': 50},
        {'texto': '2008', 'nota': 3},
        {'texto': '1987', 'nota': -4},
        {'texto': '1564', 'nota': -8},
      ]
    }
  ];

  bool get temPerguntaSel {
    return _perguntaSelecionada < _pergunta.length;
  }

  void _responder(int nota) {
    if (temPerguntaSel) {
      setState(() {
        _perguntaSelecionada++;
        _notaTotal += nota;
      });
    }
  }

  void _reQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _notaTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pergunta'),
        ),
        body: temPerguntaSel
            ? Questionario(
                pergunta: _pergunta,
                perguntaSelecionada: _perguntaSelecionada,
                onResponder: _responder,
              )
            : Resultado(_notaTotal, _reQuestionario),
      ),
    );
  }
}

class PreguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
