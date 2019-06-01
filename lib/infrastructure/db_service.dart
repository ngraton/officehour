import 'package:sqflite/sqflite.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'infrastructure_lib.dart';

class DatabaseService {
  static Logger log = Logger('Database Service');
  static DbDefinitions createTableCommands = DbDefinitions();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  Future<Database> initDb() async {
    // Sqflite.devSetDebugModeOn(true);
    String dbPath = await getDatabasesPath();
    String documentPath = join(dbPath, sqlDatabaseName);

    return await openDatabase(documentPath, version: 1, onOpen: (db) async {
      log.config('database found, opening it...');
    }, onCreate: (Database db, int version) async {
      log.config('database not found, created it...');
      createTableCommands.definitions.forEach((table, command) async {
        await db
            .execute(command)
            .then((_) => log.config('Creating $table table'))
            .catchError((e) => log.shout('Error creating $table table: $e'));
      });
    });
  }

  Future<void> createTable(String tableName) async {
    final db = await database;
    var command = createTableCommands.definitions[tableName];
    await db
        .execute(command)
        .then((_) => log.config('Creating $tableName table'))
        .catchError((e) => log.shout('Error creating $tableName table: $e'));
  }

  Future<void> dropTable(String tableName) async {
    final db = await database;
    String command = ('DROP TABLE $tableName');
    await db
        .execute(command)
        .then((_) => log.config('Dropping $tableName table'))
        .catchError((e) => log.shout('Error dropping $tableName table: $e'));
  }
}
