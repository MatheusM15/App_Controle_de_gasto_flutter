import 'package:flutter/cupertino.dart';

class Trasacao {
  final String id;
  final String titulo;
  final String des;
  final double valor;
  DateTime date;

  Trasacao(
      {@required this.id,
      @required this.titulo,
      @required this.des,
      @required this.valor,
      @required this.date});
}
