import 'package:flutter_application/components/task.dart';

class TaskDao{
  //Criando a tabela no banco de dados
static const String tableSql = 'CREATE TABLE $_tablename('
 '$_name TEXT,'
  '$_difficulty INTEGER,'
  '$_image TEXT)';

static const String _tablename = 'taskTable';
static const String _name = 'nome';
static const String _difficulty = 'dificuldade';
static const String _image = 'imagem';

//Método para salvar os dados da tarefa
save(Task tarefa) async{}
//Buscar todas as tarefas
//Future<List<Task>> findAll() async{}
//Buscar uma tarefa em específico
find(String nomeDaTarefa) async{}
//Deletar uma tarefa
delete(String nomeDaTarefa) async{}
}
