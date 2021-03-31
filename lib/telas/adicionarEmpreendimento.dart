import 'package:cve_app/empreendimentos/business/empreendimentoBusiness.dart';
import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:cve_app/gestorcub/entities/cub.dart';
import 'package:cve_app/widgets/dropDownExemplo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cve_app/widgets/topBar.dart';
import 'package:intl/intl.dart';

//TODO Pesquisar como usar controller? qual a vantagem?
///https://stackoverflow.com/questions/53667793/what-are-controllers-in-flutter#:~:text=In%20flutter%2C%20controllers%20are%20a,pattern%20stuff%20and%20increase%20performances.

//TODO Pesquisar sobre o dispose() para evitar memory leak

class AdicionarEmpreendimento extends StatefulWidget {
  @override
  _AdicionarEmpreendimentoState createState() => _AdicionarEmpreendimentoState();
}

class _AdicionarEmpreendimentoState extends State<AdicionarEmpreendimento> {
  final _formKey = GlobalKey<FormState>();


  Empreendimento novoEmp = Empreendimento();

  EmpreendimentoBusiness empBusiness = new EmpreendimentoBusiness();

  List<Cub> cubs = [
    Cub(padrao:'Baixo',
        classificacao: 'R-1',
        valor: 1722.89,
        tipoProjeto:0,
        estado:'PR',
        desonerado:false),

    Cub(padrao:'Baixo',
        classificacao: 'PP-4',
        valor: 1604.95,
        tipoProjeto:0,
        estado:'PR',
        desonerado:false),

    Cub(padrao:'Baixo',
        classificacao: 'R-8',
        valor: 1529.39,
        tipoProjeto:0,
        estado:'PR',
        desonerado:false),

    Cub(padrao:'Baixo',
        classificacao: 'PIS',
        valor: 1224.99,
        tipoProjeto:0,
        estado:'PR',
        desonerado:false)
  ];

  final List<String> classificacoes = <String>['R-1', 'PP-4', 'R-8', 'PIS' ];
  String _classificacaoSelecionada = "";

  Cub _cubSelecionado;

  /// initialization is here:
  @override
  void initState() {
    _classificacaoSelecionada = classificacoes[0];
    _cubSelecionado = new Cub(padrao:'pobre',
      classificacao:'ruim',
      valor:0,
      tipoProjeto:0,
      estado:'PR',
      desonerado:false);

    novoEmp = Empreendimento(nome:'Novo Empreendimento',

    descricao: 'Descrição',
    endereco:'Endereço',
    cubReferencia:new Cub(padrao:'Baixo',
    classificacao: 'PIS',
    valor: 1224.99,
    tipoProjeto:0,
    estado:'PR',
    desonerado:false),
    areaTerreno:0,
    taxaOcupacao:0,
    coeficienteAproveitamento:0,
    valorComercialTerreno:0);
  }

  @override
  Widget build(BuildContext context) {

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
        body: Padding(
          padding: const EdgeInsets.all(12.0),

          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children:<Widget>[

                          SizedBox(height: 6.0),
                          TextFormField(
                            //usa a constante que criei lá em shared, mas trocando a var de hint
                            //decoration: textInputDecorationFernando.copyWith(hintText: 'Email'),
                            decoration:InputDecoration(
                              hintText: 'Nome:',
                            ),
                            //validator é a função que valida o campo
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Informe um nome';
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                //mapeia o conteúdo deste campo na var password
                                novoEmp.nome = val;
                              });
                            },
                          ),


                          SizedBox(height: 6.0),
                          TextFormField(
                            //usa a constante que criei lá em shared, mas trocando a var de hint
                            //decoration: textInputDecorationFernando.copyWith(hintText: 'Email'),
                            decoration:InputDecoration(
                              hintText: 'Descrição:',
                            ),
                            //validator é a função que valida o campo
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Informe uma descrição para o empreedimento';
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                //mapeia o conteúdo deste campo na var password
                                novoEmp.descricao = val;
                              });
                            },
                          ),



                          SizedBox(height: 6.0),
                          TextFormField(
                            //usa a constante que criei lá em shared, mas trocando a var de hint
                            //decoration: textInputDecorationFernando.copyWith(hintText: 'Email'),
                            decoration:InputDecoration(
                              hintText: 'Endereço:',
                            ),
                            //validator é a função que valida o campo
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Informe um endereço';
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() {
                                //mapeia o conteúdo deste campo na var password
                                novoEmp.endereco = val;
                              });
                            },
                          ),

                          SizedBox(height: 6.0),
                                                    //TODO separar o dropdown como um widget em outro arquivo, como fiz no dropDown exemplo
                                                    //DropdownExample(),
                          DropdownButtonFormField(
                            //decoration: textInputDecorationFernando,
                            value: _classificacaoSelecionada,
                            onChanged: (val) => setState(() => _classificacaoSelecionada = val),
                            items: classificacoes.map((cItem) => DropdownMenuItem(value: cItem.toString(), child:Text(cItem),)).toList(),
                            // items: classificacoes.map((classi) {
                            //   return DropdownMenuItem<String>(
                            //     value: classi,
                            //     child: Text(classi),
                            //   );
                            // }).toList(),
                          ),






                        ]
                      ),
                    ),
                  )
                ]),
          ),
        )
    );
  }
}
