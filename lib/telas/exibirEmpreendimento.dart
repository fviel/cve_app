import 'package:cve_app/empreendimentos/business/empreendimentoBusiness.dart';
import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cve_app/widgets/topBar.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class ExibirEmpreendimento extends StatefulWidget {
  final Empreendimento empreendimento;

  //Construtora para receber o objeto a ser exibido
  ExibirEmpreendimento(this.empreendimento);

  @override
  _ExibirEmpreendimentoState createState() =>
      _ExibirEmpreendimentoState(this.empreendimento);
}

class _ExibirEmpreendimentoState extends State<ExibirEmpreendimento> {
  //Empreendimento empreendimento = new Empreendimento();
  EmpreendimentoBusinessSingleton empBusiness =
      EmpreendimentoBusinessSingleton();

  Empreendimento empreendimento;

  _ExibirEmpreendimentoState(this.empreendimento);

  void voltarParaAUltimaTela() {
    Navigator.pop(context, true);
  }

  String formatarPrecos(String valorFormatado) {
    if (valorFormatado.substring(0, 1) == ",") {
      return "0" + valorFormatado;
    }
    return "0" + valorFormatado;
  }

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('###,###,###.00', 'pt_BR');
    String valorFormatado = f.format(empreendimento.valorComercialTerreno);
    String valorCubFormatado = f.format(empreendimento.valorCub);
    String valorComercialTerrenoFormatado =
        f.format(empBusiness.calcularValorComercialTerreno(empreendimento));
    String valorExtraCubFormatado =
        f.format(empBusiness.calcularValoresExtraCub(empreendimento));
    String valorTotalEmpreendimentoFormatado =
        f.format(empBusiness.calcularValorTotal(empreendimento));
    String precoInicialM2Formatado = formatarPrecos(
        f.format(empBusiness.calcularPrecoInicialM2(empreendimento)));



    return WillPopScope(
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
            centerTitle: true,
            backgroundColor: Colors.red,
            // actions: <Widget>[
            //   FlatButton.icon(
            //       icon: Icon(Icons.settings,
            //         color: Colors.grey[800],
            //         size: 20.0,),
            //       label: Text('Config',
            //         style: TextStyle(
            //           fontSize: 12.0,
            //           color: Colors.grey[800],
            //         ),),
            //       onPressed: () {
            //         //widget.telaASerExibida();
            //       }),
            // ],
          ),
          body: ListView(children: <Widget>[
            Card(
              margin: EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Icon(
                                    // Icons.architecture,
                                    Icons.business,
                                    color: Colors.redAccent,
                                    size: 30.0,
                                  ),
                                ),
                                SizedBox(width: 2),
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    empreendimento.nome,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              empreendimento.descricao,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              empreendimento.endereco,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Criado em ${empreendimento.dtHrCriacao}',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 100,
                                  softWrap: false,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Divider(
                              height: 12.0,
                              thickness: 1,
                              color: Colors.red[100],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'CUB aplicado:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'R\$ $valorCubFormatado',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Área do terreno:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${empreendimento.areaTerreno} m²',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Valor do terreno:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'R\$ $valorFormatado',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Coeficiente de aproveitamento do terreno:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              empreendimento.coeficienteAproveitamento
                                  .toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Divider(
                              height: 12.0,
                              thickness: 1,
                              color: Colors.red[100],
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Área máxima construível:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${empBusiness.calcularAreaMaximaContruida(empreendimento).toString()} m²',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Valor comercial do terreno:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'R\$ $valorComercialTerrenoFormatado',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Pavimentos:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '${empBusiness.calcularNumeroPavimentos(empreendimento).toString()} pavimentos',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Valores não inclusos no CUB:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'R\$ $valorExtraCubFormatado',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Valor Total do Empreendimento:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'R\$ $valorTotalEmpreendimentoFormatado',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Preço Inicial do m²:',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'R\$ $precoInicialM2Formatado',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 100,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[500],
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32),
                                    child: TextButton.icon(
                                      icon: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        side: MaterialStateProperty.all(
                                          BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      label: Text('Compartilhar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      onPressed: () {
                                        Share.share("Relatório de cálculo de valor de empreendimento\n"+
                                            "Nome do Empreendimento: ${empreendimento.nome};\n" +
                                            "Descrição: ${empreendimento.descricao};\n" +
                                            "Endereço: ${empreendimento.endereco};\n" +
                                            "Criado em ${empreendimento.dtHrCriacao};\n" +
                                            "Valor de CUB aplicado: R\$ $valorCubFormatado;\n" +
                                            "Área do terreno: ${empreendimento.areaTerreno} m²;\n" +
                                            "Valor do terreno: R\$ $valorFormatado;\n" +
                                            "Coeficiente de aproveitamento do terreno: ${empreendimento.coeficienteAproveitamento.toString()};\n" +
                                            "Área máxima construível: ${empBusiness.calcularAreaMaximaContruida(empreendimento).toString()} m²;\n" +
                                            "Valor comercial do terreno: R\$ $valorComercialTerrenoFormatado;\n" +
                                            "Pavimentos: ${empBusiness.calcularNumeroPavimentos(empreendimento).toString()} pavimentos;\n" +
                                            "Valores não inclusos no CUB: R\$ $valorExtraCubFormatado;\n" +
                                            "Valor Total do Empreendimento: R\$ $valorTotalEmpreendimentoFormatado;\n" +
                                            "Preço Inicial do m²: R\$ $precoInicialM2Formatado;\n");
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ])),
    );
  }
}
