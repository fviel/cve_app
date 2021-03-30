import 'package:cve_app/empreendimentos/business/empreendimentoBusiness.dart';
import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cve_app/widgets/topBar.dart';
import 'package:intl/intl.dart';


class AdicionarEmpreendimento extends StatefulWidget {
  @override
  _AdicionarEmpreendimentoState createState() => _AdicionarEmpreendimentoState();
}

class _AdicionarEmpreendimentoState extends State<AdicionarEmpreendimento> {
  final _formKey = GlobalKey<FormState>();
  Empreendimento novoEmp = new Empreendimento();
  EmpreendimentoBusiness empBusiness = new EmpreendimentoBusiness();

  @override
  Widget build(BuildContext context) {
    //dados recebe os argumentos ao abrir esta tela
    //sempre rodo o build no ststate, então, se o array de dados estiver preenchido, usa ele, senão roteia pra tela
    //empreendimento = empreendimento == null ? empreendimento : ModalRoute.of(context).settings.arguments ;

    //var f = NumberFormat('###,###.00#', 'pt_BR');
    //String valorFormatado = f.format(novoEmp.valorComercialTerreno);

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
