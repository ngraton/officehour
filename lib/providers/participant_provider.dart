import 'package:meta/meta.dart';
import '../infrastructure/infrastructure_lib.dart';
import '../models/models_lib.dart';

class ParticipantProvider {
  final DatabaseService _service;

  ParticipantProvider({@required DatabaseService databaseService})
      : _service = databaseService;

  Future<void> save(Participant participant) async {
    final db = await _service.database;
    await db.insert(participantTable, participant.toMap());
  }

  Future<Participant> get(String id) async {
    final db = await _service.database;
    List<Map<String, dynamic>> results = await db
        .query(participantTable, where: 'key = ?', whereArgs: [id ?? '']);
    if (results.length > 0) {
      return Participant.fromMap(results.first);
    }
    return null;
  }
}
