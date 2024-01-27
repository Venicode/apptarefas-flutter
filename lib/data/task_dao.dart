import 'package:flutter_application/components/task.dart';
import 'package:flutter_application/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  //Criando a tabela no banco de dados
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT,'
      '$_difficulty INTEGER,'
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'nome';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

//CRUD
//SAVE: Método para salvar os dados da tarefa
  save(Task tarefa) async {
    print("Iniciando o save: ");
    final Database bancoDeDados = await getDataBase();
    var itemExists = await find(tarefa.nome);
    Map<String,dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('A tarefa não existia.');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print("A tarefa já existe");
      return await bancoDeDados.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

//FINDALL: Buscar todas as tarefas
  Future<List<Task>> findAll() async {
    print("Acessando o fildAll: ");
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print("Procurando dados no banco de dados...");
    print("Encontrado: $result");
    return toList(result);
  }

//FIND: Buscar uma tarefa em específico
  Future<List<Task>> find(String nomeDaTarefa) async {
    print("Acessando find: ");
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    print("Tarefa encontrada: ${toList(result)}");
    return toList(result);
  }

//DELETE: Deletar uma tarefa
  delete(String nomeDaTarefa) async {
    print("Deletando uma tarefa");
    final Database bancoDeDados = await getDataBase();
    return bancoDeDados.delete(_tablename, where: '_name = ?', whereArgs: [nomeDaTarefa]);
  }

//MÉTODOS DE CONVERSÃO
//Método toList
  List<Task> toList(List<Map<String, dynamic>> mapadeTarefas) {
    print("Convertendo to List;");
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapadeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print("Lista de tarefas $tarefas");
    return tarefas;
  }

//Método toMap
  Map<String,dynamic> toMap(Task tarefa){
    print("Convertendo tarefa em Map: ");
    final Map<String,dynamic> mapadeTarefas = {};
    mapadeTarefas[_name] = tarefa.nome;
    mapadeTarefas[_difficulty] = tarefa.dificuldade;
    mapadeTarefas[_image] = tarefa.foto;
    print("Mapa de tarefas convertido");
    return mapadeTarefas;
  }
}
