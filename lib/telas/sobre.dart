import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:cve_app/widgets/topBar.dart';
import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {

  void voltarParaAUltimaTela() {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () {
        //caso eu queira fazer alguma ação no ato de voltar
        // do usuário, posso fazer aqui
        debugPrint('Usuário clicou no voltar');
        voltarParaAUltimaTela();
      },
      child: Scaffold(
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
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/avatar.png'),
                              radius: 50.0,
                            ),
                          ),
                        ),
                        Text(
                          'Eng. Civil Luiz Fernando Crema',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Divider(
                            height: 12.0,
                            thickness: 1,
                            color: Colors.grey[500],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '    Graduado em TECNOLOGIA DA CONSTRUÇÃO CIVIL pela Universidade Tecnológica Federal do Paraná (1986), graduação em ENGENHARIA CIVIL pela Pontifícia Universidade Católica do Paraná (1989) e mestrado em Construção Civil pela Universidade Federal do Paraná (2003). Atualmente é professor ADJUNTO II da Pontifícia Universidade Católica do Paraná e professor substituto da UNIVERSIDADE FEDERAL DO PARANÁ Tem experiência na área de Engenharia Civil, com ênfase em Engenharia Civil, atuando principalmente nos seguintes temas: integração, gestão do conhecimento, comunicação, aprendizado organizacional e cultura. Tem curso técnico em Edificações e curso de Direito em andamento. Aulas nas áreas de estruturas de concreto, aço e madeira, além de Segurança do Trabalho.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 100,
                            softWrap: false,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                'lufernandocr@gmail.com',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
          )
      ),
    );
  }
}
