import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dados/transacao.dart';
import 'formulario.dart';
import 'grafico.dart';
import 'tr_list.dart';

void main() => runApp(MaterialApp(
      title: 'Orçamento mensal',
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Trasacao> tra = [];
  double valorI = 100;
  final AppBar appBar = AppBar(
    title: Center(child: Text('Orçamento mensal')),
  );

  _addTra(String titulo, double valor, String descricao, DateTime data) {
    final newTra = Trasacao(
        id: Random().nextDouble().toString(),
        titulo: titulo,
        des: descricao,
        valor: valor,
        date: data);
    setState(() {
      tra.add(newTra);
    });
    Navigator.pop(context);
  }

  _delete(String id) {
    setState(() {
      tra.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }

  _openFormulario(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Formulario(_addTra);
        });
  }

  @override
  Widget build(BuildContext context) {
    final avaibleHei = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return MaterialApp(
      theme: ThemeData(
          accentColor: Colors.amber,
          primaryColor: Colors.black,
          fontFamily: 'Anton Regular'),
      home: Scaffold(
        appBar: appBar,
        backgroundColor: Colors.grey,
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.grey[400],
                    elevation: 5,
                    child: Container(
                      height: avaibleHei * 0.5,
                      child: Grafico(
                        key: GlobalKey(),
                        tra: tra,
                        valorI: valorI.toString(),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: avaibleHei * 0.5,
                  child: Trali(tra, _delete),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openFormulario(context),
          backgroundColor: Colors.black45,
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
