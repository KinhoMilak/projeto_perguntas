import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Resposta extends StatelessWidget {
  final String? texto;
  final void Function() onSelected;

  Resposta(this.texto, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(texto!),
        onPressed: onSelected,
        style: ElevatedButton.styleFrom(),
      ),
    );
  }
}
