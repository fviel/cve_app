import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:cve_app/widgets/cardEmpreendimento.dart';
import 'package:cve_app/widgets/topBar.dart';
import 'package:flutter/material.dart';

// import 'dart:async';
// import 'package:flutter/widgets.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

class ListarEmpreendimentos extends StatefulWidget {
  @override
  _ListarEmpreendimentosState createState() => _ListarEmpreendimentosState();
}

class _ListarEmpreendimentosState extends State<ListarEmpreendimentos> {

  // void setupDb() async{
  //   var db = await openDatabase('my_db.db');
  //   // Get a location using getDatabasesPath
  //   var databasesPath = await getDatabasesPath();
  //   String path = join(databasesPath, 'demo.db');
  // }


  //array com valores de teste
  List<Empreendimento> empreendimentos = [
    Empreendimento(
        id: 0,
        nome: 'Teste Um Fernando',
        descricao: 'Teste de tela do Fernando',
        endereco: 'Rua dos Testes, 123, Testelandia, BR',
        valorCub: 1750.94,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
    Empreendimento(
        id: 1,
        nome: 'Teste Dois Fernando oijril j,iovjio jv,iore ',
        descricao: 'Teste de tela do Fernando',
        endereco: 'Rua dos Testes, 123, Testelandia, BR',
        valorCub: 1750.94,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
    Empreendimento(
        id: 2,
        nome: 'Teste Três Fernando',
        descricao:
            'Teste de tela do Fernando, iosfvuih iou hvuihsvui huifv hufv huidfvh uidzfh vuisdfh fvuihd uivh uihvuisdvf',
        endereco:
            'Rua dos Testes, 123, Testelandia, BR, iucbhu nsndc uindfcuibn uicn uidfncuin uicn uidnucn uids',
        valorCub: 1750.94,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
    Empreendimento(
        id: 3,
        nome: 'Teste Quatro Fernando oijril j,iovjio jv,iore ',
        descricao: 'Teste de tela do Fernando',
        endereco: 'Rua dos Testes, 123, Testelandia, BR',
        valorCub: 1750.94,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
    Empreendimento(
        id: 4,
        nome: 'Teste Cinco Fernando',
        descricao:'Teste de tela do Fernando, iosfvuih iou hvuihsvui huifv hufv huidfvh uidzfh vuisdfh fvuihd uivh uihvuisdvf',
        endereco:'Rua dos Testes, 123, Testelandia, BR, iucbhu nsndc uindfcuibn uicn uidfncuin uicn uidnucn uids',
        valorCub: 1750.94,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
    Empreendimento(
        id: 5,
        nome: 'Teste Seis Fernando oijril j,iovjio jv,iore ',
        descricao: 'Teste de tela do Fernando',
        endereco: 'Rua dos Testes, 123, Testelandia, BR',
        valorCub: 1750.94,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
  ];

  ///remove um empreendimento do array
  void removerEmpreendimento(Empreendimento emp) {
    empreendimentos.remove(emp);
  }

  ///adiciona um empreendimento com a finalidade de testes
  void adicionarEmpreendimentoTeste() {
    empreendimentos.add(Empreendimento(
        id: 7,
        nome: 'Emp adicionado para teste',
        descricao: 'Teste de tela do Fernando',
        endereco: 'Rua dos Testes, 123, Testelandia, BR',
        //cubReferencia: null,
        valorCub: 1750.94,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20));
  }

  void exibirTelaSobre() {
    //pushNamed chamaria a próxima rota, mas manteria o widget atual na stack de memória
    //Navigator.pushNamed(context, '/home');
    //já  pushReplacementNamed, irá remover o widget atual da stack e colocar o novo
    Navigator.pushReplacementNamed(context, '/sobre', arguments: {});
  }

  void exibirTelaExibirEmpreendimento(Empreendimento emp) {
    //pushNamed chamaria a próxima rota, mas manteria o widget atual na stack de memória
    //Navigator.pushNamed(context, '/home');
    //já  pushReplacementNamed, irá remover o widget atual da stack e colocar o novo
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'empreendimento': emp,
    });
  }

  void exibirTelaNovoEmpreendimento() {
    //Navigator.pushReplacementNamed(context, '/adicionar');
    Navigator.pushNamed(context, '/adicionar');
  }













  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: TopBar(),
        centerTitle: false,
        backgroundColor: Colors.red,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(
                Icons.settings,
                color: Colors.grey[800],
                size: 20.0,
              ),
              label: Text(
                'Config',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[800],
                ),
              ),
              onPressed: () {
                //widget.telaASerExibida();
              }),
          FlatButton.icon(
            icon: Icon(
              Icons.assignment_ind,
              color: Colors.grey[800],
              size: 20.0,
            ),
            label: Text(
              'Sobre',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey[800],
              ),
            ),
            onPressed: () async {
              dynamic result = await Navigator.pushNamed(context, '/sobre');
              if (result != null) {
                ///setState(() {
                //                       //dados recebe um map
                //                       dados = {
                //                         'time': result['time'],
                //                         'location': result['location'],
                //                         'isDayTime': result['isDayTime'],
                //                         'flag': result['flag'],
                //                       };
                //                     });
                print('ok');
              }
            },
          ),
        ],
      ),
      body: ListView(
        //
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,

        //mapeia cada objeto do array em um card
        children: empreendimentos
            .map((empreendimento) => new CardEmpreendimento(
                empreendimento: empreendimento,
                delete: () {
                  setState(() {
                    //empreendimentos.remove(empreendimento);
                    removerEmpreendimento(empreendimento);
                  });
                }))
            .toList(),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        splashColor: Colors.white,
        backgroundColor: Colors.redAccent,
        child: IconButton(
          onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/adicionar');
            //     // if (result != null) {
            //     //   //setState(() {});
            //     // }
            //   },
          },
          icon: Icon(Icons.add),
          color: Colors.white,
        ),
      ),


      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () async {
      //     dynamic result = await Navigator.pushNamed(context, '/adicionar');
      //     // if (result != null) {
      //     //   //setState(() {});
      //     // }
      //   },
      //   label: Icon(Icons.add),
      //   splashColor: Colors.redAccent,
      //  // icon: const Icon(Icons.add),
      //   backgroundColor: Colors.red,
      // ),
    );
  }
}
