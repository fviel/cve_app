import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:cve_app/widgets/card_emp.dart';
import 'package:flutter/material.dart';

class ListarEmpreendimentos extends StatefulWidget {
  @override
  _ListarEmpreendimentosState createState() => _ListarEmpreendimentosState();
}

class _ListarEmpreendimentosState extends State<ListarEmpreendimentos> {
  //array com valores de teste
  List<Empreendimento> empreendimentos = [
    Empreendimento(
        nome: 'Teste Um Fernando',
        descricao: 'Teste de tela do Fernando',
        endereco: 'Rua dos Testes, 123, Testelandia, BR',
        cubReferencia: null,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
    Empreendimento(
        nome: 'Teste Dois Fernando oijril j,iovjio jv,iore ',
        descricao: 'Teste de tela do Fernando',
        endereco: 'Rua dos Testes, 123, Testelandia, BR',
        cubReferencia: null,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),

    Empreendimento(
        nome: 'Teste Três Fernando',
        descricao: 'Teste de tela do Fernando, iosfvuih iou hvuihsvui huifv hufv huidfvh uidzfh vuisdfh fvuihd uivh uihvuisdvf',
        endereco: 'Rua dos Testes, 123, Testelandia, BR, iucbhu nsndc uindfcuibn uicn uidfncuin uicn uidnucn uids',
        cubReferencia: null,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
    Empreendimento(
        nome: 'Teste Quatro Fernando oijril j,iovjio jv,iore ',
        descricao: 'Teste de tela do Fernando',
        endereco: 'Rua dos Testes, 123, Testelandia, BR',
        cubReferencia: null,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),

    Empreendimento(
        nome: 'Teste Cinco Fernando',
        descricao: 'Teste de tela do Fernando, iosfvuih iou hvuihsvui huifv hufv huidfvh uidzfh vuisdfh fvuihd uivh uihvuisdvf',
        endereco: 'Rua dos Testes, 123, Testelandia, BR, iucbhu nsndc uindfcuibn uicn uidfncuin uicn uidnucn uids',
        cubReferencia: null,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
    Empreendimento(
        nome: 'Teste Seis Fernando oijril j,iovjio jv,iore ',
        descricao: 'Teste de tela do Fernando',
        endereco: 'Rua dos Testes, 123, Testelandia, BR',
        cubReferencia: null,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
  ];

  removerEmpreendimento(Empreendimento emp){
    empreendimentos.remove(emp);
  }

  Widget obtemAppBar() {
    return Row(
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
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: obtemAppBar(),
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
        backgroundColor: Colors.red,
        child: IconButton(
          onPressed: () {
            setState(() {
              //comando para remover frase do vetor
              //frases.remove(frase);
              //adicionarFraseAleatoria();
            });
          },
          icon: Icon(Icons.add),
          color: Colors.white,
        ),
      ),
    );
  }
}
