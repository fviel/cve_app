
import 'package:cve_app/gestorcub/entities/cub.dart';

///Empreendimento é uma construção, um imóvel, logo tem dados de um imóvel
class Empreendimento{

  String nome;
  String descricao;
  String endereco;
  DateTime dtHrCriacao;

  //O Cub referência é definido em função da quantidade de pavimentos e outros itens. Deixar pro usuário informar
  Cub cubReferencia;
  //At
  double areaTerreno;
  //To
  double taxaOcupacao;
  //Ca
  double coeficienteAproveitamento;

  double valorComercialTerreno;




}