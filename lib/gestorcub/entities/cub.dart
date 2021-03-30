
//Representa um valor de CUB informado pelo sinduscon
class Cub {
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
}