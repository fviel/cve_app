//import 'package:meta/meta.dart';
//TODO aprender como gerar o id do objeto, pelo que entendi é esse get na var hashcode
//TODO aprender como fazer a sobrecarga do operador ==, conforme site https://stackoverflow.com/questions/59474307/error-either-zero-or-2-or-more-dropdownmenuitems-were-detected-with-the-same
//Representa um valor de CUB informado pelo sinduscon
class Cub {

  external int get hashCode;
  String padrao;
  String classificacao;
  double valor;
  ///Possíveis tipos de projeto
  /// 0 - Residencial
  /// 1 - Comercial - CAL/CSL
  /// 2 - Galpão industrial e Residência popular - GI e RP1Q
  int tipoProjeto;
  String estado;
  bool desonerado;

  Cub({this.padrao,
    this.classificacao,
    this.valor,
    this.tipoProjeto,
    this.estado,
    this.desonerado});

  //sobrescrita do operador ==
  bool operator ==(dynamic other) => other != null && other is Cub && this.classificacao == other.classificacao;

  // @override
  // int get hashCode => super.hashCode;

  // Message({@required this.hashCode}) {
  //   assert(hashCode != null);
  // }
}