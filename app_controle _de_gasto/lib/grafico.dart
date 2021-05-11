import 'package:flutter/material.dart';
import 'dados/transacao.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class Grafico extends StatefulWidget {
  final List<Trasacao> tra;
  final String valorI;
  Grafico({Key key, this.tra, this.valorI}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<Grafico> {
  get valor => double.parse(widget.valorI);

  _porcentagem() {
    double total = 0;
    double aux = 0;
    for (int i = 0; i < widget.tra.length; i++) {
      total = total + widget.tra[i].valor;
    }
    aux = valor - total;
    return (aux * 100) / valor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.tra.isNotEmpty
          ? Column(
              children: [
                Text(
                  'Valor inicial'.toUpperCase() + valor.toString(),
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                AnimatedCircularChart(
                  size: const Size(225, 225),
                  initialChartData: <CircularStackEntry>[
                    CircularStackEntry(<CircularSegmentEntry>[
                      CircularSegmentEntry(_porcentagem(), Colors.white)
                    ])
                  ],
                  percentageValues: true,
                  holeLabel: _porcentagem().toStringAsFixed(0) + '%',
                ),
              ],
            )
          : InkWell(
              child: Column(
                children: [
                  AnimatedCircularChart(
                    size: const Size(225, 225),
                    initialChartData: <CircularStackEntry>[
                      CircularStackEntry(<CircularSegmentEntry>[
                        CircularSegmentEntry(100, Colors.white)
                      ])
                    ],
                    holeLabel: 'Clique para inserir\n um valor Inicial',
                  )
                ],
              ),
              onTap: () {
                print('teste');
              },
            ),
    );
  }
}
