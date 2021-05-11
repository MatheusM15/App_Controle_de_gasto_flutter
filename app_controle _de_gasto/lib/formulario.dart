import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formulario extends StatefulWidget {
  final void Function(String, double, String, DateTime) submit;
  Formulario(this.submit);
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  _submiter() {
    final title = titulo.text;
    final des = descricao.text;
    final val = double.tryParse(valor.text) ?? 0;

    if (title.isEmpty || des.isEmpty || val < 0) {
      return;
    }
    return widget.submit(title, val, des, data);
  }

  _calendario() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((datePicked) {
      if (datePicked == null) {
        return;
      }
      setState(() {
        data = datePicked;
      });
    });
  }

  final titulo = TextEditingController();
  final descricao = TextEditingController();
  final valor = TextEditingController();
  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            TextField(
              controller: titulo,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: descricao,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            TextField(
              controller: valor,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submiter(),
              decoration: InputDecoration(labelText: 'Valor'),
            ),
            Row(children: [
              Expanded(
                  child: Text('Data: ${DateFormat('d MMM y').format(data)}')),
              FlatButton(
                  onPressed: _calendario,
                  child: Text(
                    'Selecionar uma data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                    color: Colors.black,
                    onPressed: _submiter,
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
