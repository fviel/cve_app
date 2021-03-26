import 'package:cve_app/gestorcub/entities/cub.dart';
import 'package:cve_app/gestorcub/entities/tabelaMensalCub.dart';

class CubBusiness {
  /// Método para interpretar o valor do tipoProjeto do cub
  String obterDescricaoTipoProjeto(int tipoProjeto) {
    switch (tipoProjeto) {
      case 0:
        {
          return "Residenciais";
        }
      case 1:
        {
          return "Comerciais CAL (Comercial Andares Livres) e CSL (Comercial Salas e Lojas)";
        }
      case 2:
        {
          return "GALPÃO INDUSTRIAL (GI) E RESIDÊNCIA POPULAR (RP1Q)";
        }
      default:
        {
          return "Residenciais";
        }
    }
  }

  ///Carrega os valores de testes, apenas para ter como trabalhar
  TabelaMensalCub preencherValoresIniciais() {
    List<Cub> cubs;
    //padrão residencial
    Cub cub1 = new Cub(
        padrao: 'Baixo', classificacao: 'R-1', valor: 1716.84, tipoProjeto: 0);
    Cub cub2 = new Cub(
        padrao: 'Baixo', classificacao: 'PP-4', valor: 1594.51, tipoProjeto: 0);
    Cub cub3 = new Cub(
        padrao: 'Baixo', classificacao: 'R-8', valor: 1520.05, tipoProjeto: 0);
    Cub cub4 = new Cub(
        padrao: 'Baixo', classificacao: 'PIS', valor: 1217.35, tipoProjeto: 0);
    cubs.add(cub1);
    cubs.add(cub2);
    cubs.add(cub3);
    cubs.add(cub4);

    Cub cub5 = new Cub(
        padrao: 'Normal', classificacao: 'R-1', valor: 2136.21, tipoProjeto: 0);
    Cub cub6 = new Cub(
        padrao: 'Normal',
        classificacao: 'PP-4',
        valor: 2012.48,
        tipoProjeto: 0);
    Cub cub7 = new Cub(
        padrao: 'Normal', classificacao: 'R-8', valor: 1739.03, tipoProjeto: 0);
    Cub cub8 = new Cub(
        padrao: 'Normal',
        classificacao: 'R-16',
        valor: 1684.05,
        tipoProjeto: 0);
    cubs.add(cub5);
    cubs.add(cub6);
    cubs.add(cub7);
    cubs.add(cub8);

    Cub cub9 = new Cub(
        padrao: 'Alto', classificacao: 'R-1', valor: 2504.88, tipoProjeto: 0);
    Cub cub10 = new Cub(
        padrao: 'Alto', classificacao: 'R-8', valor: 2072.53, tipoProjeto: 0);
    Cub cub11 = new Cub(
        padrao: 'Alto', classificacao: 'R-16', valor: 2166.16, tipoProjeto: 0);
    cubs.add(cub9);
    cubs.add(cub10);
    cubs.add(cub11);

    //padrão comercial
    Cub cub12 = new Cub(
        padrao: 'Normal',
        classificacao: 'CAL-8',
        valor: 1997.09,
        tipoProjeto: 1);
    Cub cub13 = new Cub(
        padrao: 'Normal',
        classificacao: 'CSL-8',
        valor: 1724.69,
        tipoProjeto: 1);
    Cub cub14 = new Cub(
        padrao: 'Normal',
        classificacao: 'CSL-16',
        valor: 2315.45,
        tipoProjeto: 1);
    cubs.add(cub12);
    cubs.add(cub13);
    cubs.add(cub14);

    Cub cub15 = new Cub(
        padrao: 'Alto', classificacao: 'CAL-8', valor: 2136.21, tipoProjeto: 1);
    Cub cub16 = new Cub(
        padrao: 'Alto', classificacao: 'CSL-8', valor: 1902.06, tipoProjeto: 1);
    Cub cub17 = new Cub(
        padrao: 'Alto',
        classificacao: 'CSL-16',
        valor: 2550.00,
        tipoProjeto: 1);
    cubs.add(cub15);
    cubs.add(cub16);
    cubs.add(cub17);

    //padrão industrial
    Cub cub18 = new Cub(
        padrao: 'Normal',
        classificacao: 'RP1Q',
        valor: 1813.90,
        tipoProjeto: 2);
    Cub cub19 = new Cub(
        padrao: 'Normal', classificacao: 'GI', valor: 947.95, tipoProjeto: 2);
    cubs.add(cub18);
    cubs.add(cub19);

    return new TabelaMensalCub(cubs: cubs, dtHtRefTabela: DateTime.now());
  }
}
