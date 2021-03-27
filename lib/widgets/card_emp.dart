import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:flutter/material.dart';

///representa um cartão de empreendimento
class CardEmpreendimento extends StatelessWidget {
  // frase precisa ser final, pois este objeto é stateless, e após criado, não pode ser alterado
  final Empreendimento empreendimento;

  final Function delete;

  //só declarei a função para receber como parâmetro lá na main
  //ou seja, o código dela não está nem nessa classe
  CardEmpreendimento({this.empreendimento, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.announcement,
                  color: Colors.red[300],
                  size: 14.0,
                ),
                SizedBox(width: 2),
                Text(
                  empreendimento.nome,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                  ),
                ),


              ],
            ),
            SizedBox(height: 6),
            Text(
              empreendimento.descricao,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 8.0,
                color: Colors.grey[800],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 8.0),

            SizedBox(height: 6),
            Text(
              empreendimento.endereco,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 8.0,
                color: Colors.grey[800],
                letterSpacing: 2.0,
              ),
            ),

            SizedBox(height: 6),
            Text(
              empreendimento.dtHrCriacao.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 8.0,
                color: Colors.grey[800],
                letterSpacing: 2.0,
              ),
            ),


            FlatButton.icon(
              onPressed: delete,
              label: Text('Delete'),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
