//import 'package:cve_app/gestorcub/entities/cub.dart';
import 'package:cve_app/shared/dominios.dart';

///Empreendimento é uma construção, um imóvel, logo tem dados de um imóvel
class Empreendimento{
  int _id;
  String _nome;
  String _descricao;
  String _endereco;
  String _dtHrCriacao;
  //O Cub referência é definido em função da quantidade de pavimentos e outros
  // itens. Deixar pro usuário informar
  //desativei, pois não achei um ws que informa este valor
  //Cub cubReferencia;
  double _valorCub;
  //At
  double _areaTerreno;
  //To
  double _taxaOcupacao;
  //Ca
  double _coeficienteAproveitamento;
  //Vct
  double _valorComercialTerreno;

  ///---------
  Empreendimento.withId(
    this._id,
    this._nome,
    this._descricao,
    this._endereco,
    this._valorCub,
    this._areaTerreno,
    this._taxaOcupacao,
    this._coeficienteAproveitamento,
    this._valorComercialTerreno);

  //3 strings e 5 doubles
  Empreendimento(
      this._nome,
      this._descricao,
      this._endereco,
      this._valorCub,
      this._areaTerreno,
      this._taxaOcupacao,
      this._coeficienteAproveitamento,
      this._valorComercialTerreno);

  int get id => _id;

  set id(int value) {
    _id = value;
  } //-----------------------------------------------

  String get nome => _nome;

  set nome(String value) {
    if (value.length <= TAM_MAX_NOME) {
      _nome = value;
    } else {
      _nome = value.substring(0, TAM_MAX_NOME);
    }
  }

  String get descricao => _descricao;

  set descricao(String value) {
    if (value.length <= TAM_MAX_DESCRICAO) {
      _descricao = value;
    } else {
      _descricao = value.substring(0, TAM_MAX_DESCRICAO);
    }
  }

  String get endereco => _endereco;

  set endereco(String value) {
    if (value.length <= TAM_MAX_ENDERECO) {
      _endereco = value;
    } else {
      _endereco = value.substring(0, TAM_MAX_ENDERECO);
    }
  }

  String get dtHrCriacao => _dtHrCriacao;

  //será preenchido pelo sistema, não precisa validar
  set dtHrCriacao(String value) {
    _dtHrCriacao = value;
  }

  double get valorCub => _valorCub;

  set valorCub(double value) {
    if(value < 0) {
      value = 0;
    }
    _valorCub = value;
  }

  double get areaTerreno => _areaTerreno;

  set areaTerreno(double value) {
    if(value < 0) {
      value = 0;
    }
    _areaTerreno = value;
  }

  double get taxaOcupacao => _taxaOcupacao;

  set taxaOcupacao(double value) {
    if(value < 0) {
      value = 0;
    }
    _taxaOcupacao = value;
  }

  double get coeficienteAproveitamento => _coeficienteAproveitamento;

  set coeficienteAproveitamento(double value) {
    if(value < 0) {
      value = 0;
    }
    _coeficienteAproveitamento = value;
  }

  double get valorComercialTerreno => _valorComercialTerreno;

  set valorComercialTerreno(double value) {
    if(value < 0) {
      value = 0;
    }
    _valorComercialTerreno = value;
  }

  ///Converte this em map, para usar no BD
  ///o segundo parm é dynamic, pois o map está mapeando para
  ///string e int, ou seja, se fosse só para String, podia
  ///ser map<String, String>
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['nome'] = _nome;
    map['descricao'] = _descricao;
    map['endereco'] = _endereco;
    map['dtHrCriacao'] = _dtHrCriacao;
    map['valorCub'] = _valorCub;
    map['areaTerreno'] = _areaTerreno;
    map['taxaOcupacao'] = _taxaOcupacao;
    map['coeficienteAproveitamento'] = _coeficienteAproveitamento;
    map['valorComercialTerreno'] = _valorComercialTerreno;
    return map;
  }

  ///Named constructor que extrai o dataset do BD, que
  ///sempre é um map
  Empreendimento.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this._nome = map['nome'];
    this._descricao = map['descricao'];
    this._endereco = map['endereco'];
    this._dtHrCriacao = map['dtHrCriacao'];
    this._valorCub = map['valorCub'];
    this._areaTerreno = map['areaTerreno'];
    this._taxaOcupacao = map['taxaOcupacao'];
    this._coeficienteAproveitamento = map['coeficienteAproveitamento'];
    this._valorComercialTerreno = map['valorComercialTerreno'];
  }
}