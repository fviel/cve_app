import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:cve_app/shared/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:cve_app/utils/databasehelper.dart';
import 'package:sqflite/sqflite.dart';

import 'package:cve_app/telas/exibirEmpreendimento.dart';
import 'package:cve_app/telas/adicionarEmpreendimento.dart';
import 'package:cve_app/telas/sobre.dart';

class ListarEmpreendimentos extends StatefulWidget {
  @override
  _ListarEmpreendimentosState createState() => _ListarEmpreendimentosState();
}

class _ListarEmpreendimentosState extends State<ListarEmpreendimentos> {
  //helper do db para chamar o métodos
  final DatabaseHelper dbHelper = DatabaseHelper();

  //lista de notas a serem exibidas
  List<Empreendimento> empreendimentoList;
  int count = 0;

  //usando métodos separados, fica mais limpo o código da tela
  @override
  Widget build(BuildContext context) {
    //inicialização da list de notas
    if (empreendimentoList == null) {
      empreendimentoList = <Empreendimento>[];
      //atualiza a lista de notas com o BD
      updateListView();
    }
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: getAppBar(),
      body: getEmpreendimentoListView(),
      floatingActionButton: getFloatingButton(),
    );
  }

  ///Método para retornar a lista de cards
  Container getEmpreendimentoListView() {
    //define um stylo de texto
    TextStyle titleStyle = Theme.of(context).textTheme.subtitle1;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFF2F2F2), Color(0xFFA6A6A6)]
        ),
      ),
      child: ListView.builder(
          itemCount: count,
          itemBuilder: (BuildContext context, int position) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:2, horizontal:2),
              child: Card(
                  color: Colors.white,
                  elevation: 5.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      child: Icon(Icons.apartment, color: Colors.blue[900]),
                    ),
                    title: Text(this.empreendimentoList[position].nome,
                        style: titleStyle),
                    subtitle: Text(this.empreendimentoList[position].descricao),

                    ///O GestureDetector consegue identificar eventos no elemento
                    ///que originalmente não os detecta
                    trailing: GestureDetector(
                      child: Icon(Icons.delete, color: Colors.grey),
                      onTap: () {
                        _excluir(context, this.empreendimentoList[position]);
                      },
                    ),
                    onTap: () {
                      debugPrint('clicou no card');
                      navegarParaDetalhesCard(
                          this.empreendimentoList[position]);
                    },
                  )),
            );
          }),
    );
  }

  ///Método para retornar o floating button da página e limpar o código do style
  FloatingActionButton getFloatingButton() {
    return FloatingActionButton(
        onPressed: () {
          //debugPrint('clicou no floating');
          // await Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return EmpreendimentoDetail();
          // }));
          navegarParaAdicionarEmpreendimento();
        },
        tooltip: 'Adicionar nota',
        child: Icon(
          Icons.add,
        ));
  }

  //retorna o appBar da tela
  AppBar getAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.apartment,
            color: Colors.white,
            size: 20.0,
          ),
          SizedBox(width: 2),
          Text(
            'Empreendimentos',
            // style: TextStyle(
            //   fontSize: 16.0,
            //   color: Colors.white,
            ////;
            ),
        ],
      ),
        actions: <Widget>[

          TextButton.icon(
            icon: Icon(
              Icons.assignment_ind,
              color: Colors.grey[300],
              size: 20.0,
            ),
            label: Text(
              'Sobre',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[300],
              ),
            ),
            onPressed: () async {
              bool resultado = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Sobre();
              }));
              if (resultado) {
                updateListView();
              }
            },
          ),
        ],
    );
  }

  void navegarParaDetalhesCard(Empreendimento empreendimento) async {
    //o bool resultado recebe o valor que foi passado no pop da tela de detalhes
    bool resultado = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ExibirEmpreendimento(empreendimento);
    }));
    if (resultado) {
      updateListView();
    }
  }

  void navegarParaAdicionarEmpreendimento() async {
    //o bool resultado recebe o valor que foi passado no pop da tela de detalhes
    bool resultado = await Navigator.push(
        context, MaterialPageRoute(builder: (context) {
      return AdicionarEmpreendimento();
    }));
    if (resultado) {
      updateListView();
    }
  }

  ///Excluir no BD a nota selecionada
  void _excluir(BuildContext context, Empreendimento empreendimento) async {
    int resultado = await dbHelper.delete(empreendimento.id);
    if (resultado != 0) {
      //exibe a mensagem
      _showSnackBar(context, '${empreendimento.nome} excluído com sucesso');
      //Atualizar o listview com as notas
      updateListView();
    }
  }

  ///exibe a mensagem de delete na tela do usuário
  void _showSnackBar(BuildContext context, String mesg) {
    final snackBar = SnackBar(content: Text(mesg));
    //Scaffold.of(context).showSnackBar(snackbar); // deprecado!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ///Carrega toda a lista d enotas do BD
  void updateListView() {
    //inicializa o BD
    final Future<Database> dbFuture = dbHelper.initializeDatabase();
    dbFuture.then((database) {
      //após inicializado, obtém a lista de notas
      Future<List<Empreendimento>> empreendimentoListFuture =
          dbHelper.getListaEmpreendimentos();
      //atualiza a tela atual, após carregar a lista de notas
      empreendimentoListFuture.then((empreendimentoList) {
        setState(() {
          this.empreendimentoList = empreendimentoList;
          this.count = empreendimentoList.length;
        });
      });
    });
  }
}
