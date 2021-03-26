

import 'package:cve_app/empreendimentos/entities/empreendimento.dart';

class EmpreendimentoBusiness{

  double calcularNumeroPavimentos(Empreendimento emp){
    return emp.coeficienteAproveitamento = emp.taxaOcupacao;
  }

  double calcularAreaMaximaContruida(Empreendimento emp){
    return emp.areaTerreno * emp.coeficienteAproveitamento;
  }

  double calcularCalcadasMuros(Empreendimento emp){
    return emp.cubReferencia.valor * 0.05;
  }

  double calcularFundacao(Empreendimento emp){
    return emp.cubReferencia.valor * 0.2;
  }

  double calcularPaisagismo(Empreendimento emp){
    return emp.cubReferencia.valor * 0.05;
  }

  double calcularProjetos(Empreendimento emp){
    return emp.cubReferencia.valor * 0.05;
  }

  double calcularRespTecnica(Empreendimento emp){
    return emp.cubReferencia.valor * 0.1;
  }

  double calcularTaxasAprovacoes(Empreendimento emp){
    return emp.cubReferencia.valor * 0.05;
  }

  double calcularTaxasAdministracao(Empreendimento emp){
    return emp.cubReferencia.valor * 0.2;
  }

  double calcularTaxaVendaEMkt(Empreendimento emp){
    return emp.cubReferencia.valor * 0.13;
  }

  double calcularTaxaLucroConstrutora(Empreendimento emp){
    return emp.cubReferencia.valor * 0.15;
  }

  double calcularValorComercialTerreno(Empreendimento emp){
    return emp.valorComercialTerreno * emp.coeficienteAproveitamento;
  }

  double calcularValorComercialDasConstrucoes(Empreendimento emp){
    return 0.0;
    //TODO - Vt = Vte + (Amc x Vcc)
  }

  //TODO Cálculo do PREÇO INICIAL DO VALOR DO METRO QUADRADO DO EMPREENDIMENTO (INDEPENDE DO ANDAR DO EDIFÍCIO). Pi = Vt/Amc (=R$/m²)

  double calcularValorTotal(Empreendimento emp){
    return (calcularValorComercialTerreno(emp) * calcularValorComercialDasConstrucoes(emp)) + (calcularAreaMaximaContruida(emp) * calcularValorComercialDasConstrucoes(emp));
  }
}