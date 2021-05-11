import 'package:flutter/material.dart';
import 'dados/transacao.dart';
import 'package:intl/intl.dart';

class Trali extends StatelessWidget {
  final List<Trasacao> tra;
  final void Function(String) remove;
  Trali(this.tra, this.remove);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: tra.isNotEmpty
          ? ListView.builder(
              itemCount: tra.length,
              itemBuilder: (context, index) {
                final tr = tra[index];
                return Card(
                  elevation: 5,
                  child: InkWell(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: FittedBox(
                            child: Text(
                              tr.valor.toString().length >= 8
                                  ? '${tr.valor.toString().substring(0, tr.valor.toString().length - 5)}K'
                                  : '${tr.valor.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.titulo,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => remove(tr.id),
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      print('teste');
                    },
                  ),
                );
              },
            )
          : Column(
              children: [
                Text(
                  'Não ha gasto cadastrado',
                  style: TextStyle(fontSize: 20),
                ),
                Image.asset(
                  'assets/imagem/get-cash.png',
                  width: 100,
                  height: 100,
                )
              ],
            ),
    );
  }
}
