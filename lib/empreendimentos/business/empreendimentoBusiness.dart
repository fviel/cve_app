import 'package:cve_app/empreendimentos/entities/empreendimento.dart';


//TODO Avaliar a conversão desta classe para um singleton:
// class Singleton {
//   static final Singleton _singleton = Singleton._internal();
//
//   factory Singleton() {
//     return _singleton;
//   }
//
//   Singleton._internal();
// }
// You can construct it like this
//
// main() {
//   var s1 = Singleton();
//   var s2 = Singleton();
//   print(identical(s1, s2));  // true
//   print(s1 == s2);           // true
// }

///Implementação das fórmulas de cálculo com base no artigo
///do Sr. Fernando de Mar/21
class EmpreendimentoBusinessSingleton{
  static final EmpreendimentoBusinessSingleton _singleton = EmpreendimentoBusinessSingleton._internal();

  factory EmpreendimentoBusinessSingleton() {
    return _singleton;
  }

  EmpreendimentoBusinessSingleton._internal();

  //1
  double calcularAreaMaximaContruida(Empreendimento emp){
    return emp.areaTerreno * emp.coeficienteAproveitamento;
  }

  //2
  double calcularValorComercialTerreno(Empreendimento emp){
    return emp.valorComercialTerreno * emp.coeficienteAproveitamento;
  }

  //3
  double calcularNumeroPavimentos(Empreendimento emp){
    return emp.coeficienteAproveitamento = emp.taxaOcupacao;
  }

  //4
  //Em função do número de pavimentos, obter a referência de cub correta.
  //Esta informação será fornecida pelo usuário, juntamente com o padrão

  //5
  //Calcular todos os valores extra-CUB
  //5.1.
  double calcularCalcadasMuros(Empreendimento emp){
    return emp.valorCub * 0.05;
  }

  //5.2
  double calcularFundacao(Empreendimento emp){
    return emp.valorCub * 0.2;
  }

  //5.3
  double calcularPaisagismo(Empreendimento emp){
    return emp.valorCub * 0.05;
  }

  //5.4
  double calcularProjeto(Empreendimento emp){
    return emp.valorCub * 0.05;
  }

  //5.5
  double calcularRespTecnica(Empreendimento emp){
    return emp.valorCub * 0.1;
  }

  //5.6
  double calcularTaxasAprovacoes(Empreendimento emp){
    return emp.valorCub * 0.05;
  }

  //5.7
  double calcularTaxasAdministracao(Empreendimento emp){
    return emp.valorCub * 0.2;
  }

  //5.8
  double calcularTaxaVendaEMkt(Empreendimento emp){
    return emp.valorCub * 0.13;
  }

  //5.9
  double calcularLucroConstrutora(Empreendimento emp){
    return emp.valorCub * 0.15;
  }

  //5.10
  //VCC é a soma de todos os valores extra-CUB
  double calcularValoresExtraCub(Empreendimento emp){
    double calcadasMuros = calcularCalcadasMuros(emp);
    double fundacao = calcularFundacao(emp);
    double paisagismo = calcularPaisagismo(emp);
    double projeto = calcularProjeto(emp);
    double respTec = calcularRespTecnica(emp);
    double taxasAprov = calcularTaxasAprovacoes(emp);
    double taxasAdm = calcularTaxasAdministracao(emp);
    double taxaVendaMkt = calcularTaxaVendaEMkt(emp);
    double lucro = calcularLucroConstrutora(emp);

    return (calcadasMuros
    +fundacao
    +paisagismo
    +projeto
    +respTec
    +taxasAprov
    +taxasAdm
    +taxaVendaMkt
    +lucro);
  }

  //6
  double calcularValorTotal(Empreendimento emp){
    //Vte = valor do terreno no empreendimento = Vct x CA
    //Vt = Vte + (Amc x Vcc)
    return (calcularValorComercialTerreno(emp) * emp.coeficienteAproveitamento) + (calcularAreaMaximaContruida(emp) * calcularValoresExtraCub(emp));
  }

  //7
  double calcularPrecoInicialM2(Empreendimento emp){
    //Pi = Vt/Amc (=R$/m²)
    return (emp.valorComercialTerreno / calcularAreaMaximaContruida(emp));
  }
}