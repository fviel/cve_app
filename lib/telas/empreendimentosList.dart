import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:cve_app/widgets/card_emp.dart';
import 'package:flutter/material.dart';

class EmpreendimentosList extends StatefulWidget {
  @override
  _EmpreendimentosListState createState() => _EmpreendimentosListState();
}

class _EmpreendimentosListState extends State<EmpreendimentosList> {
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
        nome: 'Teste Dois Fernando',
        descricao: 'Teste de tela do Fernando',
        endereco: 'Rua dos Testes, 123, Testelandia, BR',
        cubReferencia: null,
        areaTerreno: 20.50,
        taxaOcupacao: 15.5,
        coeficienteAproveitamento: 10.3,
        valorComercialTerreno: 100040.20),
  ];

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
          'Valor de Empreendimentos',
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
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        //
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,

        //mapeia cada objeto do array em um card
        children: empreendimentos
            .map((empreendimento) => new CardEmpreendimento(
                empreendimento: empreendimento,
                delete: () {
                  setState(() {
                    //comando para remover frase do vetor
                    //frases.remove(frase);
                    //removerFrase(frase);
                  });
                }))
            .toList(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: IconButton(
      //     onPressed: () {
      //       setState(() {
      //         //comando para remover frase do vetor
      //         //frases.remove(frase);
      //         //adicionarFraseAleatoria();
      //       });
      //     },
      //     icon: Icon(Icons.add),
      //     color: Colors.amberAccent,
      //   ),
      // ),
    );
  }
}
