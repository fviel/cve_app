import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:cve_app/empreendimentos/entities/empreendimento.dart';

class DatabaseHelper {
  //Singleton DatabaseHelper
  static DatabaseHelper _databaseHelper;

  //Singleton do DB
  static Database _database;

  //Definição dos nomes das colunas e vars do meu db
  final String nomeTabela = 'tb_empreendimento';
  final String colId = 'id';
  final String colNome = 'nome';
  final String colDescricao = 'descricao';
  final String colEndereco = 'endereco';
  final String colDtHrCriacao = 'dtHrCriacao';
  final String colValorCub = 'valorCub';
  final String colAreaTerreno = 'areaTerreno';
  final String colTaxaOcupacao = 'taxaOcupacao';
  final String colCoeficienteAproveitamento = 'coeficienteAproveitamento';
  final String colValorComercialTerreno = 'valorComercialTerreno';

  ///Named cosntructor, apenas para criar esta instancia pela var acima e
  ///poder ser usado na factory
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    ///se null a minha var static deste singleton, chama o named constructor
    ///para criar minha instancia atual
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
      print('singleton do dbhelper criado...');
    }
    return _databaseHelper;
  }

  //-----------------------------------------------------------
  //Bloco de métodos para criar o DB e retornar sua instancia
  //-----------------------------------------------------------

  ///Retorna a instancia do singleton do meu database,
  ///instancia se necessário
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  //Inicializa o database
  Future<Database> initializeDatabase() async {
    //1. Obter o path para o arquivo do DB usando o plugin path
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'empreendimentos.db';

    //Abre e cria o db
    var EmpreendimentosDb = await openDatabase(path, onCreate: _createDb, version: 1);
    return EmpreendimentosDb;
  }

  ///Cria a tabela
  void _createDb(Database db, int newVersion) async {
    //roda o SQL de create table
    await db.execute('CREATE TABLE $nomeTabela('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colNome TEXT,'
        '$colDescricao TEXT,'
        '$colEndereco TEXT,'
        '$colDtHrCriacao TEXT,'
        '$colValorCub REAL,'
        '$colAreaTerreno REAL,'
        '$colTaxaOcupacao REAL,'
        '$colCoeficienteAproveitamento REAL,'
        '$colValorComercialTerreno REAL'
        ')');
  }

  //E se eu tivesse que criar mais tabelas?
  ///await db.execute('''
  //       create table $reminderTable (
  //         $columnReminderId integer primary key autoincrement,
  //         $columnReminderCarId integer not null,
  //         $columnReminderName text not null,
  //         $columnReminderNotifyMileage integer not null,
  //         $columnReminderEndMileage integer not null
  //        )''');
  // await db.execute('''
  //        create table $carTable (
  //         $columnCarId integer primary key autoincrement,
  //         $columnCarTitle text not null
  //        )''');


//-----------------------------------------------------------
//Bloco de métodos para realizar operações no BD
//-----------------------------------------------------------


//Fetch - Obtem todos os elementos da tabela, ou seja, um list de Map's
  Future<List<Map<String, dynamic>>> listarTodosEmpreendimentosOrdenandoPorNome() async {
    Database db = await this.database;

    ///Há duas formas de rodar as queries no sqflite, raw comando ou por métodos, passando parms, exemplos:
    ///db.rawQuery('SELECT * FROM $EmpreendimentoTable');
    ///ou
    ///db.query('$EmpreendimentoTable');
    ///...
    ///db.insert(parm1, parm2 ...) VS db.rawInsert(...)
    ///db.delete(parm1, parm2 ...) VS db.rawDelete(...)
    ///db.update(parm1, parm2 ...) VS db.rawUpdate
    ///Tanto faz, dá na mesma...
    //Forma 1 de montar a query - SQL completo na mão
    //var resultadoForma1 = await db.rawQuery('SELECT * FROM $EmpreendimentoTable ORDER BY $colPrioridade ASC');

    //Forma 2 de montar a query - usando métodos prontos
    var resultadoForma2 =
    await db.query(nomeTabela, orderBy: '$colNome ASC');
    return resultadoForma2;
  }

  Future<List<Empreendimento>> getListaEmpreendimentos() async{
    var EmpreendimentoMapList = await listarTodosEmpreendimentosOrdenandoPorNome();
    int count = EmpreendimentoMapList.length;
    List<Empreendimento> EmpreendimentoList= <Empreendimento>[];
    for(int i = 0; i < count; i++){
      EmpreendimentoList.add(Empreendimento.fromMapObject(EmpreendimentoMapList[i]));
    }
    return EmpreendimentoList;
  }

//Insert
  Future<int> insert(Empreendimento Empreendimento) async {
    Database db = await this.database;
    var resultado = await db.insert(nomeTabela, Empreendimento.toMap());
    return resultado;
  }

//Update
  Future<int> update(Empreendimento Empreendimento) async {
    Database db = await this.database;
    var resultado = await db.update(nomeTabela, Empreendimento.toMap(),
        where: '$colId = ?', whereArgs: [Empreendimento.id]);
    return resultado;
  }

//Delete
  Future<int> delete(int id) async {
    Database db = await this.database;
    var resultado =
    await db.delete(nomeTabela, where: '$colId = ?', whereArgs: [id]);
    //var resultado = await db.rawDelete('DELETE FROM $EmpreendimentoTable WHERE $colId = $id');
    return resultado;
  }

//Count
  Future<int> count() async {
    Database db = await this.database;
    List<Map<String, dynamic>> contagem =
    await db.rawQuery('SELECT COUNT (*) FROM $nomeTabela');
    int resultado = Sqflite.firstIntValue(contagem);
    return resultado;
  }
}