import 'package:cve_app/empreendimentos/entities/empreendimento.dart';
import 'package:cve_app/utils/databasehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


//import 'dart:math' as math;

//TODO Trocar o ícone do app:
//https://stackoverflow.com/questions/43928702/how-to-change-the-application-launcher-icon-on-flutter
//TODO Pesquisar como usar controller? qual a vantagem?
///https://stackoverflow.com/questions/53667793/what-are-controllers-in-flutter#:~:text=In%20flutter%2C%20controllers%20are%20a,pattern%20stuff%20and%20increase%20performances.
//TODO Pesquisar sobre o dispose() para evitar memory leak

class AdicionarEmpreendimento extends StatefulWidget {

  @override
  _AdicionarEmpreendimentoState createState() => _AdicionarEmpreendimentoState();
}

class _AdicionarEmpreendimentoState extends State<AdicionarEmpreendimento> {
  static const _locale='pt_BR';
  //helper do db para chamar o métodos
  final DatabaseHelper dbHelper = DatabaseHelper();

  //formKey desta tela
  final _formKey = GlobalKey<FormState>();

  String nome ="";
  String descricao ="";
  String endereco ="";
  String valorCub ="";
  String areaTerreno ="";
  String taxaOcupacao ="";
  String coeficienteAproveitamento ="";
  String valorComercialTerreno ="";

  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController descricaoCtrl = TextEditingController();
  TextEditingController enderecoCtrl = TextEditingController();
  TextEditingController valorCubCtrl = TextEditingController();
  TextEditingController areaTerrenoCtrl = TextEditingController();
  TextEditingController taxaOcupacaoCtrl = TextEditingController();
  TextEditingController coeficienteAproveitamentoCtrl = TextEditingController();
  TextEditingController valorComercialTerrenoCtrl = TextEditingController();

  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(double.parse(s));
  //String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;
  String get currency => NumberFormat.compactSimpleCurrency(locale: _locale, decimalDigits: 2).currencySymbol;

  //Método Build() usando métodos separados, fica mais limpo o código
  @override
  Widget build(BuildContext context) {
    //atualiza minhas controllers com os dados recebidos da telas de listar

    nomeCtrl.text = nome;
    descricaoCtrl.text = descricao;
    enderecoCtrl.text = endereco;
    valorCubCtrl.text = valorCub;
    areaTerrenoCtrl.text = areaTerreno;
    taxaOcupacaoCtrl.text = taxaOcupacao;
    coeficienteAproveitamentoCtrl.text = coeficienteAproveitamento;
    valorComercialTerrenoCtrl.text = valorComercialTerreno;

    //https://stackoverflow.com/questions/55790689/how-to-get-input-of-text-controller-as-a-double-flutter
    return WillPopScope(
      onWillPop: () {
        //caso eu queira fazer alguma ação no ato de voltar
        // do usuário, posso fazer aqui
        debugPrint('Usuário clicou no voltar');
        voltarParaAUltimaTela();
      },
      child: Scaffold(
        appBar: getAppBar(),
        body: getEmpreendimentoListView(),
      ),
    );
  }

  ///-----------------------

  ///Método para retornar a lista de cards
  Padding getEmpreendimentoListView() {
    //define um estilo de texto
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    textStyle = textStyle.merge(TextStyle(color:Colors.grey[700]));


    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextFormField(
                controller: nomeCtrl,
                maxLength: 255,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Informe o nome';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  //icon: Icon(Icons.apartment),
                  //focusColor: Colors.purpleAccent,isCollapsed: false,
                  //fillColor: Colors.purple,
                  //   prefixText: 'foo',
                  //   suffixText: 'lala',

                    labelText: "Nome",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      gapPadding: 10.0,
                    )),
                style: textStyle,
                onChanged: (valor) {
                  //debugPrint('Alterado o nome para: $valor');
                  updateTitulo();
                },
              ),
            ),


            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextFormField(
                controller: descricaoCtrl,
                maxLength: 255,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Informe uma descrição';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Descrição",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      gapPadding: 10.0,
                    )),
                style: textStyle,
                onChanged: (valor) {
                  //debugPrint('Alterada a descrição para: $valor');
                  //como estou usando a controller, não preciso passar o valor pra função
                  updateDescricao();
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextFormField(
                controller: enderecoCtrl,
                maxLength: 255,
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Informe um endereço';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: "Endereço",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      gapPadding: 10.0,
                    )),
                style: textStyle,
                onChanged: (valor) {
                  //debugPrint('Alterado o endereço para: $valor');
                  //como estou usando a controller, não preciso passar o valor pra função
                  updateEndereco();
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                //inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  CurrencyPtBrInputFormatter()
                ],
                controller: valorCubCtrl,
                maxLength: 15,
                validator: (val) {
                  if ((val.isEmpty) || (double.parse(val.replaceAll('.', '').replaceAll(',', '.'))<=0)) {
                    return 'Informe um valor válido para o CUB';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    counterText: "",
                    prefixText: 'R\$',
                    labelText: "Valor do CUB",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      gapPadding: 10.0,
                    )),
                style: textStyle,
                onChanged: (valor) {
                  //debugPrint('Alterado o valor do CUB para: $valor');
                  //como estou usando a controller, não preciso passar o valor pra função
                  updateValorCub();
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
                controller: areaTerrenoCtrl,
                maxLength: 15,
                validator: (val) {
                  if ((val.isEmpty) || (double.parse(val)<=0)) {
                    return 'Informe uma área válida do terreno em m²';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    counterText: "",
                    labelText: "Área do terreno em m²",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      gapPadding: 10.0,
                    )),
                style: textStyle,
                onChanged: (valor) {
                  //debugPrint('Alterada a área do terreno para: $valor');
                  //como estou usando a controller, não preciso passar o valor pra função
                  updateAreaTerreno();
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
                controller: taxaOcupacaoCtrl,
                maxLength: 15,
                validator: (val) {
                  if ((val.isEmpty) || (double.parse(val)<=0)) {
                    return 'Informe uma taxa de ocupação válida';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    counterText: "",
                    labelText: "Taxa de ocupação",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      gapPadding: 10.0,
                    )),
                style: textStyle,
                onChanged: (valor) {
                  //debugPrint('Alterada a taxa de ocupação para: $valor');
                  //como estou usando a controller, não preciso passar o valor pra função
                  updateTaxaOcupacao();
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
                controller: coeficienteAproveitamentoCtrl,
                maxLength: 15,
                validator: (val) {
                  if ((val.isEmpty) || (double.parse(val)<=0)) {
                    return 'Informe um coeficiente de aproveitamento válido';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    counterText: "",
                    labelText: "Coeficiente de aproveitamento",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      gapPadding: 10.0,
                    )),
                style: textStyle,
                onChanged: (valor) {
                  //debugPrint('Alterada o coeficiente de aproveitamento para: $valor');
                  //como estou usando a controller, não preciso passar o valor pra função
                  updateCoeficienteDeAproveitamento();
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                //inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),],
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                  CurrencyPtBrInputFormatter()
                ],
                controller: valorComercialTerrenoCtrl,
                maxLength: 15,
                validator: (val) {
                  if ((val.isEmpty) || (double.parse(val.replaceAll('.', '').replaceAll(',', '.'))<=0)) {
                    return 'Informe um valor comercial válido em R\$';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    counterText: "",
                  prefixText: 'R\$',
                    labelText: "Valor comercial do terreno em R\$",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      gapPadding: 10.0,
                    )),
                style: textStyle,
                onChanged: (valor) {
                  //debugPrint('Alterado o valor comercial do terreno para: $valor');
                  //como estou usando a controller, não preciso passar o valor pra função
                  updateValorComercialTerreno();
                },
              ),
            ),


            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: TextButton(
                          style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),

                        child: Text('Salvar',
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold,
                        )),

                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              //debugPrint('Usuário clicou em salvar');
                              _saveUpdate();
                            });
                          }
                        },
                      ),
                    ),

                  ),
                  // Expanded(
                  //   child: TextButton(
                  //     child: Text('Excluir'),
                  //     onPressed: () {
                  //       setState(() {
                  //         debugPrint('Usuário clicou em excluir');
                  //         _excluir();
                  //       });
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //retorna o appBar da tela
  /// Totalmente desnecessário o iconButton, o appBar já faria o pop
  /// automaticamente, mas fiz para poder brincar de retornar outros
  /// itens da stack
  AppBar getAppBar() {
    return AppBar(
      title: Text('Novo empreendimento'),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        onPressed: () async {
          voltarParaAUltimaTela();
        },
      ),
    );
  }

  void voltarParaAUltimaTela() {
    Navigator.pop(context, true);
  }

  void updateTitulo() {
    nome = nomeCtrl.text;
  }

  void updateDescricao() {
    descricao = descricaoCtrl.text;
  }
  void updateEndereco(){
    endereco = enderecoCtrl.text;
  }
  void updateValorCub(){
    valorCub = valorCubCtrl.text;
  }
  void updateAreaTerreno(){
    areaTerreno = areaTerrenoCtrl.text;
  }
  void updateTaxaOcupacao(){
    taxaOcupacao = taxaOcupacaoCtrl.text;
  }
  void updateCoeficienteDeAproveitamento(){
    coeficienteAproveitamento = coeficienteAproveitamentoCtrl.text;
  }
  void updateValorComercialTerreno(){
    valorComercialTerreno = valorComercialTerrenoCtrl.text;
  }


  void _saveUpdate() async {
    //não precisa dessas dialogs, pois estou validando o form
    // if (empreendimento.nome == null || empreendimento.nome.length == 0) {
    //   _showAlertDialog('Empreendimentos', 'Informe um nome válido');
    //   return;
    // }
    //
    // if (empreendimento.descricao == null || empreendimento.descricao.length == 0) {
    //   _showAlertDialog('Empreendimentos', 'Informe uma descrição válida');
    //   return;
    // }
    //
    // if (empreendimento.endereco == null || empreendimento.endereco.length == 0) {
    //   _showAlertDialog('Empreendimentos', 'Informe um endereço válido');
    //   return;
    // }

    Empreendimento empreendimento = new Empreendimento('', '', '', 0, 0, 0, 0, 0);
    //aqui, eu preencho o objeto convertyendo as final String nos valores de verdade!
    //double.parse(
    empreendimento.nome = nome;
    empreendimento.descricao = descricao;
    empreendimento.endereco = endereco;
    empreendimento.valorCub = double.parse(valorCub.replaceAll('.', '').replaceAll(',', '.'));
    empreendimento.areaTerreno = double.parse(areaTerreno);
    empreendimento.taxaOcupacao = double.parse(taxaOcupacao);
    empreendimento.coeficienteAproveitamento = double.parse(coeficienteAproveitamento);
    empreendimento.valorComercialTerreno = double.parse(valorComercialTerreno.replaceAll('.', '').replaceAll(',', '.'));

    voltarParaAUltimaTela();

    //adiciona a data atomática
    empreendimento.dtHrCriacao = DateFormat.yMMMd().format(DateTime.now());
    int resultado;
    if (empreendimento.id != null) {
      //UPDATE
      resultado = await dbHelper.update(empreendimento);
    } else {
      //INSERT
      resultado = await dbHelper.insert(empreendimento);
    }

    if (resultado != 0) {
      //sucesso
      _showAlertDialog('Empreendimento', 'Novo empreendimento adicionado com sucesso');
    } else {
      //falha
      _showAlertDialog('Empreendimento', 'Falha ao adicionar empreendimento');
    }
  }

  void _showAlertDialog(String titulo, String conteudo) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(titulo),
      content: Text(conteudo),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog,
    );
  }

  // void _showSnackBar(BuildContext context, String mesg) {
  //   final snackBar = SnackBar(content: Text(mesg));
  //   //Scaffold.of(context).showSnackBar(snackbar); // deprecado!
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  // void _excluir() async {
  //   voltarParaAUltimaTela();
  //
  //   //se o usuário tentar excluir uma anotação nova (sem sentido) ele veio para esta tela pelo FAB
  //   if (empreendimento.id == null) {
  //     _showAlertDialog('Empreendimento', 'Nenhum empreendimento excluído');
  //     return;
  //   } else {
  //     //usuário está tentando excluir uma anotação existente
  //     int resultado = await dbHelper.delete(empreendimento.id);
  //     if (resultado != 0) {
  //       //sucesso
  //       _showAlertDialog('Empreendimento', 'Empreendimento excluído com sucesso');
  //     } else {
  //       //falha
  //       _showAlertDialog('Empreendimento', 'Falha ao excluir empreendimento');
  //     }
  //   }
  // }
}

class CurrencyPtBrInputFormatter extends TextInputFormatter {

  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.selection.baseOffset == 0){
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = new NumberFormat("#,##0.00", "pt_BR");
    //String newText = "R\$ " + formatter.format(value/100);
    String newText = formatter.format(value/100);


    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}
