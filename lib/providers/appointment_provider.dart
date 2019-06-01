import 'package:meta/meta.dart';
import '../infrastructure/infrastructure_lib.dart';
import '../models/models_lib.dart';

class AppointmentProvider {
  final DatabaseService _service;

  AppointmentProvider({@required DatabaseService databaseService})
      : _service = databaseService;

  Future<void> save(Appointment appointment) async {
    final db = await _service.database;
    await db.insert(appointmentTable, appointment.toMap());
  }

  Future<Appointment> get(String id) async {
    final db = await _service.database;
    List<Map<String, dynamic>> results = await db
        .query(appointmentTable, where: 'key = ?', whereArgs: [id ?? '']);
    if (results.length > 0) {
      return Appointment.fromMap(results.first);
    }
    return null;
  }
}
