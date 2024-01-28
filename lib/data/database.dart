import 'package:flutter_application/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Busca o caminho das pastas do disposito para abrir um banco de dados (task.db)
//Caso o arquivo não exista, cria automaticamente
Future<Database> getDataBase () async {
  final String path = join(await getDatabasesPath(),'task.db');
  return openDatabase(path, onCreate: (db,version){db.execute(TaskDao.tableSql);
  }, version: 1,);
}