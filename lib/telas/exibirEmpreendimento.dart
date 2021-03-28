import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:flutter/material.dart';
import 'package:cve_app/widgets/topBar.dart';

class ExibirEmpreendimento extends StatefulWidget {
  @override
  _ExibirEmpreendimentoState createState() => _ExibirEmpreendimentoState();
}

class _ExibirEmpreendimentoState extends State<ExibirEmpreendimento> {

   Empreendimento empreendimento = new Empreendimento();
  @override
  Widget build(BuildContext context) {

    //dados recebe os argumentos ao abrir esta tela
    //sempre rodo o build no ststate, então, se o array de dados estiver preenchido, usa ele, senão roteia pra tela
    empreendimento = empreendimento == null ? empreendimento : ModalRoute.of(context).settings.arguments ;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: TopBar(),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.settings,
                  color: Colors.grey[800],
                  size: 20.0,),
                label: Text('Config',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[800],
                  ),),
                onPressed: () {
                  //widget.telaASerExibida();
                }),
          ],
        ),
        body: Card(
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.architecture,
                    color: Colors.redAccent,
                    size: 30.0,
                  ),
                  title: Text(
                    empreendimento.nome,
                    style: TextStyle(
                      fontSize: 18.0,
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
                      onPressed: (){},
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
                      onPressed: (){},
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
        )
    );
  }
}
