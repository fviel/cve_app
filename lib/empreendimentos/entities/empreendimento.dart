//import 'package:cve_app/gestorcub/entities/cub.dart';

///Empreendimento é uma construção, um imóvel, logo tem dados de um imóvel
class Empreendimento{

  int id;
  String nome;
  String descricao;
  String endereco;
  DateTime dtHrCriacao;

  //O Cub referência é definido em função da quantidade de pavimentos e outros itens. Deixar pro usuário informar
  //desativei, pois não achei um ws que informa este valor
  //Cub cubReferencia;
  double valorCub;
  //At
  double areaTerreno;
  //To
  double taxaOcupacao;
  //Ca
  double coeficienteAproveitamento;
  //Vct
  double valorComercialTerreno;

  Empreendimento({
    this.id,
    this.nome,
    this.descricao,
    this.endereco,
    this.valorCub,
    this.areaTerreno,
    this.taxaOcupacao,
    this.coeficienteAproveitamento,
    this.valorComercialTerreno}){
    this.dtHrCriacao = DateTime.now();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'endereco': endereco,
      'valorCub': valorCub,
      'areaTerreno': areaTerreno,
      'taxaOcupacao': taxaOcupacao,
      'coeficienteAproveitamento': coeficienteAproveitamento,
      'valorComercialTerreno': valorComercialTerreno,
    };
  }



  @override
  String toString() {
    return 'Empreendimento{nome: $nome, descricao: $descricao, endereco: $endereco, dtHrCriacao: $dtHrCriacao, valorCub: $valorCub, areaTerreno: $areaTerreno, taxaOcupacao: $taxaOcupacao, coeficienteAproveitamento: $coeficienteAproveitamento, valorComercialTerreno: $valorComercialTerreno}';
  }
}