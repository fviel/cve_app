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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              leading: Icon(
                // Icons.architecture,
                Icons.business,
                color: Colors.redAccent,
                size: 30.0,
              ),
              title: Text(
                empreendimento.nome,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                empreendimento.descricao,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[500],
                ),
              ),
            ),
            SizedBox(height: 6),
            Row(children: <Widget>[
              //usei o expanded para manter o texto de endereço dentro do tamanho da linha
              Expanded(
                child: Text(
                  empreendimento.endereco,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ]),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/exibirEmpreendimento', arguments: empreendimento);
                    if(result != null) {
                      //setState(() {});
                    }
                  },
                  label: Text(
                    'Exibir',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[700],
                    ),
                  ),
                  icon: Icon(
                    Icons.remove_red_eye_sharp,
                    color: Colors.grey[700],
                    size: 20.0,
                  ),
                ),

                SizedBox(width: 2),
                FlatButton.icon(
                  onPressed: delete,
                  label: Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[800],
                    ),
                  ),
                  icon: Icon(
                    Icons.delete,
                    color: Colors.grey[800],
                    size: 20.0,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
